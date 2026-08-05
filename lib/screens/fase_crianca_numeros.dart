import 'package:flutter/material.dart';
import '../services/controlador_audio.dart';
import '../services/gerenciador_acessibilidade.dart';

class FaseCriancaNumerosTela extends StatefulWidget {
  const FaseCriancaNumerosTela({super.key});

  @override
  State<FaseCriancaNumerosTela> createState() => _FaseCriancaNumerosTelaState();
}

class _FaseCriancaNumerosTelaState extends State<FaseCriancaNumerosTela> {
  int _desafioAtual = 0;
  bool _acertou = false;
  String _mensagemFeedback = '';

  final List<Map<String, dynamic>> _desafios = [
    {
      'pergunta': 'Quantos blocos azuis você vê na tela? Encontre o número 3!',
      'quantidade': 3,
      'dica': 'Tente de novo! Vamos contar juntos: um, dois, três blocos.',
      'opEsq': '3', 'respEsq': true,
      'opDir': '5', 'respDir': false,
    },
    {
      'pergunta': 'Agora, conte as caixas! Encontre o número 2!',
      'quantidade': 2,
      'dica': 'Tente de novo! Pista: É menos que três.',
      'opEsq': '4', 'respEsq': false,
      'opDir': '2', 'respDir': true,
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
        _mensagemFeedback = _desafioAtual < 1 ? 'Parabéns! Você acertou! 🎉' : 'Incrível! Você domina os números! 🏆';
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

    return ValueListenableBuilder<bool>(
      valueListenable: GerenciadorAcessibilidade.altoContraste,
      builder: (context, altoContrasteAtivo, child) {
        return Scaffold(
          backgroundColor: GerenciadorAcessibilidade.obterCorFundo(),
          appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.white, size: 30)),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Semantics(
                    liveRegion: true,
                    label: _mensagemFeedback,
                    child: Text(_mensagemFeedback, textAlign: TextAlign.center, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                  const SizedBox(height: 30),
                  
                  // Renderiza os blocos visuais dinamicamente baseado na quantidade
                  if (!_acertou)
                    Semantics(
                      label: 'Imagem representativa com ${atual['quantidade']} blocos empilhados.',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          atual['quantidade'],
                          (index) => Container(
                            width: 50, height: 50,
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 40),
                  if (!_acertou)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _criarBotaoNumero(atual['opEsq'], () => _verificarResposta(atual['respEsq'])),
                        _criarBotaoNumero(atual['opDir'], () => _verificarResposta(atual['respDir'])),
                      ],
                    ),
                  if (_acertou && _desafioAtual < 1) ...[
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 250, height: 65,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                        onPressed: _proximaPergunta,
                        child: const Text('AVANÇAR', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                  if (_acertou && _desafioAtual == 1) ...[
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 250, height: 65,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                        onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                        child: const Text('VOLTAR AO MENU', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _criarBotaoNumero(String texto, VoidCallback aoClicar) {
    return SizedBox(
      width: 120, height: 75,
      child: Semantics(
        button: true,
        label: 'Opção número $texto',
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFD54F), foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          onPressed: aoClicar,
          child: Text(texto, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
