import 'package:flutter/material.dart';
import 'package:aula_10/front.dart';
//app de Gasolina ou alcool

//diferença da gasolina for >=0.7 = melhor abastecer com gasolina

//else = melhor alcool

//preço do alcool / preço da gasolina >= 0.7

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'app Gasolina ou alcool',
    home: AppAlcool(),
  ));
}


