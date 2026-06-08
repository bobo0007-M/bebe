// import 'package:firebase_auth/firebase_auth.dart';
import 'package:bebe/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';
// import 'package:lightapp/services/auth_service.dart';

import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email')),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
         setState(() {
           AuthService().login(emailController.text, passwordController.text);
         });
                // Handle login logic here
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 16,),
            SignInButton(Buttons.google, onPressed: () {
              setState(() {
                AuthService().signInWithGoogle();
              });
            }),
            SizedBox(height: 15,),

            // Add a button to navigate to the signup page
            TextButton(
              onPressed: () {
       
                // Navigate to the signup page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupPage()),
                );
              },
              
              child: const Text('Don\'t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
