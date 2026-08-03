import 'package:flutter/material.dart';

class FaseAdultoTela extends StatefulWidget {
  const FaseAdultoTela({super.key});

  @override
  State<FaseAdultoTela> createState() => _FaseAdultoTelaState();
}

class _FaseAdultoTelaState extends State<FaseAdultoTela> {
  String _situacao = 'Você tem R\$ 50 para ir ao mercado comprar o jantar. Qual combinação de compras cabe no seu orçamento?';
  String _resultado = '';

  void _calcularOrcamento(int custo, String itens) {
    setState(() {
      if (custo <= 50) {
        _resultado = 'Excelente! Compras concluídas: $itens.\nTotal: R\$ $custo. Sobrou troco! 🛒';
      } else {
        _resultado = 'Atenção! O total deu R\$ $custo. Passou de R\$ 50. Que tal escolher outra combinação? ⚠️';
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
                _situacao,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 40),
              // Opção A
              _criarBotaoPreco('Arroz, Feijão e Frango (R\$ 42)', () => _calcularOrcamento(42, 'Arroz, Feijão e Frango')),
              const SizedBox(height: 15),
              // Opção B
              _criarBotaoPreco('Carne Nobre, Queijo e Sobremesa (R\$ 65)', () => _calcularOrcamento(65, 'Carne Nobre, Queijo e Sobremesa')),
              const SizedBox(height: 40),
              if (_resultado.isNotEmpty)
                Text(
                  _resultado,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, color: Colors.amberAccent, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _criarBotaoPreco(String texto, VoidCallback aoClicar) {
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
