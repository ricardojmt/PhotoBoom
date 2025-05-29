import 'package:flutter/material.dart';
import 'package:photoboom/components/botonconfirmacion.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/components/textos.dart';
import 'package:photoboom/main.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:photoboom/screens/Retos/pb_retos.dart'; // [cite: 2]
import 'package:file_picker/file_picker.dart'; // [cite: 2]
import 'package:flutter/foundation.dart'; // [cite: 2]
import 'package:camera/camera.dart'; // [cite: 2]
import 'dart:typed_data'; // [cite: 2]
import 'package:cloud_firestore/cloud_firestore.dart'; // [cite: 2]
import 'package:firebase_core/firebase_core.dart';

class PbFeed extends StatefulWidget {
  static String id = "pb_feed"; // [cite: 3]

  @override
  State<PbFeed> createState() => _PbFeedState(); // [cite: 3]
}

class _PbFeedState extends State<PbFeed> {
  // [cite: 4]
  // CORRECCIÓN 1: _selectedIndex debe ser una variable de estado, no global.
  int _selectedIndex = 0; // [cite: 2] Removido de global a aquí.
  XFile? _image; // [cite: 4]
  Uint8List? _webImageData; // [cite: 4]
  CameraController? _cameraController; // [cite: 4]
  List<CameraDescription> _cameras = []; // [cite: 4]
  bool _isCameraInitialized = false; // [cite: 4]
  bool _isCameraActive = false; // [cite: 5]

  final List<Map<String, dynamic>> _posts = []; // [cite: 5]
  String _currentUser = "MiUsuario"; // [cite: 6]

  @override
  void initState() {
    super.initState(); // [cite: 7]
    _loadPosts(); // [cite: 7]
    // No inicialices la cámara aquí automáticamente.
  }

  // --- MÉTODOS DE CÁMARA Y GALERÍA ---

  Future<void> _initializeCamera() async {
    try {
      if (!mounted)
        return; // CORRECCIÓN: !mounted en lugar de mounted en la verificación temprana [cite: 8, 9]

      _cameras = await availableCameras(); // [cite: 9]
      if (_cameras.isNotEmpty) {
        // [cite: 10]
        // CORRECCIÓN 3: Usar _cameras[0] para asegurar la primera cámara disponible [cite: 10]
        _cameraController =
            CameraController(_cameras[0], ResolutionPreset.high); // [cite: 10]
        await _cameraController!.initialize(); // [cite: 11]

        if (mounted) {
          // [cite: 11]
          setState(() {
            // [cite: 11]
            _isCameraInitialized = true; // [cite: 11]
            _isCameraActive = true; // [cite: 11]
          });
        }
      } else {
        if (mounted) {
          // [cite: 12]
          ScaffoldMessenger.of(context).showSnackBar(
            // [cite: 12]
            SnackBar(
                content: Text(
                    'Error: No se encontraron cámaras disponibles.')), // [cite: 12]
          );
        }
      }
    } on CameraException catch (e) {
      if (mounted) {
        // [cite: 13]
        ScaffoldMessenger.of(context).showSnackBar(
          // [cite: 13]
          SnackBar(
              content: Text(
                  'Error al inicializar la cámara: ${e.description}')), // [cite: 13, 14]
        );
      }
      _cameraController?.dispose(); // [cite: 14, 15]
      _cameraController = null; // [cite: 15]
      if (mounted) {
        // [cite: 16]
        setState(() {
          // [cite: 16]
          _isCameraInitialized = false; // [cite: 16]
          _isCameraActive = false; // [cite: 16]
        });
      }
    } catch (e) {
      if (mounted) {
        // [cite: 17]
        ScaffoldMessenger.of(context).showSnackBar(
          // [cite: 17]
          SnackBar(
              content: Text(
                  'Error inesperado al inicializar la cámara: $e')), // [cite: 17]
        );
      }
      _cameraController?.dispose(); // [cite: 18]
      _cameraController = null; // [cite: 18]
      if (mounted) {
        // [cite: 19]
        setState(() {
          // [cite: 19]
          _isCameraInitialized = false; // [cite: 19]
          _isCameraActive = false; // [cite: 19]
        });
      }
    }
  }

