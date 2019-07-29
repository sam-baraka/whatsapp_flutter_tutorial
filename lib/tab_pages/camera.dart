import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:whatsapp_flutter_tutorial/main.dart';

class CameraTabPage extends StatefulWidget {
  @override
  _CameraTabPageState createState() => _CameraTabPageState();
}

class _CameraTabPageState extends State<CameraTabPage> {
  CameraController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=CameraController(cameras[0],ResolutionPreset.medium);
    controller.initialize().then((_){
      if(!mounted){
        return;
      }
      setState((){});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
   if(!controller.value.isInitialized){
     return Container();
   }
   return AspectRatio(
     aspectRatio: controller.value.aspectRatio,
     child: CameraPreview(controller),
   );
  }
}