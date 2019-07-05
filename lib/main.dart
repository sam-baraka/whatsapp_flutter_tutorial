import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {

  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tabs=<Tab>[
    Tab(text: "CHATS",),
    Tab(text: "STATUS",),
    Tab(text: "CALLS",)
  ];
  final tabPages=<Widget>[
      Center(child: Text("Chats"),),
      Center(child: Text("Status"),),
      Center(child: Text("Calls"),)
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            pinned: false,
            floating: true,
            title: Text("WhatsApp"),
            bottom: TabBar(tabs: tabs),
          ),
          SliverFillRemaining(child: TabBarView(children: tabPages,),)
        ],
      ),
    );
  }
}
