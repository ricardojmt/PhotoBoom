import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class PbRetos extends StatefulWidget {
  const PbRetos({super.key});
  static String id = "pb_retos";
  @override
  State<PbRetos> createState() => _PbRetosState();
}

class _PbRetosState extends State<PbRetos> {
  XFile? _image;
  Uint8List? _webImage;
  CameraController? _cameraController;
  List<CameraDescription> _cameras = [];
  bool _isCameraInitialized = false;
  bool _isCameraActive = false;

  @override
  void initState() {
    super.initState();
    // _initializeCamera(); // opcional si quieres activar al entrar
  }

  Future<void> _initializeCamera() async {
    var cameraStatus = await Permission.camera.status;
    var microphoneStatus = await Permission.microphone.status;

    if (cameraStatus.isDenied || microphoneStatus.isDenied) {
      final statuses = await [
        Permission.camera,
        Permission.microphone,
      ].request();

      cameraStatus = statuses[Permission.camera]!;
      microphoneStatus = statuses[Permission.microphone]!;

      if (cameraStatus.isPermanentlyDenied ||
          microphoneStatus.isPermanentlyDenied) {
        if (mounted) {
          _mostrarError('Permisos de cámara o micrófono denegados permanentemente. Por favor, habilítelos desde la configuración de la aplicación.');
        }
        await openAppSettings();
        return;
      }
      if (cameraStatus.isDenied || microphoneStatus.isDenied) {
        if (mounted) {
          _mostrarError('Permisos de cámara o micrófono no concedidos.');
        }
        return;
      }
    }

    if (cameraStatus.isGranted && microphoneStatus.isGranted) {
      if (_cameras.isEmpty) {
        try {
          _cameras = await availableCameras();
        } on CameraException catch (e) {
          if (mounted) {
            _mostrarError('Error al obtener cámaras disponibles: ${e.description}');
          }
          return;
        } catch (e) {
          if (mounted) {
            _mostrarError('Error inesperado al obtener cámaras: $e');
          }
          return;
        }
      }

      if (_cameras.isNotEmpty) {
        if (_cameraController != null && _cameraController!.value.isInitialized) {
          if (mounted) {
            setState(() {
              _isCameraActive = true;
            });
          }
          return;
        }

        try {
          _cameraController = CameraController(_cameras[0], ResolutionPreset.medium);
          await _cameraController!.initialize();
          if (mounted) {
            setState(() {
              _isCameraInitialized = true;
              _isCameraActive = true;
            });
          }
        } on CameraException catch (e) {
          if (mounted) {
            _mostrarError('Error al inicializar la cámara: ${e.description}');
          }
          await _cameraController?.dispose();
          _cameraController = null;
          if (mounted) {
            setState(() {
              _isCameraInitialized = false;
              _isCameraActive = false;
            });
          }
        } catch (e) {
          if (mounted) {
            _mostrarError('Error inesperado al inicializar la cámara: $e');
          }
        }
      } else {
        if (mounted) {
          _mostrarError('No se encontraron cámaras disponibles en este dispositivo.');
        }
      }
    }
  }

  Future<void> _takePicture() async {
    if (!_isCameraInitialized || _cameraController == null || !_cameraController!.value.isInitialized) {
      if (mounted) {
        _mostrarError("Cámara no inicializada o no lista. Intenta de nuevo.");
      }
      return;
    }

    try {
      final XFile file = await _cameraController!.takePicture();
      if (kIsWeb) {
        final bytes = await file.readAsBytes();
        if (mounted) {
          setState(() {
            _webImage = bytes;
            _image = null;
            _isCameraActive = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _image = file;
            _webImage = null;
            _isCameraActive = false;
          });
        }
      }
      await _stopCamera();
    } catch (e) {
      if (mounted) {
        _mostrarError("Error al tomar la foto: $e");
      }
    }
  }

  Future<void> _stopCamera() async {
    if (_cameraController != null) {
      await _cameraController!.dispose();
      _cameraController = null;
    }
    if (mounted) {
      setState(() {
        _isCameraInitialized = false;
        _isCameraActive = false;
      });
    }
  }

  Future<void> _tomarFoto() async {
    await _stopCamera();

    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) {
      await _initializeCamera();
    } else {
      final ImagePicker picker = ImagePicker();
      final XFile? takenImage = await picker.pickImage(source: ImageSource.camera);
      if (takenImage != null) {
        if (mounted) {
          setState(() {
            _image = takenImage;
            _webImage = null;
          });
        }
      } else {
        if (mounted) {
          _mostrarError("No se tomó ninguna foto.");
        }
      }
    }
  }

  Future<void> _subirDesdeGaleria() async {
    await _stopCamera();

    try {
      if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) {
        FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
        if (result != null) {
          if (mounted) {
            setState(() {
              _webImage = result.files.single.bytes;
              _image = null;
            });
          }
        } else {
          if (mounted) {
            _mostrarError("No se seleccionó ninguna imagen.");
          }
        }
      } else {
        final ImagePicker picker = ImagePicker();
        final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
        if (pickedImage != null) {
          if (mounted) {
            setState(() {
              _image = pickedImage;
              _webImage = null;
            });
          }
        } else {
          if (mounted) {
            _mostrarError("No se seleccionó ninguna imagen.");
          }
        }
      }
    } catch (e) {
      if (mounted) {
        _mostrarError("Error al subir imagen desde la galería: $e");
      }
    }
  }

  void _mostrarError(String mensaje) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensaje)));
    }
  }

  Widget _mostrarImagen() {
    if (_webImage != null) {
      return Image.memory(_webImage!, height: 200, fit: BoxFit.cover);
    } else if (_image != null) {
      return Image.file(File(_image!.path), height: 200, fit: BoxFit.cover);
    } else {
      return Container(
        height: 200,
        color: Colors.grey.shade300,
        child: const Center(child: Icon(Icons.image, size: 50, color: Colors.grey)),
      );
    }
  }

  @override
  void dispose() {
    _stopCamera();
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publicar Reto'),
        backgroundColor: const Color.fromARGB(255, 133, 125, 125),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _stopCamera();
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          if (_isCameraInitialized && _isCameraActive)
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                child: CameraPreview(_cameraController!),
              ),
            )
          else
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _mostrarImagen(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Tomar Foto'),
                        onPressed: _tomarFoto,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.upload),
                        label: const Text('Subir Imagen'),
                        onPressed: _subirDesdeGaleria,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Descripción del reto',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Publicación enviada")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text('Publicar'),
                  ),
                ],
              ),
            ),
          if (_isCameraInitialized && _isCameraActive)
            Positioned(
              bottom: 40,
              left: MediaQuery.of(context).size.width / 2 - 40,
              child: FloatingActionButton(
                onPressed: _takePicture,
                backgroundColor: Colors.green,
                child: const Icon(Icons.camera_alt, color: Colors.white, size: 36),
              ),
            ),
        ],
      ),
    );
  }
}
