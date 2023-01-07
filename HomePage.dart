

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //controllers de TextField
  TextEditingController _controlerAlcool = TextEditingController();
  TextEditingController _controlerGasolina = TextEditingController();

  //Text
  var _resultado = "";

  //metodo calcular

  void _calcular(){


    double? precoAlcool = double.tryParse( _controlerAlcool.text );
    double? precoGasolina = double.tryParse( _controlerGasolina.text );

    if(precoAlcool == null || precoGasolina == null){
      setState(() {
        _resultado = "digite numeros maiores que (0) e utilizando (.)";

        _limparCampos();

      });
    }else{
      if(precoAlcool / precoGasolina < 0.7 ){
        setState(() {
          _resultado = "É melhor abastecer com abastecer com Alcool";
        });
      } else{
        setState(() {
          _resultado = "Nesse caso é melhor bastecer com Gasolina";
        });
      }

    }
  }

  void _limparCampos(){
    _controlerGasolina.text = "";
    _controlerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou gasolina"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32, top: 50),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("Saiba qual a melhor opção de abastecimento para seu carro",
                    textAlign: TextAlign.center ,
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 22,
                        fontWeight: FontWeight.w600
                    ),
                  )
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: TextField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço alcool, ex: 3.20"
                  ),
                  style: TextStyle(
                      fontSize: 15
                  ),
                  controller: _controlerAlcool,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(),
                child: TextField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço gasolina, ex: 4.50"
                  ),
                  style: TextStyle(
                      fontSize: 15
                  ),
                  controller: _controlerGasolina,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  onPressed: _calcular ,
                  child: Text('Calcular',
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 10),
                  child: Text(_resultado ,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 17,
                        fontWeight: FontWeight.normal
                    ),
                  )
              ),
            ],
          ),
        )
      )
    );
  }
}
