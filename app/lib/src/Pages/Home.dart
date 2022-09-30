import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/src/Components/Menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  final _inputControllerValor1 = TextEditingController();
  final _inputControllerValor2 = TextEditingController();

  List<String> _list = [];

  String resultado = '';

  void _addItem(item) {
      _list.add(item);
  }

  void _removeItem(index) {
    _list.removeAt(index);
    setState(() {
      _list = _list;
    });
  }

  void _clearList() {
    setState(() {
      _inputControllerValor1.clear();
      _inputControllerValor2.clear();
      _list.clear();
      resultado = '0.00';
    });
}

  void _adicao(){
    setState(()
    {
      double valor1 = double.parse(_inputControllerValor1.text);
      double valor2 = double.parse(_inputControllerValor2.text);

      double soma = valor1 + valor2;
      resultado = soma.toString();
      _addItem(resultado.toString());
    });
  }

  void _subtracao() {
    setState(()
    {
      double valor1 = double.parse(_inputControllerValor1.text);
      double valor2 = double.parse(_inputControllerValor2.text);

      double subtracao = valor1 - valor2;
      resultado = subtracao.toString();
      _addItem(resultado.toString());
    });
  }
  void _multiplicacao() {
    setState(()
    {
      double valor1 = double.parse(_inputControllerValor1.text);
      double valor2 = double.parse(_inputControllerValor2.text);

      double multiplicacao = valor1 * valor2;
      resultado = multiplicacao.toString();
      _addItem(resultado.toString());
    });
  }
  void _divisao() {
    setState(()
    {
      double valor1 = double.parse(_inputControllerValor1.text);
      double valor2 = double.parse(_inputControllerValor2.text);

      double divisao = valor1 / valor2;
      resultado = divisao.toString();
      _addItem(resultado.toString());
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora Lista"),
          actions: <Widget>[
      Padding(
      padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: _clearList,
          child: Icon(
            Icons.refresh,
            size: 26.0,
          ),
        )
    ),
]
    ),
      drawer: Menu(context),
        body: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                Icon(
                  Icons.calculate_outlined,
                  color: Colors.blue,
                  size: 150.0,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: TextField(
                    controller: _inputControllerValor1,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: 16
                    ),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.add_circle),
                        labelText: 'Digite um numerwo'
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: TextField(
                    controller: _inputControllerValor2,
                    keyboardType: TextInputType.number,

                    style: TextStyle(
                        fontSize: 16
                    ),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.add_circle),
                        labelText: 'Digite um numero'
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Container(
                          child: RaisedButton(
                            onPressed: _adicao,
                            child: Text(
                              '+',
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Container(
                          child: RaisedButton(
                            onPressed: _subtracao,
                            child: Text(
                              '-',
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Container(
                          child: RaisedButton(
                            onPressed: _multiplicacao,
                            child: Text(
                              '*',
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Container(
                          child: RaisedButton(
                            onPressed: _divisao,
                            child: Text(
                              '/',
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                ),
                Text(
                  '$resultado',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () => _removeItem(index),
                          child: Container(
                            color: Colors.blue,
                            margin: EdgeInsets.all(15),
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.center,
                            child: Text(
                              '${index + 1} - ${_list[index]}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          )
                      );
                    },
                  ),
                ),
              ]
          ),
        )
    );
  }
}