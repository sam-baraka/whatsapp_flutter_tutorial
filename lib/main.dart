import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';


//Own page imports
import 'package:whatsapp_flutter_tutorial/tab_pages/camera.dart';
import 'package:whatsapp_flutter_tutorial/auth/authentication.dart';


List<CameraDescription> cameras;
Future<void> main() async{
  ////Fix this first
  cameras = await availableCameras();
  runApp(MyApp());
}
  

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Authentication()
    );
  }
}

class MyHomePage extends StatefulWidget {

  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tabs=<Tab>[
    Tab(icon: Icon(Icons.photo_camera)),
    Tab(text: "CHATS",),
    Tab(text: "STATUS",),
    Tab(text: "CALLS",)
  ];
  final tabPages=<Widget>[
      CameraTabPage(),
      Center(child: Text("Chats"),),
      Center(child: Text("Status"),),
      Center(child: Text("Calls"),)
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: tabs.length,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            pinned: false,
            floating: true,
            title: Text("WhatsApp"),
            bottom: TabBar(tabs: tabs),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search, color: Colors.white,),onPressed: (){},tooltip: "Search",),
              IconButton(icon: Icon(Icons.more_vert, color: Colors.white),onPressed: (){},tooltip: "More options",)
            ],
            ),
          SliverFillRemaining(child: TabBarView(children: tabPages,),)
        ],
      ),
    );
  }
}
