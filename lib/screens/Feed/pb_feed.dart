import 'package:flutter/material.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/components/textos.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:photoboom/screens/Retos/pb_retos.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:camera/camera.dart';
import 'dart:typed_data';

int _selectedIndex = 0;

class PbFeed extends StatefulWidget {
  static String id = "pb_feed";

  @override
  State<PbFeed> createState() => _PbFeedState();
}

class _PbFeedState extends State<PbFeed> {
  XFile? _image;
  Uint8List? _webImageData;
  CameraController? _cameraController;
  List<CameraDescription> _cameras = [];
  bool _isCameraInitialized = false;
  bool _isCameraActive = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isNotEmpty) {
        _cameraController =
            CameraController(_cameras[0], ResolutionPreset.high);
        await _cameraController!.initialize();
        if (mounted) {
          // <--- Añadir verificación mounted
          setState(() {
            _isCameraInitialized = true;
            _isCameraActive = true;
          });
        }
      } else {
        if (mounted) {
          // <--- Añadir verificación mounted
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Error: No se encontraron cámaras disponibles.')),
          );
        }
      }
    } on CameraException catch (e) {
      if (mounted) {
        // <--- Añadir verificación mounted
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Error al inicializar la cámara: ${e.description}')), // Usa description para CameraException
        );
      }
    } catch (e) {
      if (mounted) {
        // <--- Añadir verificación mounted
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Error inesperado al inicializar la cámara: $e')),
        );
      }
    }
  }

  Future<void> _takePicture() async {
    if (!_isCameraInitialized ||
        _cameraController == null ||
        !_cameraController!.value.isInitialized) {
      if (mounted) {
        // <--- Añadir verificación mounted
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Cámara no inicializada o no lista para tomar foto.')),
        );
      }
      return;
    }
    try {
      final XFile file = await _cameraController!.takePicture();
      if (kIsWeb) {
        final bytes = await file.readAsBytes();
        if (mounted) {
          // <--- Añadir verificación mounted
          setState(() {
            _webImageData = bytes;
            _image = null;
            _isCameraActive = false; // Desactivar la vista de la cámara
          });
        }
      } else {
        if (mounted) {
          // <--- Añadir verificación mounted
          setState(() {
            _image = file;
            _webImageData = null;
            _isCameraActive = false; // Desactivar la vista de la cámara
          });
        }
      }
      await _stopCamera(); // Detener el controlador de la cámara
    } catch (e) {
      print("Error al tomar la foto: $e");
      if (mounted) {
        // <--- Añadir verificación mounted
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al tomar la foto: $e')),
        );
      }
    }
  }

  Future<void> _stopCamera() async {
    if (_cameraController != null) {
      await _cameraController!.dispose();
      _cameraController = null;
    }
    if (mounted) {
      // <--- Añadir verificación mounted
      setState(() {
        _isCameraInitialized = false;
        _isCameraActive = false;
      });
    }
  }

  Future<void> _pickImage() async {
    await _stopCamera(); // Detener la cámara si está activa, antes de abrir la galería

    try {
      if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.image,
        );
        if (result != null) {
          if (mounted) {
            // <--- Añadir verificación mounted
            setState(() {
              _webImageData = result.files.single.bytes;
              _image = null;
            });
          }
        } else {
          if (mounted) {
            // <--- Añadir verificación mounted
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("No se seleccionó ninguna imagen")),
            );
          }
        }
      } else {
        final ImagePicker picker = ImagePicker(); // Usar ImagePicker
        final XFile? pickedFile =
            await picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          if (mounted) {
            // <--- Añadir verificación mounted
            setState(() {
              _image = pickedFile;
              _webImageData = null;
            });
          }
        } else {
          if (mounted) {
            // <--- Añadir verificación mounted
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("No se seleccionó ninguna imagen")),
            );
          }
        }
      }
    } catch (e) {
      if (mounted) {
        // <--- Añadir verificación mounted
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error al seleccionar imagen: $e")),
        );
      }
    }
  }

  Future<void> _openCamera() async {
    // Si la cámara ya está activa y lista, no necesitamos volver a inicializarla.
    if (_isCameraInitialized && _isCameraActive) {
      return;
    }

    // Si hay una imagen seleccionada, la reseteamos al abrir la cámara
    if (mounted) {
      // <--- Añadir verificación mounted
      setState(() {
        _image = null;
        _webImageData = null;
      });
    }

    // Si es web o escritorio, inicializamos y mostramos la vista previa de la cámara.
    // En móvil, ImagePicker maneja la apertura de la cámara como una actividad separada.
    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) {
      await _initializeCamera();
    } else {
      final ImagePicker picker = ImagePicker();
      try {
        final XFile? pickedFile =
            await picker.pickImage(source: ImageSource.camera);
        if (pickedFile != null) {
          if (mounted) {
            // <--- Añadir verificación mounted
            setState(() {
              _image = pickedFile;
              _webImageData = null;
              _isCameraActive = false; // La cámara de ImagePicker cierra sola
            });
          }
        } else {
          if (mounted) {
            // <--- Añadir verificación mounted
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("No se tomó ninguna foto.")),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          // <--- Añadir verificación mounted
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text("Error al abrir la cámara del dispositivo: $e")),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _stopCamera(); // Detener la cámara y liberar recursos al salir del widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColores.backgrounds,
        body: Column(
          // Main Column encapsulando todo
          children: [
            Padding(
  padding: const EdgeInsets.only(top: 16.0, left: 8.0),
  child: Column(
    children: [
      Row(
        children: [
          flechainicio(),
          Logopequeno(),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Logopequeno(),
        ],
      ),
    ],
  ),
),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Textoco(),
                    Textola(),
                    SizedBox(height: 15.0),
                    Correo(),
                    SizedBox(height: 15.0),
                  ],
                ),
              ),
            ),
            Expanded(
              child:
                  elegirboton(), // Aquí se renderiza el contenido de la pestaña
            ),
            // Barra de navegación inferior
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FeedBoton(onPressed: () => setState(() => _selectedIndex = 0)),
                  RetosBoton(onPressed: () {
                    // Esta es la navegación a la pantalla de publicación de retos
                    Navigator.pushNamed(context, PbRetos.id);
                  }),
                  FotosBoton(onPressed: () {
                    // Cuando se presiona el botón 'Fotos', cambiamos la pestaña a 2
                    // y limpiamos cualquier estado de cámara/imagen previo
                    if (mounted) {
                      // <--- Añadir verificación mounted
                      setState(() {
                        _selectedIndex = 2;
                        _image = null;
                        _webImageData = null;
                        _isCameraActive =
                            false; // Asegurarse de que la cámara no esté activa si no la queremos iniciar
                      });
                    }
                    _stopCamera(); // Asegurarse de detener la cámara si está activa
                  }),
                  CorazonBoton(onPressed: () {
                    if (mounted) {
                      // <--- Añadir verificación mounted
                      setState(() => _selectedIndex = 3);
                    }
                    _stopCamera(); // Detener cámara al cambiar de pestaña
                  }),
                  PerfilBoton(onPressed: () {
                    if (mounted) {
                      // <--- Añadir verificación mounted
                      setState(() => _selectedIndex = 4);
                    }
                    _stopCamera(); // Detener cámara al cambiar de pestaña
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
    switch (_selectedIndex) {
      case 0:
        return paginaprincipal(); // Página principal
      case 1:
        return retos(context);
      case 2:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Si la cámara está activa y lista (solo para web/escritorio o vista previa de cámara), muestra la vista previa
              if (_isCameraInitialized && _isCameraActive)
                Expanded(
                  // Usa Expanded para que la CameraPreview ocupe el espacio disponible
                  child: AspectRatio(
                    // Mantener la proporción de la cámara
                    aspectRatio: _cameraController!.value.aspectRatio,
                    child: CameraPreview(_cameraController!),
                  ),
                )
              // Si no hay cámara activa, muestra la imagen seleccionada o un placeholder
              else if (_webImageData != null)
                Image.memory(
                  _webImageData!,
                  width: 400.0,
                  height: 400.0,
                  fit: BoxFit.cover,
                )
              else if (_image != null)
                Image.file(
                  File(_image!.path),
                  width: 400.0,
                  height: 400.0,
                  fit: BoxFit.cover,
                )
              else
                const Placeholder(
                  color: Color(0xFF455A64),
                  strokeWidth: 2.0,
                  fallbackWidth: 400.0,
                  fallbackHeight: 400.0,
                ),

              // Botones para interactuar con la cámara/galería
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Tomar Foto'),
                    onPressed:
                        _openCamera, // Llama a _openCamera para iniciar la cámara o tomar foto en móvil
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.photo_library),
                    label: const Text('Galería'),
                    onPressed:
                        _pickImage, // Llama a _pickImage para seleccionar de la galería
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Espacio inferior

              // Botón para tomar la foto (solo visible cuando la vista previa de la cámara está activa)
              if (_isCameraInitialized && _isCameraActive)
                ElevatedButton(
                  onPressed:
                      _takePicture, // Este botón toma la foto cuando la vista previa está activa
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape:
                        const CircleBorder(), // Para que sea un botón circular
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 36.0,
                  ),
                ),
              if (_isCameraInitialized && _isCameraActive)
                const SizedBox(height: 20),
            ],
          ),
        );
      case 3:
        return buscar(); // Página de búsqueda
      case 4:
        return perfilusuario(); // Página del perfil
      default:
        return paginaprincipal(); // Página predeterminada
    }
  }
}

