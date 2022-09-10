import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/src/Components/Menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  final _inputControllerPeso = TextEditingController();
  final _inputControllerAlt = TextEditingController();

  String _info = "Informe seus dados.";

  void _calcular(){
    setState(()
    {
      double peso = double.parse(_inputControllerPeso.text);
      double alt = double.parse(_inputControllerAlt.text) / 100;
      double imc = peso / ( alt * alt);

      print(imc);
      if(imc < 18.6){
        _info = 'Abaixo do Peso (${imc.toStringAsPrecision(3)})';
      } else if(imc >= 18.6 && imc < 24.9){
        _info = 'Peso Ideal (${imc.toStringAsPrecision(3)})';
      } else if(imc >= 24.9 && imc < 29.9){
        _info = 'Levemente Acima do Peso (${imc.toStringAsPrecision(3)})';
      } else if(imc >= 29.9 && imc < 34.9){
        _info = 'Obesidade Grau I (${imc.toStringAsPrecision(3)})';
      } else if(imc >= 34.9 && imc < 39.9){
        _info = 'Obesidade Grau II (${imc.toStringAsPrecision(3)})';
      } else if(imc >= 40){
        _info = 'Obesidade Grau III (${imc.toStringAsPrecision(3)})';
      }
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de Imc"),
      ),
      drawer: Menu(context),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  width: 300,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _inputControllerPeso,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Peso (kg)'
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _inputControllerAlt,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Altura (cm)'
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Container(
                    width: 300,
                    height: 50,
                    child: RaisedButton(
                      onPressed: _calcular,
                      child: Text('Calcular',style: TextStyle(color: Colors.white, fontSize: 25.0),),
                      color: Colors.blue,
                    ),
                  ),
                ),
                Text(_info,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 15, height: 5),
                )
              ]
          ),
        )
    );
  }
}