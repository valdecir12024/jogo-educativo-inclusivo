import 'package:flutter/material.dart';

class FaseAdolescenteTela extends StatefulWidget {
  const FaseAdolescenteTela({super.key});

  @override
  State<FaseAdolescenteTela> createState() => _FaseAdolescenteTelaState();
}

class _FaseAdolescenteTelaState extends State<FaseAdolescenteTela> {
  String _narrativa = 'Você recebeu a mesada do mês. O que decide fazer para ajudar o meio ambiente e economizar?';
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
              Text(
                _narrativa,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 40),
              // Botão Opção A
              _criarBotaoOpcao('Comprar uma lâmpada LED para o quarto', () => _escolherOpcao('A')),
              const SizedBox(height: 15),
              // Botão Opção B
              _criarBotaoOpcao('Comprar um pacote de copos descartáveis', () => _escolherOpcao('B')),
              const SizedBox(height: 40),
              if (_resultado.isNotEmpty)
                Text(
                  _resultado,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, color: Colors.amberAccent, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _criarBotaoOpcao(String texto, VoidCallback aoClicar) {
    return SizedBox(
      width: 340,
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
    );
  }
}
