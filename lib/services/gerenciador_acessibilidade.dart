import 'package:flutter/material.dart';

class GerenciadorAcessibilidade {
  // Interruptores globais que avisam o app inteiro quando mudam
  static final ValueNotifier<bool> altoContraste = ValueNotifier<bool>(false);
  static final ValueNotifier<bool> somAtivado = ValueNotifier<bool>(true);

  // Cores dinâmicas baseadas no contraste selecionado
  static Color obterCorFundo() => altoContraste.value ? Colors.black : const Color(0xFF1A237E);
  static Color obterCorTexto() => altoContraste.value ? Colors.white : Colors.white;
  static Color obterCorBotao() => altoContraste.value ? Colors.white : const Color(0xFFFFD54F);
  static Color obterCorTextoBotao() => Colors.black;
}
