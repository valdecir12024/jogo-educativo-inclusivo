import 'package:flutter/material.dart';
import 'tela_selecao_idade.dart';
import 'tela_configuracoes.dart';
import 'guia_educador.dart';
import '../services/gerenciador_acessibilidade.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    // ValueListenableBuilder reconstrói a tela inicial quando o contraste muda
    return ValueListenableBuilder<bool>(
      valueListenable: GerenciadorAcessibilidade.altoContraste,
      builder: (context, altoContrasteAtivo, child) {
        // Pega as cores corretas (preto se ativo, azul se desativado)
        final corFundo = GerenciadorAcessibilidade.obterCorFundo();
        final corBotaoPrincipal = GerenciadorAcessibilidade.obterCorBotao();

        return Scaffold(
          backgroundColor: corFundo, 
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  const SizedBox(height: 50), 
                  
                  // Botão JOGAR
                  SizedBox(
                    width: 300, height: 75, 
                    child: Semantics(
                      button: true,
                      label: 'Botão Jogar. Clique aqui para iniciar o jogo.',
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: corBotaoPrincipal, 
                          foregroundColor: Colors.black, 
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 5,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaSelecaoIdade()));
                        },
                        child: const Text('JOGAR', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Botão CONFIGURAÇÕES
                  SizedBox(
                    width: 300, height: 55,
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
                        child: const Text('CONFIGURAÇÕES', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Botão GUIA DO EDUCADOR
                  SizedBox(
                    width: 300, height: 55,
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
                        child: const Text('GUIA DO EDUCADOR', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
