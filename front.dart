import 'package:flutter/material.dart';

//app de Gasolina ou alcool

//diferença da gasolina for >=0.7 = melhor abastecer com gasolina

//else = melhor alcool

//preço do alcool / preço da gasolina >= 0.7

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,


    home: AppAlcool(),
  ));
}

class AppAlcool extends StatefulWidget {
  //const AppAlcool({Key? key}) : super(key: key);

  @override
  State<AppAlcool> createState() => _AppAlcoolState();
}

class _AppAlcoolState extends State<AppAlcool> {

  //back end

  TextEditingController _controllerAlcool = TextEditingController();

  //pegar o input do textfild Gasolina
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = ""; //exibir o resultado

  //criar uma função e declarar controler para doble

  void _calcular() {
    double?precoalcool = double.tryParse(
        _controllerAlcool.text); //transformar texto em número
    double?precogasolina = double.tryParse(
        _controllerGasolina.text); //transformar texto em número

    if (precoalcool == null || precogasolina == null) {
      setState(() {
        _textoResultado =
        'Digite um Número válido,digite números maiores que (0) e utilize pontos';
      });
    }
    else {
      if ((precoalcool / precogasolina) >= 0.7)
        setState(() {
          _textoResultado = 'Melhor abastecer com gasolina';
        });
      else {
        setState(() {
          _textoResultado = "melhor abastecer com ALcool";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white
            ),
            onPressed: () {
              // do something
            },
          ),

            IconButton(
            icon: Icon(
            Icons.settings,
            color: Colors.white
            ),

            onPressed: () {
            // do something
            },
            )
            ],

        backgroundColor: Colors.green,
        title: Text('Álcool ou Gasolina'),

      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32), //espaçamento do app com o logo
          child: Column(
            //alinhamentos
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //alinhamento do tipo stretch= alongar, no alongar a....
            //imagem da logo
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 10),
                //botom é o espaçamento para baixo
                //logo grudado com outro elemento abaixo.
                child: Image.asset('image/logo.png'),

              ),
              Padding(padding: EdgeInsets.only(bottom: 10),
                child: Text(
                    'Saiba qual é a melhor opção para abastecer o seu carro'
                ),

              ),
              TextField(
                keyboardType: TextInputType.number, //teclado de número
                decoration: InputDecoration(
                  labelText: 'Preço do Álcool, ex:3.59',

                ),
                style: TextStyle(fontSize: 22),
                controller: _controllerAlcool, //pegar o input do valor da gasolina..
                //para o cálculo
              ),
              TextField(
                keyboardType: TextInputType.number, //teclado de número
                decoration: InputDecoration(
                  labelText: 'Preço da Gasolina, ex:3.80',

                ),
                style: TextStyle(fontSize: 22),
                controller: _controllerGasolina, //pegar o input do valor da gasolina..

                //para o cálculo
              ),

              Padding(padding: EdgeInsets.only(top: 20),
                //espaçamento entre a label e o botão calcular
                child: ElevatedButton(
                  onPressed: _calcular, child: Text('calcular'),
                  style: ElevatedButton.styleFrom(backgroundColor:Colors.green)



                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20),
                child: Text(_textoResultado),
              ),
              Padding(padding: EdgeInsets.only(top:40),
                child:  ListTile(
                    leading:Icon(Icons.phone) ,
                    title: Text('Telefone para contato'),
                    subtitle: Text('(11) 96651-0710'),

              )

              ),


            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,

      ),
    );
  }
}