Widget buildImageItem(BuildContext context, String imagePath, String userName,
    int likes, int comments) {
  return Container(
    width: 300,
    alignment: Alignment.center,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          MainAxisAlignment.center, // ← Esto alinea todo a la izquierda
      children: [
        // Nombre del usuario con su avatar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 12,
              ),
              SizedBox(width: 8),
              Text(
                userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),

        // Imagen con borde
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: Colors.redAccent, width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              imagePath,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Likes y comentarios
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
        SizedBox(
          height: 16,
        ),
      ],
    ),
  );
}

Widget paginaprincipal() {
  return ListView.builder(
    padding: EdgeInsets.all(16),
    itemCount: 4,
    itemBuilder: (context, index) {
      final imagenes = [
        'assets/images/imagen1.jpg',
        'assets/images/imagen2.jpg',
        'assets/images/imagen3.jpg',
        'assets/images/imagen4.jpg',
      ];
      final usuarios = ['RicardoMT', 'YessTriana', 'AlbertoAl', 'SergioC'];
      final likes = [120, 89, 45, 230];
      final comments = [12, 5, 8, 14];
      return Center(
        child: buildImageItem(
          context,
          imagenes[index], //llamar al vector imagenes
          usuarios[index],
          likes[index],
          comments[index],
        ),
      );
    },
  );
}

Widget retos(BuildContext context) {
  return Center();
}

Widget subirfotos() {
  return Center(
      // Cámara o imagen sobrepuesta
      );
}

Widget buscar() {
  return Center(
    child: Text(
      'Buscar Fotos y Usuarios',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}

Widget perfilusuario() {
  return Center(
    child: Text(
      'Perfil de Usuario',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}
