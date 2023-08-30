import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _jogadas = ["pedra", "papel", "tesoura"];
  var _imageApp = const AssetImage("images/padrao.png");
  var _menssagem = "Escolha sua jogada";

  void _opcaoSelecionada(String escolhaUsuario) {
    var _numJogada = Random().nextInt(_jogadas.length);
    var _jogadaSorteada = _jogadas[_numJogada];

    if (escolhaUsuario == "pedra" && _jogadaSorteada == "pedra") {
      setState(() {
        _menssagem = "Empate!";
      });
    }
    if (escolhaUsuario == "pedra" && _jogadaSorteada == "papel") {
      setState(() {
        _menssagem = "Você perdeu!";
      });
    }
    if (escolhaUsuario == "pedra" && _jogadaSorteada == "tesoura") {
      setState(() {
        _menssagem = "Você ganhou!";
      });
    }
    if (escolhaUsuario == "papel" && _jogadaSorteada == "pedra") {
      setState(() {
        _menssagem = "Você ganhou!";
      });
    }
    if (escolhaUsuario == "papel" && _jogadaSorteada == "papel") {
      setState(() {
        _menssagem = "Empate!";
      });
    }
    if (escolhaUsuario == "papel" && _jogadaSorteada == "tesoura") {
      setState(() {
        _menssagem = "Você perdeu!";
      });
    }
    if (escolhaUsuario == "tesoura" && _jogadaSorteada == "pedra") {
      setState(() {
        _menssagem = "Você perdeu!";
      });
    }
    if (escolhaUsuario == "tesoura" && _jogadaSorteada == "papel") {
      setState(() {
        _menssagem = "Você ganhou!";
      });
    }
    if (escolhaUsuario == "tesoura" && _jogadaSorteada == "tesoura") {
      setState(() {
        _menssagem = "Empate!";
      });
    }

    setState(() {
      _imageApp = AssetImage("images/$_jogadaSorteada.png");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Joken Po"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  "Escolha do APP",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Image(
                image: _imageApp,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32),
                child: Text(
                  _menssagem,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _opcaoSelecionada("pedra");
                    },
                    child: Image.asset(
                      "images/pedra.png",
                      height: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _opcaoSelecionada("papel");
                    },
                    child: Image.asset(
                      "images/papel.png",
                      height: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _opcaoSelecionada("tesoura");
                    },
                    child: Image.asset(
                      "images/tesoura.png",
                      height: 100,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
