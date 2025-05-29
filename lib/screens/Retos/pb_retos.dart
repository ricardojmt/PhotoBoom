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
    // Opcional: Si quieres que la cámara se abra automáticamente al entrar a PbRetos
    // _initializeCamera();
  }

  // --- MÉTODOS ASÍNCRONOS Y AUXILIARES ---
  Future<void> _requestCameraPermission() async {
    // Verifica el estado del permiso de la cámara
    var status = await Permission.camera.status;

    if (status.isGranted) {
      print("Permiso otorgado");
      // Puedes inicializar la cámara aquí
    } else if (status.isDenied) {
      // Solicita el permiso al usuario
      status = await Permission.camera.request();

      if (status.isGranted) {
        print("Permiso otorgado después de la solicitud");
        // Inicializa la cámara aquí
      } else if (status.isPermanentlyDenied) {
        print("Permiso denegado permanentemente");
        // Redirige al usuario a la configuración para habilitar el permiso
        openAppSettings();
      }
    } else if (status.isRestricted) {
      print("El permiso está restringido");
    }
  }

  Future<void> _initializeCamera() async {
    // 1. Solicitar y verificar permisos
    await _requestCameraPermission();
    var cameraStatus = await Permission.camera.status;
    var microphoneStatus =
        await Permission.microphone.status; // Si grabas video con audio

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
          _mostrarError(
              'Permisos de cámara o micrófono denegados permanentemente. Por favor, habilítelos desde la configuración de la aplicación.');
        }
        await openAppSettings(); // Abre la configuración de la app para que el usuario habilite los permisos
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
      // 2. Intentar inicializar la cámara solo si los permisos están concedidos
      if (_cameras.isEmpty) {
        try {
          _cameras = await availableCameras();
          print('Camaras disponibles: $_cameras');
        } on CameraException catch (e) {
          if (mounted) {
            _mostrarError(
                'Error al obtener cámaras disponibles: ${e.description}');
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
        if (_cameraController != null &&
            _cameraController!.value.isInitialized) {
          // Si el controlador ya está inicializado y activo, no hagas nada
          if (mounted) {
            setState(() {
              _isCameraActive = true;
            });
          }
          return;
        }

        try {
          _cameraController =
              CameraController(_cameras[0], ResolutionPreset.medium);
          await _cameraController!.initialize();
          print('Camara inicializada con éxito');
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
          // Asegúrate de limpiar si hubo un error en la inicialización
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
            print('Error al iniciar la cámara: $e');
          }
        }
      } else {
        if (mounted) {
          _mostrarError(
              'No se encontraron cámaras disponibles en este dispositivo.');
        }
      }
    }
  }

  Future<void> _takePicture() async {
    if (!_isCameraInitialized ||
        _cameraController == null ||
        !_cameraController!.value.isInitialized) {
      if (mounted) {
        // Verificar antes de _mostrarError
        _mostrarError("Cámara no inicializada o no lista. Intenta de nuevo.");
      }
      return;
    }

    try {
      final XFile file = await _cameraController!.takePicture();
      if (kIsWeb) {
        final bytes = await file.readAsBytes();
        if (mounted) {
          // Verificar antes de setState
          setState(() {
            _webImage = bytes;
            _image = null;
            _isCameraActive =
                false; // Desactivar la vista de la cámara después de tomar la foto
          });
        }
      } else {
        if (mounted) {
          // Verificar antes de setState
          setState(() {
            _image = file;
            _webImage = null;
            _isCameraActive =
                false; // Desactivar la vista de la cámara después de tomar la foto
          });
        }
      }
      await _stopCamera(); // Detener el controlador de la cámara
    } catch (e) {
      if (mounted) {
        // Verificar antes de _mostrarError
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
      // Verificar antes de setState
      setState(() {
        _isCameraInitialized = false;
        _isCameraActive = false;
      });
    }
  }

  Future<void> _tomarFoto() async {
    // Asegurarse de detener la cámara si está activa, antes de iniciar una nueva acción de cámara/galería.
    await _stopCamera();

    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) {
      // Para web/desktop, inicializar la vista previa de la cámara integrada.
      await _initializeCamera();
    } else {
      // Para móvil, usar ImagePicker directamente para abrir la cámara.
      final ImagePicker picker = ImagePicker();
      final XFile? takenImage =
          await picker.pickImage(source: ImageSource.camera);
      if (takenImage != null) {
        if (mounted) {
          // Verificar antes de setState
          setState(() {
            _image = takenImage;
            _webImage = null;
          });
        }
      } else {
        if (mounted) {
          // Verificar antes de _mostrarError
          _mostrarError("No se tomó ninguna foto.");
        }
      }
    }
  }

  Future<void> _subirDesdeGaleria() async {
    // Asegurarse de detener la cámara si está activa, antes de iniciar una nueva acción de cámara/galería.
    await _stopCamera();

    try {
      if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) {
        FilePickerResult? result =
            await FilePicker.platform.pickFiles(type: FileType.image);
        if (result != null) {
          if (mounted) {
            // Verificar antes de setState
            setState(() {
              _webImage = result.files.single.bytes;
              _image = null;
            });
          }
        } else {
          if (mounted) {
            // Verificar antes de _mostrarError
            _mostrarError("No se seleccionó ninguna imagen.");
          }
        }
      } else {
        final ImagePicker picker = ImagePicker();
        final XFile? pickedImage =
            await picker.pickImage(source: ImageSource.gallery);
        if (pickedImage != null) {
          if (mounted) {
            // Verificar antes de setState
            setState(() {
              _image = pickedImage;
              _webImage = null;
            });
          }
        } else {
          if (mounted) {
            // Verificar antes de _mostrarError
            _mostrarError("No se seleccionó ninguna imagen.");
          }
        }
      }
    } catch (e) {
      if (mounted) {
        // Verificar antes de _mostrarError
        _mostrarError("Error al subir imagen desde la galería: $e");
      }
    }
  }

  void _mostrarError(String mensaje) {
    if (mounted) {
      // Siempre verificar mounted antes de usar context con ScaffoldMessenger
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(mensaje)));
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
        child: const Center(
            child: Icon(Icons.image, size: 50, color: Colors.grey)),
      );
    }
  }

  // --- CICLO DE VIDA DEL WIDGET ---
  @override
  void dispose() {
    _stopCamera(); // Asegurarse de detener la cámara y liberar recursos
    _cameraController?.dispose();
    super.dispose();
  }

  // --- CONSTRUCCIÓN DE LA INTERFAZ DE USUARIO ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publicar Reto'),
        backgroundColor: const Color.fromARGB(255, 133, 125, 125),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _stopCamera(); // Detener la cámara antes de salir de la pantalla
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          // Si la cámara está activa, muestra su vista previa ocupando gran parte del espacio
          if (_isCameraInitialized && _isCameraActive)
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                // Ajusta estos tamaños para que la vista previa de la cámara no sea demasiado grande
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height *
                    0.7, // Por ejemplo, 70% de la altura de la pantalla
                child: CameraPreview(_cameraController!),
              ),
            )
          // Si la cámara no está activa, muestra el formulario de publicación de retos
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
                        onPressed:
                            _tomarFoto, // Llama a la función para tomar foto (que puede iniciar la cámara)
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.upload),
                        label: const Text('Subir Imagen'),
                        onPressed:
                            _subirDesdeGaleria, // Llama a la función para subir desde galería
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Descripción del reto',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (mounted) {
                        // Verificar antes de ScaffoldMessenger
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Publicación enviada")),
                        );
                      }
                      // Aquí podrías añadir la lógica para enviar el reto a una base de datos
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text('Publicar'),
                  ),
                ],
              ),
            ),
          // Botón flotante para tomar foto (solo si la cámara está en modo de vista previa)
          if (_isCameraInitialized && _isCameraActive)
            Positioned(
              bottom: 40,
              left: MediaQuery.of(context).size.width / 2 - 40,
              child: ElevatedButton(
                onPressed:
                    _takePicture, // Este botón toma la foto cuando la vista previa está activa
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child:
                    const Icon(Icons.camera_alt, color: Colors.white, size: 36),
              ),
            ),
        ],
      ),
    );
  }
}
