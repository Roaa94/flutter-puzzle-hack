import 'package:Dashtronaut/presentation/providers/sound_effects_provider.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class TileSoundEffectHandler extends StatefulWidget {
  const TileSoundEffectHandler({Key? key}) : super(key: key);

  @override
  _TileSoundEffectHandlerState createState() => _TileSoundEffectHandlerState();
}

class _TileSoundEffectHandlerState extends State<TileSoundEffectHandler> {
  AudioPlayer? _audioPlayer;

  @override
  void initState() {
    _audioPlayer = AudioPlayer()..setAsset(SoundEffectsProvider.assets[SoundEffectType.tileMove]!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
