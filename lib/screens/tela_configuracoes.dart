import 'package:flutter/material.dart';
import '../services/gerenciador_acessibilidade.dart';

class TelaConfiguracoes extends StatefulWidget {
  const TelaConfiguracoes({super.key});

  @override
  State<TelaConfiguracoes> createState() => _TelaConfiguracoesState();
}

class _TelaConfiguracoesState extends State<TelaConfiguracoes> {
  @override
  Widget build(BuildContext context) {
    final fundo = GerenciadorAcessibilidade.obterCorFundo();

    return Scaffold(
      backgroundColor: fundo,
      appBar: AppBar(
        title: const Text('CONFIGURAÇÕES', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ajuste o jogo para suas necessidades:',
              style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 40),

            // Configuração de Som
            SwitchListTile(
              title: const Text('Efeitos de Som', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: const Text('Toca sons ao acertar ou receber dicas', style: TextStyle(color: Colors.white70)),
              value: GerenciadorAcessibilidade.somAtivado.value,
              activeColor: const Color(0xFFFFD54F),
              onChanged: (bool valor) {
                setState(() {
                  GerenciadorAcessibilidade.somAtivado.value = valor;
                });
              },
            ),
            const SizedBox(height: 20),

            // Configuração de Contraste Global
            SwitchListTile(
              title: const Text('Alto Contraste Visual', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: const Text('Muda o fundo para preto absoluto para leitura nítida', style: TextStyle(color: Colors.white70)),
              value: GerenciadorAcessibilidade.altoContraste.value,
              activeColor: const Color(0xFFFFD54F),
              onChanged: (bool valor) {
                setState(() {
                  GerenciadorAcessibilidade.altoContraste.value = valor;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
