import 'package:flutter/material.dart';
import 'prestador.dart';
import 'cliente.dart';


class Tela1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
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
                ),
              ),
            ),

            Container(
              width: 50,
              height: 50,
              alignment: Alignment(0.0, 0.0),
              child: FlatButton(
                onPressed: () => Navigator.pop(_abreOutraTela(context, cliente())),
                padding: EdgeInsets.all(0.0),
                child: Image.asset("Imagens/1.png"),
                //child: Icon(
                //Icons.person,
                //size: 50,
              ),
              //onPressed: () => Navigator.pop(_abreOutraTela(context, cliente())),

            ),


            Container(
                width: 50,
                height: 50,
                alignment: Alignment(0.0, 0.0),
                child: FlatButton(
                  onPressed: () => Navigator.pop(_abreOutraTela(context, prestador())),
                  padding: EdgeInsets.all(0.0),
                  child: Image.asset("Imagens/2.png"),
                )
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
