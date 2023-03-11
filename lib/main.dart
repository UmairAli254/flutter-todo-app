import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:todo/screens/home.dart";

import "constants/colors.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set StatusBar Tranparent
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    ); // End of Set StatusBar Tranparent

    return MaterialApp(
      title: "ToDo APP",
      theme: ThemeData(
        colorSchemeSeed: tdBGColor,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: tdBGColor,
        appBar: AppBar(
          title: const Text(
            "My Todos",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: tdBGColor,
          elevation: 0,
          actions: [
            Tooltip(
             message: "Developed By Umair Ali",
             decoration: BoxDecoration(
              gradient: LinearGradient(colors: [tdBlue, tdGrey,tdBlack]),
              
             ),

              child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(),
                  margin: const EdgeInsets.only(right: 10),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(
                      "images/mine.jpg",
                    ),
                  )),
            )
          ],
        ),
        body: Home(),
      ),
    );
  }
}
