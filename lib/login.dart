import 'package:exhemih/cliente.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Login'),
      )
    );
  }

  login() async {
    try{
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );
      if (userCredential != null){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Cliente()
            )
        );
      }
    }on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuário não encontrado'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
        else if(e.code == 'wrong-password'){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Senha incorreta'),
              backgroundColor: Colors.redAccent,
            ),
        );
      }
      }
    }
  }