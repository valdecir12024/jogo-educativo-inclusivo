import 'package:flutter/material.dart';
import 'tela_selecao_idade.dart';
import 'tela_configuracoes.dart';
import 'guia_educador.dart';

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
              
                            // Botão JOGAR que já existia...
              SizedBox(
                width: 300, height: 80,
                child: Semantics(
                  button: true,
                  label: 'Botão Jogar. Clique aqui para iniciar o jogo.',
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFD54F), foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaSelecaoIdade()));
                    },
                    child: const Text('JOGAR', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Espaço entre os botões

                       // NOVO: Botão do Guia do Educador
              SizedBox(
                width: 300, height: 60,
                child: Semantics(
                  button: true,
                  label: 'Botão Guia do Educador. Clique para ler as orientações pedagógicas.',
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 2),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const GuiaEducadorTela()));
                    },
                    child: const Text('GUIA DO EDUCADOR', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              
              // NOVO: Botão de Configurações
              SizedBox(
                width: 300, height: 60,
                child: Semantics(
                  button: true,
                  label: 'Botão Configurações. Clique para ajustar som e contraste visual.',
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 2),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaConfiguracoes()));
                    },
                    child: const Text('CONFIGURAÇÕES', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    
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
