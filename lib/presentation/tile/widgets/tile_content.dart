import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_puzzle_hack/models/tile.dart';
import 'package:flutter_puzzle_hack/presentation/providers/puzzle_provider.dart';
import 'package:flutter_puzzle_hack/presentation/styles/app_text_styles.dart';
import 'package:flutter_puzzle_hack/presentation/tile/widgets/tile_rive_animation.dart';
import 'package:provider/provider.dart';

class TileContent extends StatelessWidget {
  final Tile tile;
  final bool isPuzzleSolved;

  const TileContent({
    Key? key,
    required this.tile,
    required this.isPuzzleSolved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAtCorrectLocation = tile.currentLocation == tile.correctLocation;

    return Selector<PuzzleProvider, int>(
      selector: (c, PuzzleProvider puzzleProvider) => puzzleProvider.activeTileValue,
      builder: (c, int activeTileValue, child) {
        return AnimatedScale(
          scale: activeTileValue == tile.value && kIsWeb ? 1.05 : 1,
          duration: const Duration(milliseconds: 200),
          child: child,
        );
      },
      child: Selector<PuzzleProvider, int>(
        selector: (c, PuzzleProvider puzzleProvider) => puzzleProvider.n,
        builder: (c, puzzleSize, _) {
          // print('Built tile ${tile.value}');
          return Padding(
            padding: EdgeInsets.all(puzzleSize > 5
                ? 2
                : puzzleSize > 3
                    ? 5
                    : 8),
            child: Stack(
              children: [
                TileRiveAnimation(
                  isAtCorrectLocation: isAtCorrectLocation,
                  isPuzzleSolved: isPuzzleSolved,
                  tile: tile,
                ),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      '${tile.value}',
                      style: AppTextStyles.tile.copyWith(
                          fontSize: puzzleSize > 5
                              ? 20
                              : puzzleSize > 4
                                  ? 25
                                  : puzzleSize > 3
                                      ? 30
                                      : null),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
