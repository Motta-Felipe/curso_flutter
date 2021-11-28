import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntasAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual è a sua cor favorita',
      'respostas': [
        'Preto',
        'Vermelho',
        'Verde',
        'Branco',
      ],
    },
    {
      'texto': 'Qual è o seu animal favorito',
      'respostas': [
        'Coelho',
        'Cobra',
        'Elefante',
        'Leao',
      ],
    },
    {
      'texto': 'Qual è o seu instrutor favorito',
      'respostas': [
        'Maria',
        'Joao',
        'Leo',
        'Pedro',
      ],
    }
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    

    //for(var textoResp in respostas){
    //  widgets.add(Resposta(textoResp, _responder));
    //}

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              quandoResponder: _responder,
            )
            : Resultado(),
      ),
    );

//    throw UnimplementedError();
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntasAppState createState() {
    return _PerguntasAppState();
  }
}
