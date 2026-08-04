import 'package:audioplayers/audioplayers.dart';

class ControladorAudio {
  // Cria o player de áudio nativo do Flutter
  static final AudioPlayer _player = AudioPlayer();

  // Função para tocar o som de acerto
  static Future<void> tocarAcerto() async {
    await _player.stop(); // Para qualquer som que esteja tocando antes
    await _player.play(AssetSource('audio/acerto.mp3'));
  }

  // Função para tocar o som de erro/dica
  static Future<void> tocarDica() async {
    await _player.stop();
    await _player.play(AssetSource('audio/dica.mp3'));
  }
}
