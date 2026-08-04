import 'package:flutter/material.dart';

class FaseAdolescenteTela extends StatefulWidget {
  const FaseAdolescenteTela({super.key});

  @override
  State<FaseAdolescenteTela> createState() => _FaseAdolescenteTelaState();
}

class _FaseAdolescenteTelaState extends State<FaseAdolescenteTela> {
  final String _narrativa = 'Você recebeu a mesada do mês. O que decide fazer para ajudar o meio ambiente e economizar?';
  String _resultado = '';

  void _escolherOpcao(String escolha) {
    setState(() {
      if (escolha == 'A') {
        _resultado = 'Boa escolha! Comprar uma lâmpada LED economiza energia a longo prazo e ajuda o planeta. 💡';
      } else {
        _resultado = 'Pense bem! Comprar copos descartáveis gera muito lixo plástico. Que tal repensar? ♻️';
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
              Semantics(
                label: 'Pergunta do desafio: $_narrativa',
                child: Text(
                  _narrativa,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 40),
              
              _criarBotaoOpcao(
                'Comprar uma lâmpada LED para o quarto', 
                'Opção A: Comprar uma lâmpada LED para o quarto', 
                () => _escolherOpcao('A')
              ),
              const SizedBox(height: 15),
              
              _criarBotaoOpcao(
                'Comprar um pacote de copos descartáveis', 
                'Opção B: Comprar um pacote de copos descartáveis', 
                () => _escolherOpcao('B')
              ),
              const SizedBox(height: 40),
              
              if (_resultado.isNotEmpty)
                Semantics(
                  liveRegion: true, // Força o leitor de tela a falar o resultado assim que ele aparecer
                  label: 'Resultado da sua escolha: $_resultado',
                  child: Text(
                    _resultado,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, color: Colors.amberAccent, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _criarBotaoOpcao(String texto, String dicaAcessibilidade, VoidCallback aoClicar) {
    return SizedBox(
      width: 340,
      child: Semantics(
        button: true,
        label: dicaAcessibilidade,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white24,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: aoClicar,
          child: Text(texto, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
