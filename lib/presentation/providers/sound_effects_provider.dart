import 'package:flutter/cupertino.dart';

enum SoundEffectType {
  tileMove,
  tileCorrectMove,
}

class SoundEffectsProvider with ChangeNotifier {
  bool muted = false;

  void setMuted(bool value) {
    muted = value;
    notifyListeners();
  }

  static const Map<SoundEffectType, String> assets = {
    SoundEffectType.tileMove: 'assets/sound-effects/tile-move.mp3',
    SoundEffectType.tileCorrectMove: 'assets/sound-effects/tile-correct-move.mp3',
  };
}