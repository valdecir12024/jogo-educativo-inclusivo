import 'package:flutter/material.dart';
import '../services/controlador_audio.dart';

class FaseAdultoTela extends StatefulWidget {
  const FaseAdultoTela({super.key});

  @override
  State<FaseAdultoTela> createState() => _FaseAdultoTelaState();
}

class _FaseAdultoTelaState extends State<FaseAdultoTela> {
  int _desafioAtual = 0;
  bool _acertou = false;
  String _resultadoFeedback = '';

  // Lista com os 3 cenários práticos de autonomia e cognição
  final List<Map<String, dynamic>> _cenarios = [
    {
      'situacao': 'Você tem R\$ 50 para ir ao mercado comprar o jantar. Qual combinação de compras cabe no seu orçamento?',
      'opA': 'Arroz, Feijão e Frango (R\$ 42).',
      'opB': 'Carne Nobre, Queijo e Sobremesa (R\$ 65).',
      'sucesso': 'Excelente! O total deu R\$ 42. Sobrou troco e você manteve o controle financeiro! 🛒',
      'dica': 'Atenção! O total de R\$ 65 ultrapassa o seu limite de R\$ 50. Que tal recalcular? ⚠️',
      'respCorreta': 'A',
    },
    {
      'situacao': 'Você recebeu uma mensagem no celular dizendo: "Sua conta foi bloqueada, clique aqui urgente". O que você faz?',
      'opA': 'Clico no link imediatamente para resolver o problema rápido.',
      'opB': 'Não clico. Abro o aplicativo oficial do banco ou ligo para o gerente.',
      'sucesso': 'Segurança perfeita! Mensagens alarmantes com links urgentes costumam ser golpes digitais. 🛡️',
      'dica': 'Cuidado! Clicar em links desconhecidos pode roubar seus dados e senhas do celular. Repense! 📱',
      'respCorreta': 'B',
    },
    {
      'situacao': 'O médico receitou um remédio para tomar a cada 8 horas. Se a primeira dose foi às 08:00, qual o horário da próxima?',
      'opA': 'A próxima dose deve ser tomada às 16:00 (quatro da tarde).',
      'opB': 'A próxima dose deve ser tomada às 20:00 (oito da noite).',
      'sucesso': 'Perfeito! Somar 8 horas ao horário das 08:00 resulta exatamente em 16:00. Organização é saúde! 💊',
      'dica': 'Conta quase certa! Se passaram 12 horas das 08:00 até as 20:00. Tente somar apenas 8 horas. 🕒',
      'respCorreta': 'A',
    },
  ];

  void _escolherOpcao(String escolha) {
    final atual = _cenarios[_desafioAtual];
    setState(() {
      if (escolha == atual['respCorreta']) {
        _resultadoFeedback = _desafioAtual < 2 ? atual['sucesso'] : 'Incrível! Você concluiu todos os desafios de autonomia! 🏆';
        _acertou = true;
        ControladorAudio.tocarAcerto();
      } else {
        _resultadoFeedback = atual['dica'];
        _acertou = false;
        ControladorAudio.tocarDica();
      }
    });
  }

  void _proximoCenario() {
    setState(() {
      _desafioAtual++;
      _acertou = false;
      _resultadoFeedback = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final atual = _cenarios[_desafioAtual];
    return Scaffold(
      backgroundColor: const Color(0xFF1A237E),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.white, size: 30)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Semantics(
                label: 'Situação: ${atual['situacao']}',
                child: Text(atual['situacao'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              const SizedBox(height: 40),
              if (!_acertou) ...[
                _criarBotaoOpcao(atual['opA'], 'Opção A: ${atual['opA']}', () => _escolherOpcao('A')),
                const SizedBox(height: 15),
                _criarBotaoOpcao(atual['opB'], 'Opção B: ${atual['opB']}', () => _escolherOpcao('B')),
              ],
              if (_resultadoFeedback.isNotEmpty) ...[
                const SizedBox(height: 30),
                Semantics(
                  liveRegion: true,
                  label: 'Análise: $_resultadoFeedback',
                  child: Text(_resultadoFeedback, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, color: Colors.amberAccent, fontWeight: FontWeight.bold)),
                ),
              ],
              if (_acertou && _desafioAtual < 2) ...[
                const SizedBox(height: 30),
                SizedBox(
                  width: 250, height: 65,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    onPressed: _proximoCenario,
                    child: const Text('AVANÇAR', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                ),
              ]
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
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white24, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          onPressed: aoClicar,
          child: Text(texto, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
