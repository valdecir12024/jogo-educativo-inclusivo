import 'package:flutter/material.dart';
import '../services/controlador_audio.dart';

class FaseAdultoTela extends StatefulWidget {
  const FaseAdultoTela({super.key});

  @override
  State<FaseAdultoTela> createState() => _FaseAdultoTelaState();
}

class _FaseAdultoTelaState extends State<FaseAdultoTela> {
  final String _situacao = 'Você tem R\$ 50 para ir ao mercado comprar o jantar. Qual combinação de compras cabe no seu orçamento?';
  String _resultado = '';

   void _calcularOrcamento(int custo, String itens) {
    setState(() {
      if (custo <= 50) {
        _resultado = 'Excelente! Compras concluídas: $itens.\nTotal: R\$ $custo. Sobrou troco! 🛒';
        ControladorAudio.tocarAcerto(); // Toca o som de sucesso!
      } else {
        _resultado = 'Atenção! O total deu R\$ $custo. Passou de R\$ 50. Que tal escolher outra combinação? ⚠️';
        ControladorAudio.tocarDica(); // Toca o som de aviso/dica!
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
                label: 'Situação problema: $_situacao',
                child: Text(
                  _situacao,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 40),
              
              _criarBotaoPreco(
                'Arroz, Feijão e Frango (R\$ 42)', 
                'Opção um: Arroz, Feijão e Frango por quarenta e dois reais.', 
                () => _calcularOrcamento(42, 'Arroz, Feijão e Frango')
              ),
              const SizedBox(height: 15),
              
              _criarBotaoPreco(
                'Carne Nobre, Queijo e Sobremesa (R\$ 65)', 
                'Opção dois: Carne Nobre, Queijo e Sobremesa por sessenta e cinco reais.', 
                () => _calcularOrcamento(65, 'Carne Nobre, Queijo e Sobremesa')
              ),
              const SizedBox(height: 40),
              
              if (_resultado.isNotEmpty)
                Semantics(
                  liveRegion: true, // O leitor dita o sucesso ou o aviso do orçamento imediatamente
                  label: 'Análise do seu orçamento: $_resultado',
                  child: Text(
                    _resultado,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, color: Colors.amberAccent, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _criarBotaoPreco(String texto, String dicaAcessibilidade, VoidCallback aoClicar) {
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
