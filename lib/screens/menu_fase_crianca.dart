import 'package:flutter/material.dart';
import 'fase_crianca.dart';
import 'fase_crianca_numeros.dart'; // Garante que este import está aqui!
import '../services/gerenciador_acessibilidade.dart';

class MenuFaseCrianca extends StatelessWidget {
  const MenuFaseCrianca({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: GerenciadorAcessibilidade.altoContraste,
      builder: (context, altoContrasteAtivo, child) {
        final corFundo = GerenciadorAcessibilidade.obterCorFundo();
        final corBotao = GerenciadorAcessibilidade.obterCorBotao();

        return Scaffold(
          backgroundColor: corFundo,
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
                  const Text(
                    'ESCOLHA O DESAFIO',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 40),

                  // Jogo 1: Formas e Cores
                  _criarBotaoMenu(
                    texto: 'FORMAS E CORES',
                    cor: corBotao,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const FaseCriancaTela()));
                    },
                  ),
                  const SizedBox(height: 20),

                  // Jogo 2: Números e Quantidades
                  _criarBotaoMenu(
                    texto: 'NÚMEROS E QUANTIDADES',
                    cor: altoContrasteAtivo ? Colors.white24 : Colors.orange,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const FaseCriancaNumerosTela()));
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _criarBotaoMenu({required String texto, required Color cor, required VoidCallback onPressed}) {
    return SizedBox(
      width: 320,
      height: 75,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: cor,
          foregroundColor: cor == Colors.white ? Colors.black : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: onPressed,
        child: Text(texto, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
