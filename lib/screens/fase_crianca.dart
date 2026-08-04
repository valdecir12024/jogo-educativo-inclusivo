import 'package:flutter/material.dart';
import '../services/controlador_audio.dart';

class FaseCriancaTela extends StatefulWidget {
  const FaseCriancaTela({super.key});

  @override
  State<FaseCriancaTela> createState() => _FaseCriancaTelaState();
}

class _FaseCriancaTelaState extends State<FaseCriancaTela> {
  int _desafioAtual = 0;
  bool _acertou = false;
  String _mensagemFeedback = '';

  // Lista com os 3 desafios inclusivos da fase infantil
  final List<Map<String, dynamic>> _desafios = [
    {
      'pergunta': 'Encontre o Círculo Vermelho!',
      'dica': 'Tente de novo! Dica: Ele é redondo.',
      'corEsq': Colors.blue, 'formaEsq': BoxShape.rectangle, 'respEsq': false,
      'corDir': Colors.red, 'formaDir': BoxShape.circle, 'respDir': true,
    },
    {
      'pergunta': 'Agora, encontre o Quadrado Amarelo!',
      'dica': 'Tente de novo! Dica: Ele tem quatro lados iguais.',
      'corEsq': Colors.yellow, 'formaEsq': BoxShape.rectangle, 'respEsq': true,
      'corDir': Colors.green, 'formaDir': BoxShape.circle, 'respDir': false,
    },
    {
      'pergunta': 'Por fim, encontre o Círculo Verde!',
      'dica': 'Tente de novo! Dica: Ele é redondo e tem a cor das árvores.',
      'corEsq': Colors.orange, 'formaEsq': BoxShape.rectangle, 'respEsq': false,
      'corDir': Colors.green, 'formaDir': BoxShape.circle, 'respDir': true,
    },
  ];

  @override
  void initState() {
    super.initState();
    _mensagemFeedback = _desafios[_desafioAtual]['pergunta'];
  }

  void _verificarResposta(bool ehCorreto) {
    setState(() {
      if (ehCorreto) {
        _mensagemFeedback = _desafioAtual < 2 ? 'Parabéns! Você acertou! 🎉' : 'Sensacional! Você concluiu todos os desafios! 🏆';
        _acertou = true;
        ControladorAudio.tocarAcerto();
      } else {
        _mensagemFeedback = _desafios[_desafioAtual]['dica'];
        _acertou = false;
        ControladorAudio.tocarDica();
      }
    });
  }

  void _proximaPergunta() {
    setState(() {
      _desafioAtual++;
      _acertou = false;
      _mensagemFeedback = _desafios[_desafioAtual]['pergunta'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final atual = _desafios[_desafioAtual];
    return Scaffold(
      backgroundColor: const Color(0xFF1A237E),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.white, size: 30)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Semantics(
                liveRegion: true,
                label: 'Instrução: $_mensagemFeedback',
                child: Text(_mensagemFeedback, textAlign: TextAlign.center, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              const SizedBox(height: 50),
              if (!_acertou)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _criarOpcaoGeometria(atual['corEsq'], atual['formaEsq'], () => _verificarResposta(atual['respEsq']), atual['formaEsq'] == BoxShape.circle ? 'Círculo' : 'Quadrado'),
                    _criarOpcaoGeometria(atual['corDir'], atual['formaDir'], () => _verificarResposta(atual['respDir']), atual['formaDir'] == BoxShape.circle ? 'Círculo' : 'Quadrado'),
                  ],
                ),
              if (_acertou && _desafioAtual < 2) ...[
                const SizedBox(height: 30),
                SizedBox(
                  width: 250, height: 65,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    onPressed: _proximaPergunta,
                    child: const Text('AVANÇAR', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _criarOpcaoGeometria(Color cor, BoxShape forma, VoidCallback aoClicar, String nomeForma) {
    return Semantics(
      button: true,
      label: 'Forma geométrica: $nomeForma de cor correspondente.',
      child: GestureDetector(
        onTap: aoClicar,
        child: Container(width: 120, height: 120, decoration: BoxDecoration(color: cor, shape: forma)),
      ),
    );
  }
}
