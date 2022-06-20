import 'package:exhemih/cliente.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class cadastro_cliente extends StatefulWidget {
  const cadastro_cliente({Key? key}) : super(key: key);

  @override
  State<cadastro_cliente> createState() => _cadastro_cliente();
}

class _cadastro_cliente extends State<cadastro_cliente> {

  final _nome = TextEditingController();
  final _sobrenome = TextEditingController();
  final _cpf = TextEditingController();
  final _endereco = TextEditingController();
  final _telefone = TextEditingController();
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
              controller: _nome,
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome",
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
              controller: _sobrenome,
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Sobrenome",
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
              controller: _cpf,
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "CPF",
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
              controller: _endereco,
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Endereço",
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
              controller: _telefone,
              autofocus: true,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Telefone",
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
              style: TextStyle(
                  fontSize: 10
              ),
            ),
            SizedBox(
              height: 5,
            ),

            ElevatedButton(onPressed: () {
              cadastrar();
            },
              child: Text('Entrar'),
            ),

            Container(
              height: 30,
              alignment: Alignment.center,
              child: TextButton(
                child: Text(
                  "Cancelar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),

                onPressed: () => Navigator.pop(context, false),
                ),
              ),

          ]
      ),


    );
  }

  cadastrar() async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
          email: _email.text, password: _senha.text);
      if (userCredential != null) {
        userCredential.user!.updateDisplayName(_nome.text);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(),
        ),
            (route) => false);
    }
    }on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Crie uma senha mais forte'),
              backgroundColor: Colors.redAccent,
            ),
        );
      }else if(e.code == 'email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('E-mail já cadastrado'),
              backgroundColor: Colors.redAccent,
            )
        );
      }
    }
  }
}

_abreOutraTela(BuildContext ctx,page){
  Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext context)
  {
    return page;
  }));

}
