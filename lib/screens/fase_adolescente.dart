import 'package:flutter/material.dart';
import '../services/controlador_audio.dart';

class FaseAdolescenteTela extends StatefulWidget {
  const FaseAdolescenteTela({super.key});

  @override
  State<FaseAdolescenteTela> createState() => _FaseAdolescenteTelaState();
}

class _FaseAdolescenteTelaState extends State<FaseAdolescenteTela> {
  int _desafioAtual = 0;
  bool _acertou = false;
  String _resultadoFeedback = '';

  final List<Map<String, dynamic>> _dilemas = [
    {
      'narrativa': 'Você recebeu a mesada do mês. O que decide fazer para ajudar o meio ambiente e economizar?',
      'opA': 'Comprar uma lâmpada LED para o quarto.',
      'opB': 'Comprar um pacote de copos descartáveis.',
      'sucesso': 'Boa escolha! Lâmpadas LED economizam energia a longo prazo e ajudam o planeta. 💡',
      'dica': 'Pense bem! Copos descartáveis geram muito lixo plástico. Que tal repensar? ♻️',
      'respCorreta': 'A',
    },
    {
      'narrativa': 'Você vê um colega de classe sofrendo exclusão no recreio por causa de sua cadeira de rodas. Qual sua atitude?',
      'opA': 'Ignorar e continuar conversando com outros amigos.',
      'opB': 'Ir até ele, puxar assunto e convidá-lo para o grupo.',
      'sucesso': 'Incrível! A inclusão começa com empatia e pequenas atitudes no dia a dia. 🤝',
      'dica': 'Lembre-se: a indiferença machuca. Como você gostaria de ser tratado se estivesse no lugar dele? ❤️',
      'respCorreta': 'B',
    },
    {
      'narrativa': 'Você encontrou um celular esquecido em um banco da escola. O que faz com ele?',
      'opA': 'Leva até a diretoria ou seção de achados e perdidos.',
      'opB': 'Guarda na mochila para ver se alguém aparece procurando.',
      'sucesso': 'Perfeito! Ser honesto e devolver o objeto ajuda a construir uma comunidade confiável. 📱',
      'dica': 'Guardar algo que não é seu pode causar desespero em quem perdeu. Que tal fazer o certo? 🏢',
      'respCorreta': 'A',
    },
  ];

  void _escolherOpcao(String escolha) {
    final atual = _dilemas[_desafioAtual];
    setState(() {
      if (escolha == atual['respCorreta']) {
        _resultadoFeedback = _desafioAtual < 2 ? atual['sucesso'] : 'Espetacular! Você tomou ótimas decisões cidadãs! 🏆';
        _acertou = true;
        ControladorAudio.tocarAcerto();
      } else {
        _resultadoFeedback = atual['dica'];
        _acertou = false;
        ControladorAudio.tocarDica();
      }
    });
  }

  void _proximoDilema() {
    setState(() {
      _desafioAtual++;
      _acertou = false;
      _resultadoFeedback = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final atual = _dilemas[_desafioAtual];
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
                label: 'Situação: ${atual['narrativa']}',
                child: Text(atual['narrativa'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
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
                    onPressed: _proximoDilema,
                    child: const Text('AVANÇAR', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
              if (_acertou && _desafioAtual == 2) ...[
                const SizedBox(height: 30),
                SizedBox(
                  width: 250, height: 65,
                  child: Semantics(
                    button: true,
                    label: 'Desafios concluídos! Botão Voltar ao Menu Principal.',
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                      child: const Text('VOLTAR AO MENU', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
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
