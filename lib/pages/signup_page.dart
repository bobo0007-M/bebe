// / import 'package:bebe/services/auth_service.dart';
import 'package:bebe/services/auth_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:lightapp/services/auth_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
TextEditingController emailController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
               TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nom'),
              // obscureText: true,
            ),
            const SizedBox(height: 20),
            // TextField(decoration: const InputDecoration(labelText: 'name')),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email')),
                const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
           setState(() {
             AuthService().createUser(nameController.text, emailController.text, passwordController.text);
           });
                // Handle signup logic here
              },
              child: const Text('Créer un compte'),
              
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              AuthService().login(emailController.text, passwordController.text);
            }, child: Text("vous avez un compte", style: TextStyle(color: Colors.blue),))
          ],
        ),
      ),
    );
  }
}
