// ignore: depend_on_referenced_packages
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'home/home_screen.dart';

late List<CameraDescription> _cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(cameras: _cameras),
    );
  }
}
