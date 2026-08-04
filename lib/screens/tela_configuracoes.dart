import 'package:flutter/material.dart';

class TelaConfiguracoes extends StatefulWidget {
  const TelaConfiguracoes({super.key});

  @override
  State<TelaConfiguracoes> createState() => _TelaConfiguracoesState();
}

class _TelaConfiguracoesState extends State<TelaConfiguracoes> {
  bool _somAtivado = true;
  bool _altoContraste = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A237E),
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
            Semantics(
              label: 'Configuração de som. Atual: ${_somAtivado ? "Ativado" : "Desativado"}. Toque duas vezes para alterar.',
              child: SwitchListTile(
                title: const Text('Efeitos de Som', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: const Text('Toca sons ao acertar ou receber dicas', style: TextStyle(color: Colors.white70)),
                value: _somAtivado,
                activeColor: Colors.amberAccent,
                onChanged: (bool valor) {
                  setState(() {
                    _somAtivado = valor;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),

            // Configuração de Contraste
            Semantics(
              label: 'Configuração de alto contraste. Atual: ${_altoContraste ? "Ativado" : "Desativado"}. Toque duas vezes para alterar.',
              child: SwitchListTile(
                title: const Text('Alto Contraste Visual', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: const Text('Muda as cores de fundo para preto e branco', style: TextStyle(color: Colors.white70)),
                value: _altoContraste,
                activeColor: Colors.amberAccent,
                onChanged: (bool valor) {
                  setState(() {
                    _altoContraste = valor;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
