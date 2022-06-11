import 'package:flutter/material.dart';
import 'cadastro_cliente.dart';
import 'tela_inicial_cliente.dart';

class cliente extends StatelessWidget {
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

      body: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              alignment: Alignment(0.0, 1.15),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage("Imagens/H.png"),
                  //fit: BoxFit.fitHeight,
                ),
              ),

              child:
              TextFormField(
                // autofocus: true,
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
            ),

            SizedBox(
              height: 5,
            ),

            TextFormField(
              // autofocus: true,
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

            Container(
              height: 30,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0x70000FFF),
                    Color(0xAAA00FFF),
                  ],
                ),

                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),


              child: SizedBox.expand(
                child: FlatButton(
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () => Navigator.pop(_abreOutraTela(context, ti_cliente())),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Container(
              height: 20,
              alignment: Alignment.center,
              child: FlatButton(
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


            Container(
              height: 20,
              alignment: Alignment.center,
              child: FlatButton(
                child: Text(
                  "Cancelar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 8,
                  ),
                ),

                onPressed: () => Navigator.pop(context, false),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _abreOutraTela(BuildContext ctx,page){
    Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext context)
    {
      return page;
    }));

  }
}

