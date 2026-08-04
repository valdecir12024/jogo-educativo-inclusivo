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
                Semantics(
                  header: true,
                  label: 'Pergunta de seleção: Quem vai jogar?',
                  child: const Text(
                    'QUEM VAI JOGAR?',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 40),

                _criarBotaoIdade(
                  context,
                  texto: 'CRIANÇAS (4 a 10 anos)',
                  dicaAcessibilidade: 'Botão para selecionar o nível infantil, de quatro a dez anos. Desafios visuais simples.',
                  corBotao: const Color(0xFF4CAF50),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FaseCriancaTela()));
                  },
                ),
                const SizedBox(height: 20),

                _criarBotaoIdade(
                  context,
                  texto: 'ADOLESCENTES (11 a 17 anos)',
                  dicaAcessibilidade: 'Botão para selecionar o nível de adolescentes, de onze a dezessete anos. Desafios de lógica e cidadania.',
                  corBotao: const Color(0xFFFF9800),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FaseAdolescenteTela()));
                  },
                ),
                const SizedBox(height: 20),

                _criarBotaoIdade(
                  context,
                  texto: 'ADULTOS (18 anos ou mais)',
                  dicaAcessibilidade: 'Botão para selecionar o nível de adultos, acima de dezoito anos. Desafios de autonomia e finanças práticas.',
                  corBotao: const Color(0x9EFFFFFF),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FaseAdultoTela()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _criarBotaoIdade(BuildContext context, {
    required String texto, 
    required String dicaAcessibilidade, 
    required Color corBotao, 
    required VoidCallback onPressed
  }) {
    return SizedBox(
      width: 340,
      height: 75,
      child: Semantics(
        button: true,
        label: dicaAcessibilidade, // O leitor de tela lerá este texto explicativo detalhado!
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
      ),
    );
  }
}
