import 'package:flutter/material.dart';
import 'fase_crianca.dart';
import 'fase_adolescente.dart';
import 'fase_adulto.dart';

class TelaSelecaoIdade extends StatelessWidget {
  const TelaSelecaoIdade({super.key});

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'QUEM VAI JOGAR?',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 40),

                // 1. Crianças
                _criarBotaoIdade(
                  context,
                  texto: 'CRIANÇAS (4 a 10 anos)',
                  corBotao: const Color(0xFF4CAF50),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FaseCriancaTela()),
                    );
                  },
                ),
                const SizedBox(height: 20),

                // 2. Adolescentes
                _criarBotaoIdade(
                  context,
                  texto: 'ADOLESCENTES (11 a 17 anos)',
                  corBotao: const Color(0xFFFF9800),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FaseAdolescenteTela()),
                    );
                  },
                ),
                const SizedBox(height: 20),

                // 3. Adultos
                _criarBotaoIdade(
                  context,
                  texto: 'ADULTOS (18 anos ou mais)',
                  corBotao: const Color(0x9EFFFFFF),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FaseAdultoTela()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _criarBotaoIdade(BuildContext context, {required String texto, required Color corBotao, required VoidCallback onPressed}) {
    return SizedBox(
      width: 340,
      height: 75,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: corBotao,
          foregroundColor: corBotao == const Color(0x9EFFFFFF) ? Colors.black : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            texto,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
