import 'package:flutter/material.dart';
import '../services/controlador_audio.dart';

class FaseCriancaTela extends StatefulWidget {
  const FaseCriancaTela({super.key});

  @override
  State<FaseCriancaTela> createState() => _FaseCriancaTelaState();
}

class _FaseCriancaTelaState extends State<FaseCriancaTela> {
  String _mensagemFeedback = 'Encontre o Círculo Vermelho!';
  Color _corTextoFeedback = Colors.white;

    void _verificarResposta(bool ehCorreto) {
    setState(() {
      if (ehCorreto) {
        _mensagemFeedback = 'Parabéns! Você acertou! 🎉';
        _corTextoFeedback = Colors.greenAccent;
        ControladorAudio.tocarAcerto(); // Toca o som de sucesso!
      } else {
        _mensagemFeedback = 'Tente de novo! Dica: Ele é redondo.';
        _corTextoFeedback = Colors.amberAccent;
        ControladorAudio.tocarDica(); // Toca o som de dica/estrutura!
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A237E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Semantics avisa a instrução atual do desafio
              Semantics(
                liveRegion: true, // Avisa o leitor para ditar imediatamente quando o texto mudar
                label: 'Instrução atual: $_mensagemFeedback',
                child: Text(
                  _mensagemFeedback,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: _corTextoFeedback),
                ),
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Opção 1: Quadrado Azul (Incorreto)
                  Semantics(
                    button: true,
                    label: 'Forma geométrica: Quadrado de cor Azul.',
                    child: GestureDetector(
                      onTap: () => _verificarResposta(false),
                      child: Container(
                        width: 120,
                        height: 120,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  // Opção 2: Círculo Vermelho (Correto)
                  Semantics(
                    button: true,
                    label: 'Forma geométrica: Círculo de cor Vermelha.',
                    child: GestureDetector(
                      onTap: () => _verificarResposta(true),
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
