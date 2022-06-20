import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Tela1_Cliente.dart';
import 'cadastro.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _email = TextEditingController();
  final _senha = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: const Text(
              "Você está acessando como Cliente",
              style: TextStyle(
                color: Colors.grey, fontSize: 10,
              ),
            ),
            backgroundColor: Colors.white,
          ),
        ),

        body: ListView(
          padding: EdgeInsets.only(top: 10, left: 40, right: 40),
          children: [

            TextFormField(
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "E-mail",
            labelStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
          style: TextStyle(
            fontSize: 10,
          ),
        ),

    SizedBox(
    height: 5,
    ),

            TextFormField(
              controller: _senha,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              style: TextStyle(fontSize: 10),
            ),

            SizedBox(
              height: 5,
            ),

            ElevatedButton(onPressed: (){
              login();
            }, child: Text('Entrar'),
            ),

            Container(
              height: 30,
              alignment: Alignment.center,
              child: TextButton(
                child: Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),

                onPressed: () => Navigator.pop(_abreOutraTela(context, cadastro_cliente()),
                ),
              ),
            ),
          ],

        )
        );
  }

  login() async {
    try{
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: _email .text,
          password: _senha.text
      );
      if (userCredential != null){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ti_cliente()
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

  _abreOutraTela(BuildContext ctx,page){
    Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext context)
    {
      return page;
    }));

  }
}
