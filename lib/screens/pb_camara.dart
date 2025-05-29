// pb_camara.dart
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PbCamara extends StatefulWidget {
  static const String id = '/camara';

  const PbCamara({Key? key}) : super(key: key);

  @override
  _PbCamaraState createState() => _PbCamaraState();
}

class _PbCamaraState extends State<PbCamara> {
  CameraController? _controller;
  bool _isCameraReady = false;
  List<CameraDescription>? cameras;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    cameras = await availableCameras();
    if (cameras!.isEmpty) {
      print('No hay cámaras disponibles');
      return;
    }

    _controller = CameraController(cameras![0], ResolutionPreset.medium);
    try {
      await _controller!.initialize();
      if (!mounted) return;
      setState(() {
        _isCameraReady = true;
      });
    } catch (e) {
      print('Error al inicializar la cámara: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cámara'),
      ),
      body: _isCameraReady && _controller != null
          ? CameraPreview(_controller!)
          : Center(child: CircularProgressIndicator()),
    );
  }
}
