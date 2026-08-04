import 'package:flutter/material.dart';

class GuiaEducadorTela extends StatelessWidget {
  const GuiaEducadorTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A237E),
      appBar: AppBar(
        title: const Text('GUIA DO EDUCADOR', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _criarBlocoInformativo(
                  '1. Como Aplicar o Jogo',
                  'Utilize o jogo como ferramenta de apoio pedagógico. Deixe o aluno explorar as opções livremente e estimule-o a pensar sobre as dicas visuais e auditivas geradas pelas respostas.',
                ),
                const SizedBox(height: 25),
                _criarBlocoInformativo(
                  '2. Mediação Sem Punição',
                  'O jogo foi desenhado para não punir o erro. Se o estudante escolher uma opção incorreta, reforce positivamente a pista gerada pelo som e pelo texto, incentivando uma nova tentativa.',
                ),
                const SizedBox(height: 25),
                _criarBlocoInformativo(
                  '3. Uso com Leitores de Tela',
                  'Para estudantes com deficiência visual severa, ative o leitor de tela do dispositivo (TalkBack ou VoiceOver). O jogo lerá automaticamente as descrições de formas, cores e cenários.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _criarBlocoInformativo(String titulo, String texto) {
    return Semantics(
      container: true,
      label: '$titulo: $texto',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.amberAccent),
          ),
          const SizedBox(height: 8),
          Text(
            texto,
            style: const TextStyle(fontSize: 16, color: Colors.white, height: 1.4),
          ),
        ],
      ),
    );
  }
}