  Future<void> _takePicture() async {
    if (!_isCameraInitialized || // [cite: 20]
        _cameraController == null || // [cite: 20]
        !_cameraController!.value.isInitialized) {
      // [cite: 20]
      if (mounted) {
        // [cite: 20]
        ScaffoldMessenger.of(context).showSnackBar(
          // [cite: 21]
          SnackBar(
              content: Text(
                  'Cámara no inicializada o no lista para tomar foto.')), // [cite: 21]
        );
      }
      return; // [cite: 22]
    }
    try {
      final XFile file =
          await _cameraController!.takePicture(); // [cite: 22, 23]

      // CORRECCIÓN 4: Mover _stopCamera() para después de la subida en el caso móvil
      // o ajustarlo para que solo se detenga si es web y no se va a mostrar la imagen
      if (kIsWeb) {
        // [cite: 23]
        await _stopCamera(); // Detener la cámara inmediatamente después de tomar la foto en web [cite: 23]
        final bytes = await file.readAsBytes(); // [cite: 23]
        if (mounted) {
          // [cite: 24]
          setState(() {
            // [cite: 24]
            _webImageData = bytes; // [cite: 24]
            _image = null; // [cite: 25]
            _isCameraActive = false; // [cite: 24]
          });
        }
        await _uploadImageToFirebase(bytes, isWeb: true); // [cite: 25, 26]
      } else {
        // En móvil, ImagePicker ya cierra la cámara. Aquí solo si usáramos la cámara directamente como un widget.
        // Si estás usando `_openCamera` que llama a ImagePicker, no necesitas `_stopCamera` aquí.
        // Si el `_openCamera` de móvil se cambia para manejar la cámara internamente, entonces sí.
        // Por ahora, dejamos la lógica como está.
        if (mounted) {
          // [cite: 26]
          setState(() {
            // [cite: 26]
            _image = file; // [cite: 27]
            _webImageData = null; // [cite: 27]
            _isCameraActive = false; // [cite: 26]
          });
        }
        await _uploadImageToFirebase(File(file.path),
            isWeb: false); // [cite: 27, 28]
      }
    } catch (e) {
      print("Error al tomar la foto: $e"); // [cite: 29]
      if (mounted) {
        // [cite: 30]
        ScaffoldMessenger.of(context).showSnackBar(
          // [cite: 30]
          SnackBar(content: Text('Error al tomar la foto: $e')), // [cite: 30]
        );
      }
    }
  }

