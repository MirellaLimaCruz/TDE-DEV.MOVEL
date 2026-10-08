import 'package:flutter/material.dart';
import 'package:eval_ex/expression.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Calculadora Flutter';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textoDoVisor = "0";

  void calcula() {
    try {
      Expression exp = Expression(textoDoVisor);
      textoDoVisor = exp.eval().toString();
    } catch (e) {
      textoDoVisor = "Erro";
    }
    setState(() {});
  }

  void clicabotao(String valor) {

    if (textoDoVisor == "0" || textoDoVisor == "Erro") {
      if (["+", "-", "*", "/"].contains(valor)) {
        textoDoVisor = "0$valor";
      } else {
        textoDoVisor = valor;
      }
    } else {
      textoDoVisor = textoDoVisor + valor;
    }
    setState(() {});
  }

  void apagar() {
    textoDoVisor = "0";
    setState(() {});
  }


  Widget botao(String texto, VoidCallback funcao) {
    return TextButton(
      onPressed: funcao,
      child: Text(
        texto, 
        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 30, right: 20, bottom: 20),
              alignment: Alignment.centerRight,
              child: Text(
                textoDoVisor,
                style: const TextStyle(fontSize: 60),
              ),
            ),
            const Spacer(), 
            GridView.count(
              crossAxisCount: 4,
              primary: true,
              shrinkWrap: true,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                botao("1", () => clicabotao("1")),
                botao("2", () => clicabotao("2")),
                botao("3", () => clicabotao("3")),
                botao("+", () => clicabotao("+")),
                
                botao("4", () => clicabotao("4")),
                botao("5", () => clicabotao("5")),
                botao("6", () => clicabotao("6")),
                botao("-", () => clicabotao("-")),
                
                botao("7", () => clicabotao("7")),
                botao("8", () => clicabotao("8")),
                botao("9", () => clicabotao("9")),
                botao("*", () => clicabotao("*")),
                
                botao("CE", () => apagar()),
                botao("0", () => clicabotao("0")),
                botao("=", () => calcula()),
                botao("/", () => clicabotao("/")),
              ],
            )
          ],
        ));
  }
}