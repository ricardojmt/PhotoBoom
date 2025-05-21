import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/core/app_tipo_text.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:camera/camera.dart';
import 'dart:typed_data';

class Feed extends StatefulWidget {
  static const String id = '/feed';
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  XFile? _image;
  Uint8List? _webImageData;
  CameraController? _cameraController;
  List<CameraDescription> _cameras = [];
  bool _isCameraInitialized = false;
  bool _isCameraActive = false;

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras.isNotEmpty) {
      _cameraController = CameraController(_cameras[0], ResolutionPreset.high);
      await _cameraController!.initialize();
      setState(() {
        _isCameraInitialized = true;
        _isCameraActive = true;
      });
    }
  }

  Future<void> _takePicture() async {
    try {
      final XFile file = await _cameraController!.takePicture();
      if (kIsWeb) {
        final bytes = await file.readAsBytes();
        setState(() {
          _webImageData = bytes;
          _image = null;
          _isCameraActive = false;
        });
      } else {
        setState(() {
          _image = file;
          _webImageData = null;
          _isCameraActive = false;
        });
      }
    } catch (e) {
      print("Error al tomar la foto: $e");
    }
  }

  Future<void> _pickImage() async {
    if (kIsWeb || !Platform.isAndroid && !Platform.isIOS) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );
      if (result != null) {
        setState(() {
          _webImageData = result.files.single.bytes;
          _image = null;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No se seleccionó ninguna imagen")),
        );
      }
    } else {
      final ImagePicker _picker = ImagePicker();
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _image = pickedFile;
          _webImageData = null;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("No se seleccionó ninguna imagen")),
          );
        }
      });
    }
  }

  Future<void> _openCamera() async {
    if (kIsWeb || !Platform.isAndroid && !Platform.isIOS) {
      await _initializeCamera();
    } else {
      final ImagePicker _picker = ImagePicker();
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
      setState(() {
        if (pickedFile != null) {
          _image = pickedFile;
          _webImageData = null;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("No se tomó ninguna foto")),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PhotoBoom',
          style: TextStyle(
            color: AppColores.logotext,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColores.backgrounds,
      ),
      body: Stack(
        children: <Widget>[
          _isCameraInitialized && _isCameraActive
              ? CameraPreview(_cameraController!)
              : _webImageData != null
                  ? Image.memory(
                      _webImageData!,
                      width: 400.0,
                      height: 400.0,
                      fit: BoxFit.cover,
                    )
                  : _image == null
                      ? const Placeholder(
                          color: Color(0xFF455A64),
                          strokeWidth: 2.0,
                          fallbackWidth: 400.0,
                          fallbackHeight: 400.0,
                        )
                      : Image.file(
                          File(_image!.path),
                          width: 400.0,
                          height: 400.0,
                          fit: BoxFit.cover,
                        ),

          _isCameraInitialized && _isCameraActive
              ? Positioned(
                  bottom: 50.0,
                  left: MediaQuery.of(context).size.width / 2 - 40,
                  child: ElevatedButton(
                    onPressed: _takePicture,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 36.0,
                    ),
                  ),
                )
              : Container(),

          !_isCameraActive
              ? Positioned(
                  bottom: 100.0,
                  left: 20.0,
                  right: 20.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.red,
                          size: 36.0,
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Explorar clickeado')),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.red,
                          size: 36.0,
                        ),
                        onPressed: _pickImage, // ahora este botón selecciona imagen
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.red,
                          size: 36.0,
                        ),
                        onPressed: _openCamera,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 36.0,
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Me gusta clickeado')),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.person,
                          color: Colors.red,
                          size: 36.0,
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(

                            SnackBar(content: Text('Perfil clickeado')),
                          );
                        },
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
