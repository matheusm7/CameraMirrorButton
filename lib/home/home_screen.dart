import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const HomeScreen({super.key, required this.cameras});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CameraController cameraCtrl;

  @override
  void initState() {
    cameraCtrl = CameraController(widget.cameras[1], ResolutionPreset.high);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await cameraCtrl.initialize();
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double buttonWidth = 250;
    const double buttonHeight = 90;
    const double borderRadius = 45;

    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            print('Teste 1');
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: SizedBox(
                  width: buttonWidth,
                  height: buttonHeight,
                  child: CameraPreview(cameraCtrl),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  width: buttonWidth,
                  height: buttonHeight,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  child: Center(
                    child: Text(
                      'Flutter Dicas',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
