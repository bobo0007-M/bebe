import 'package:bebe/services/auth_service.dart';
// import 'package:bebe/services/user_service.dart';
import 'package:flutter/material.dart';
// import 'package:lightapp/services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final auth_user = AuthService().auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        
        title: Text("Home Page", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [ Icon(Icons.more_vert),
        
        IconButton(onPressed: (){
          setState(() {
            AuthService().logout();
          });
        }, icon: Icon(Icons.arrow_back))],
      ), 
      
     
    );
  }
}