import 'package:flutter/material.dart';
import 'tela_selecao_idade.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A237E), 
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Semantics avisa que este texto é o cabeçalho/título principal do app
              Semantics(
                header: true,
                label: 'Título do jogo: Jornada das Descobertas',
                child: const Text(
                  'JORNADA DAS DESCOBERTAS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36, 
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              const SizedBox(height: 60), 
              
              SizedBox(
                width: 300,
                height: 80, 
                // Semantics explica o que o botão faz antes do usuário clicar
                child: Semantics(
                  button: true,
                  label: 'Botão Jogar. Clique aqui para iniciar o jogo e escolher a faixa etária.',
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD54F), 
                      foregroundColor: Colors.black, 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      elevation: 5,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TelaSelecaoIdade()),
                      );
                    },
                    child: const Text(
                      'JOGAR',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
