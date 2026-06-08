import 'package:bebe/auth/presentation/bloc/auth_bloc.dart';
import 'package:bebe/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is AuthLoadingState) {
          Scaffold(body: Center(child: CircularProgressIndicator(),
          ),);
        }
        if(state is AuthUnauthenticatedState) {
          context.push("/loginwithGoogle");
        }
      },
      builder: (context, state) {
      if(state is AuthLoadingState){
        return Scaffold(body: Center(child: CircularProgressIndicator(), ),);
      }
      if(state is AuthAuthenticatedState){
        context.push("/homePage");
      }
      if(state is AuthAuthenticatedState){
        context.push("/loginwithGoogle");
      }
      return Scaffold(body: Center(child: TextButton(onPressed: () {
        context.push("/loginwithGoogle");
      }, child: Text("Aller sur Login"))),);
    
          
      },
    );
  }
}
