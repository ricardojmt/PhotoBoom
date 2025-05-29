import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:camera/camera.dart';

class PbRetos extends StatefulWidget {
  const PbRetos({super.key});

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

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isNotEmpty) {
        _cameraController = CameraController(_cameras[0], ResolutionPreset.medium);
        await _cameraController!.initialize();
        setState(() {
          _isCameraInitialized = true;
          _isCameraActive = true;
        });
      }
    } catch (e) {
      _mostrarError('Error al inicializar la cámara: $e');
    }
  }

  Future<void> _takePicture() async {
    try {
      final XFile file = await _cameraController!.takePicture();
      if (kIsWeb) {
        final bytes = await file.readAsBytes();
        setState(() {
          _webImage = bytes;
          _image = null;
          _isCameraActive = false;
        });
      } else {
        setState(() {
          _image = file;
          _webImage = null;
          _isCameraActive = false;
        });
      }
      await _stopCamera();
    } catch (e) {
      _mostrarError("Error al tomar la foto: $e");
    }
  }

  Future<void> _stopCamera() async {
    await _cameraController?.dispose();
    _cameraController = null;
    setState(() {
      _isCameraInitialized = false;
      _isCameraActive = false;
    });
  }

  Future<void> _tomarFoto() async {
    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) {
      await _initializeCamera();
    } else {
      final ImagePicker picker = ImagePicker();
      final XFile? takenImage = await picker.pickImage(source: ImageSource.camera);
      if (takenImage != null) {
        setState(() {
          _image = takenImage;
          _webImage = null;
        });
      }
    }
  }

  Future<void> _subirDesdeGaleria() async {
    try {
      if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) {
        FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
        if (result != null) {
          setState(() {
            _webImage = result.files.single.bytes;
            _image = null;
          });
        }
      } else {
        final ImagePicker picker = ImagePicker();
        final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
        if (pickedImage != null) {
          setState(() {
            _image = pickedImage;
            _webImage = null;
          });
        }
      }
    } catch (e) {
      _mostrarError("Error al subir imagen: $e");
    }
  }

  void _mostrarError(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensaje)));
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publicar Reto'),
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          if (_isCameraInitialized && _isCameraActive)
            Align(
              alignment: Alignment.center,
           child: SizedBox(
          width: 1100.0,
  height: 800.0,
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
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.upload),
                        label: const Text('Subir Imagen'),
                        onPressed: _subirDesdeGaleria,
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Descripción del reto',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Publicación enviada")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
              child: ElevatedButton(
                onPressed: _takePicture,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Icon(Icons.camera_alt, color: Colors.white, size: 36),
              ),
            ),
        ],
      ),
    );
  }
}