  Future<void> _stopCamera() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      // [cite: 31]
      await _cameraController!.dispose(); // [cite: 31, 32]
    }
    _cameraController = null; // [cite: 32]
    if (mounted) {
      // [cite: 32]
      setState(() {
        // [cite: 32]
        _isCameraInitialized = false; // [cite: 33]
        _isCameraActive = false; // [cite: 33]
      });
    }
  }

  Future<void> _pickImage() async {
    await _stopCamera(); // [cite: 33, 34]

    try {
      if (!mounted)
        return; // CORRECCIÓN 5: !mounted en lugar de mounted [cite: 34, 35]

      if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) {
        // [cite: 35]
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          // [cite: 36]
          type: FileType.image, // [cite: 36]
        );
        if (result != null) {
          // [cite: 37]
          if (mounted) {
            // [cite: 37]
            setState(() {
              // [cite: 37]
              _webImageData = result.files.single.bytes; // [cite: 38]
              _image = null; // [cite: 38]
            });
          }
          await _uploadImageToFirebase(result.files.single.bytes!,
              isWeb: true); // [cite: 38, 39]
        } else {
          if (mounted) {
            // [cite: 39]
            ScaffoldMessenger.of(context).showSnackBar(
              // [cite: 40]
              SnackBar(
                  content:
                      Text("No se seleccionó ninguna imagen")), // [cite: 40]
            );
          }
        }
      } else {
        final ImagePicker picker = ImagePicker(); // [cite: 40, 41]
        final XFile? pickedFile =
            await picker.pickImage(source: ImageSource.gallery); // [cite: 42]
        if (pickedFile != null) {
          // [cite: 43]
          if (mounted) {
            // [cite: 43]
            setState(() {
              // [cite: 43]
              _image = pickedFile; // [cite: 44]
              _webImageData = null; // [cite: 44]
            });
          }
          await _uploadImageToFirebase(File(pickedFile.path),
              isWeb: false); // [cite: 44, 45]
        } else {
          if (mounted) {
            // [cite: 45]
            ScaffoldMessenger.of(context).showSnackBar(
              // [cite: 46]
              SnackBar(
                  content:
                      Text("No se seleccionó ninguna imagen")), // [cite: 46]
            );
          }
        }
      }
    } catch (e) {
      if (mounted) {
        // [cite: 46]
        ScaffoldMessenger.of(context).showSnackBar(
          // [cite: 47]
          SnackBar(
              content: Text("Error al seleccionar imagen: $e")), // [cite: 47]
        );
      }
    }
  }

  Future<void> _openCamera() async {
    // Verifica si la cámara ya está inicializada y activa
    if (_isCameraInitialized && _isCameraActive) {
      return; // No vuelvas a inicializar si ya está en uso
    }

    // Verifica que el widget esté montado antes de modificar el estado
    if (!mounted) return;

    // Limpia cualquier imagen anterior
    setState(() {
      _image = null;
      _webImageData = null;
    });

    // Diferencia entre plataformas
    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) {
      // Lógica para la web o plataformas no móviles
      await _initializeCamera();
    } else {
      // Lógica para Android/iOS con ImagePicker
      final ImagePicker picker = ImagePicker();
      try {
        final XFile? pickedFile = await picker.pickImage(
          source: ImageSource.camera,
        );

        if (pickedFile != null) {
          if (mounted) {
            setState(() {
              _image = pickedFile;
              _webImageData = null;
              _isCameraActive = false;
            });
          }

          // Sube la imagen a Firebase
          await uploadImage(
              pickedFile); // Corregido: Pasar el objeto XFile directamente
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("No se tomó ninguna foto.")),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error al abrir la cámara: $e")),
          );
        }
      }
    }
  }

  Future<void> uploadImage(XFile imageFile) async {
    try {
      // Nombre único para el archivo
      String fileName = 'posts/${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Referencia a Firebase Storage
      Reference storageRef = FirebaseStorage.instance.ref().child(fileName);

      // Subir la imagen
      UploadTask uploadTask = storageRef.putFile(File(imageFile.path));
      TaskSnapshot taskSnapshot = await uploadTask;

      // Obtener la URL de descarga
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      print("Imagen subida: $downloadUrl");

      // Guardar la URL en Firestore
      await FirebaseFirestore.instance.collection('posts').add({
        'imageUrl': downloadUrl,
        'userName': _currentUser, // Tu variable de usuario
        'likes': 0,
        'comments': 0,
        'timestamp': FieldValue.serverTimestamp(),
      });

      print("Publicación guardada en Firestore.");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Imagen subida con éxito.')),
      );

      // Recargar las publicaciones
      _loadPosts();
    } catch (e) {
      print("Error al subir la imagen: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al subir la imagen: $e')),
      );
    }
  }

  Future<void> _loadPosts() async {
    try {
      final postsSnapshot = await FirebaseFirestore.instance
          .collection('posts')
          .orderBy('timestamp', descending: true)
          .get();

      List<Map<String, dynamic>> loadedPosts = [];
      for (var doc in postsSnapshot.docs) {
        loadedPosts.add({
          'imageUrl': doc['imageUrl'],
          'userName': doc['userName'],
          'likes': doc['likes'] ?? 0,
          'comments': doc['comments'] ?? 0,
        });
      }

      setState(() {
        _posts.clear();
        _posts.addAll(loadedPosts);
      });

      print("Publicaciones cargadas correctamente.");
    } catch (e) {
      print("Error al cargar publicaciones: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar publicaciones: $e')),
      );
    }
  }

  Future<void> _uploadImageToFirebase(dynamic fileData,
      {required bool isWeb}) async {
    try {
      // Define un nombre único para el archivo
      String fileName = 'posts/${DateTime.now().millisecondsSinceEpoch}.jpg';
      Reference storageRef = FirebaseStorage.instance.ref().child(fileName);

      UploadTask uploadTask;

      // Diferenciar entre plataformas web y móvil
      if (isWeb) {
        uploadTask = storageRef.putData(fileData as Uint8List);
      } else {
        uploadTask = storageRef.putFile(fileData as File);
      }

      // Esperar a que la subida termine
      TaskSnapshot taskSnapshot = await uploadTask;

      // Obtener la URL de descarga
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      print("Imagen subida a Firebase Storage: $downloadUrl");

      // Guardar la URL en Firestore
      await FirebaseFirestore.instance.collection('posts').add({
        'imageUrl': downloadUrl,
        'userName': _currentUser, // Ajusta esto con tu lógica de usuario
        'likes': 0,
        'comments': 0,
        'timestamp': FieldValue.serverTimestamp(),
      });

      print("Publicación guardada en Firestore.");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Imagen subida y publicada con éxito!')),
      );

      // Recargar las publicaciones
      _loadPosts();
    } catch (e) {
      print("Error al subir la imagen: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al subir la imagen: $e')),
      );
    }
  }

  @override
  void dispose() {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      // [cite: 76]
      _cameraController!.dispose(); // [cite: 77]
    }
    _cameraController = null; // [cite: 77]
    _isCameraInitialized = false; // [cite: 78]
    _isCameraActive = false; // [cite: 78]
    super.dispose(); // [cite: 78]
  }

  @override
  Widget build(BuildContext context) {
    // [cite: 78]
    return SafeArea(
      // [cite: 79]
      child: Scaffold(
        // [cite: 79]
        backgroundColor: AppColores.backgrounds, // [cite: 79]
        body: Column(
          // [cite: 79]
          children: [
            // [cite: 79]
            Padding(
              // [cite: 79]
              padding:
                  const EdgeInsets.only(top: 16.0, left: 8.0), // [cite: 79]
              child: Row(
                // [cite: 79]
                children: [
                  // [cite: 80]
                  Flechainicio(), // [cite: 80]
                  Logopequeno(), // [cite: 80]
                ],
              ),
            ),
            Expanded(
              // [cite: 80]
              child: elegirboton(), // [cite: 81]
            ),
            Padding(
              // [cite: 81]
              padding:
                  const EdgeInsets.only(top: 16.0, left: 8.0), // [cite: 81]
              child: Row(
                // [cite: 81]
                mainAxisAlignment: MainAxisAlignment.spaceAround, // [cite: 82]
                children: [
                  // [cite: 82]
                  Feed(onPressed: () {
                    // CORRECCIÓN: Llamar _stopCamera() también en estos cambios de pestaña
                    if (mounted) {
                      setState(() => _selectedIndex = 0);
                    }
                    _stopCamera();
                  }), // [cite: 82]
                  Retos(onPressed: () {
                    Navigator.pushNamed(context, PbRetos.id); // [cite: 82, 83]
                    _stopCamera(); // [cite: 88]
                  }),
                  Fotos(onPressed: () {
                    if (mounted) {
                      // [cite: 83, 84]
                      setState(() {
                        // [cite: 84]
                        _selectedIndex = 2; // [cite: 84]
                        _image = null; // [cite: 85]
                        _webImageData = null; // [cite: 85]
                        _isCameraActive = false; // [cite: 85, 86]
                      });
                    }
                    _stopCamera(); // [cite: 86]
                  }),
                  Corazon(onPressed: () {
                    if (mounted) {
                      // [cite: 87]
                      setState(() => _selectedIndex = 3); // [cite: 87, 88]
                    }
                    _stopCamera(); // [cite: 88, 89]
                  }),
                  Perfil(onPressed: () {
                    if (mounted) {
                      // [cite: 89]
                      setState(() => _selectedIndex = 4); // [cite: 90]
                    }
                    _stopCamera(); // [cite: 90]
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget elegirboton() {
    // [cite: 92]
    switch (_selectedIndex) {
      // [cite: 92]
      case 0:
        return paginaprincipal(); // [cite: 92, 93]
      case 1:
        return retos(context); // [cite: 93, 94]
      case 2:
        return Center(
          // [cite: 94]
          child: Column(
            // [cite: 94]
            mainAxisAlignment: MainAxisAlignment.center, // [cite: 94]
            children: [
              // [cite: 95]
              if (_isCameraInitialized && _isCameraActive) // [cite: 94, 95]
                Expanded(
                  // [cite: 95]
                  child: AspectRatio(
                    // [cite: 95, 96]
                    aspectRatio:
                        _cameraController!.value.aspectRatio, // [cite: 96]
                    child: CameraPreview(_cameraController!), // [cite: 96]
                  ),
                )
              else if (_webImageData != null) // [cite: 96, 97]
                Image.memory(
                  // [cite: 97]
                  _webImageData!, // [cite: 97]
                  width: 400.0, // [cite: 97]
                  height: 400.0, // [cite: 98]
                  fit: BoxFit.cover, // [cite: 98]
                )
              else if (_image != null) // [cite: 98]
                Image.file(
                  // [cite: 98]
                  File(_image!.path), // [cite: 99]
                  width: 400.0, // [cite: 99]
                  height: 400.0, // [cite: 99]
                  fit: BoxFit.cover, // [cite: 99]
                )
              else
                const Placeholder(
                  // [cite: 99]
                  color: Color(0xFF455A64), // [cite: 99]
                  strokeWidth: 2.0, // [cite: 100]
                  fallbackWidth: 400.0, // [cite: 100]
                  fallbackHeight: 400.0, // [cite: 100]
                ),

              const SizedBox(height: 20), // [cite: 100]
              Row(
                // [cite: 101]
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // [cite: 101]
                children: [
                  // [cite: 101]
                  ElevatedButton.icon(
                    // [cite: 101]
                    icon: const Icon(Icons.camera_alt), // [cite: 102]
                    label: const Text('Tomar Foto'), // [cite: 102]
                    onPressed: _openCamera, // [cite: 102]
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red), // [cite: 103]
                  ),
                  ElevatedButton.icon(
                    // [cite: 103]
                    icon: const Icon(Icons.photo_library), // [cite: 104]
                    label: const Text('Galería'), // [cite: 104]
                    onPressed: _pickImage, // [cite: 104]
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red), // [cite: 104, 105]
                  ),
                ],
              ),
              const SizedBox(height: 20), // [cite: 105]

              if (_isCameraInitialized && _isCameraActive) // [cite: 105, 106]
                ElevatedButton(
                  // [cite: 106]
                  onPressed: _takePicture, // [cite: 106]
                  style: ElevatedButton.styleFrom(
                    // [cite: 106, 107]
                    backgroundColor: Colors.green, // [cite: 107]
                    shape: const CircleBorder(), // [cite: 107]
                    padding: const EdgeInsets.all(20), // [cite: 107, 108]
                  ),
                  child: const Icon(
                    // [cite: 108]
                    Icons.camera_alt, // [cite: 108]
                    color: Colors.white, // [cite: 109]
                    size: 36.0, // [cite: 109]
                  ),
                ),
              if (_isCameraInitialized && _isCameraActive) // [cite: 109]
                const SizedBox(height: 20), // [cite: 109]
            ],
          ),
        );
      case 3:
        return buscar(); // [cite: 110, 111]
      case 4:
        return perfilusuario(); // [cite: 111, 112]
      default:
        return paginaprincipal(); // [cite: 112, 113]
    }
  }

  Widget paginaprincipal() {
    if (_posts.isEmpty) {
      return Center(
        child: Text(
          'No hay publicaciones aún',
          style: TextStyle(fontSize: 18, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index]; // Asegúrate de que esta línea esté presente
        return Center(
          child: buildImageItem(
            context,
            post['imageUrl'], // Aquí pasamos la URL de la imagen
            post['userName'],
            post['likes'],
            post['comments'],
            isNetworkImage: true,
          ),
        );
      },
    );
  }

  Widget buildImageItem(BuildContext context, String imagePathorUrl,
      String userName, int likes, int comments,
      {bool isNetworkImage = false}) {
    return Container(
      width: 300,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                CircleAvatar(radius: 12),
                SizedBox(width: 8),
                Text(
                  userName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              border: Border.all(color: Colors.redAccent, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: isNetworkImage
                  ? Image.network(
                      imagePathorUrl,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error, color: Colors.red);
                      },
                    )
                  : Placeholder(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Icon(Icons.favorite, color: Colors.red),
                SizedBox(width: 4),
                Text('$likes Likes'),
                SizedBox(width: 16),
                Icon(Icons.comment, color: Colors.red),
                SizedBox(width: 4),
                Text('$comments Comments'),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget retos(BuildContext context) {
    // [cite: 133, 134]
    return Center(
        child: Text(
            'Aquí irán los retos.')); // CORRECCIÓN 7: Añadir un Child al Center
  }

  // CORRECCIÓN 7: 'subirfotos' no se usa y es un widget vacío. Si no lo vas a usar, se puede eliminar.
  Widget subirfotos() {
    // [cite: 134]
    return Center(
        // [cite: 134]
        child: Text(
            'Aquí se mostrarán las fotos tomadas o seleccionadas.')); // CORRECCIÓN 7: Añadir un Child
  }

  Widget buscar() {
    // [cite: 135]
    return Center(
      // [cite: 135]
      child: Text(
        // [cite: 136]
        'Buscar Fotos y Usuarios', // [cite: 136]
        style:
            TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // [cite: 136]
      ),
    );
  }

  Widget perfilusuario() {
    // [cite: 136]
    // CORRECCIÓN: Usar el perfilusuario que filtra las publicaciones del usuario actual
    final userPosts = _posts
        .where((post) => post['userName'] == _currentUser)
        .toList(); // [cite: 6]
    if (userPosts.isEmpty) {
      return Center(
        child: Text(
          'Aún no tienes publicaciones. ¡Toma o sube tu primera foto!',
          style: TextStyle(fontSize: 18, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: userPosts.length,
      itemBuilder: (context, index) {
        final post = userPosts[index];
        print("Renderizando imagen para feed: ${post['imageUrl']}");
        return Center(
          child: buildImageItem(
            context,
            post['imageUrl'],
            post['userName'],
            post['likes'],
            post['comments'],
            isNetworkImage: true,
          ),
        );
      },
    );
  }
}
