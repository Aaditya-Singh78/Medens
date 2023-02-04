import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medens/Screens/Login.dart';

void main(){
  runApp(
    MaterialApp(
        home: MyhomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
    )
  );
}

class MyhomePage extends StatefulWidget{
  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<MyhomePage>{
  // MyApp({super.key});
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
    });
  }
  double _initial = 0.0;
  void update(){
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState((){
        _initial = _initial +0.01;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    update();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
   return Scaffold(
     resizeToAvoidBottomInset: false,
     backgroundColor: Colors.white,
     body: Wrap(
       crossAxisAlignment: WrapCrossAlignment.end,
       alignment: WrapAlignment.center,
       runSpacing: (screenHeight * 0.0005),
       children: [
         Container(
           width: screenWidth * 0.95,
           height: screenHeight * 0.75,
         alignment: Alignment.center,
         // color: Colors.blue,
         padding: EdgeInsets.all((screenHeight * 0.0095)),
         margin: EdgeInsets.all((screenWidth * 0.1)),
             child: Image(image: AssetImage("images/health.png"),
             height: screenHeight * 0.5,
             width: screenWidth * 0.5,
           ),
       ),
         Container(
           width: screenWidth * 0.95,
           height: screenHeight * 0.05,
           alignment: Alignment.center,
           margin: EdgeInsets.fromLTRB(
               (screenWidth * 0.1),
               (screenHeight * 0.000095),
               (screenWidth * 0.1),
               (screenHeight * 0.000095),
           ),
           child: Text("Welcome to Medens Healthcare Application", style: TextStyle(color: Colors.black87),),
         ),
         Container(
           alignment: Alignment.center,
           child: SizedBox(
             width: 300,
             child: LinearProgressIndicator(
               backgroundColor: Colors.black87,
               value: _initial,
               valueColor: AlwaysStoppedAnimation(Colors.green),
             ),
           ),
         ),
       ],
     ),
   );
  }
}