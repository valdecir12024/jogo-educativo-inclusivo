import 'package:flutter/material.dart';
import 'screens/tela_inicial.dart';
import 'services/gerenciador_acessibilidade.dart';

void main() {
  runApp(const JogoInclusivoApp());
}

class JogoInclusivoApp extends StatelessWidget {
  const JogoInclusivoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // O ValueListenableBuilder reconstrói o visual do app quando o contraste muda
    return ValueListenableBuilder<bool>(
      valueListenable: GerenciadorAcessibilidade.altoContraste,
      builder: (context, altoContrasteAtivo, child) {
        return MaterialApp(
          title: 'Jogo Educativo Inclusivo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            // Se o alto contraste estiver ativo, força o tema escuro/monocromático
            brightness: altoContrasteAtivo ? Brightness.dark : Brightness.light,
          ),
          home: const TelaInicial(),
        );
      },
    );
  }
}
