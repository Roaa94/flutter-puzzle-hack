import 'package:flutter/material.dart';
import 'package:flutter_puzzle_hack/presentation/providers/puzzle_provider.dart';
import 'package:flutter_puzzle_hack/presentation/styles/app_colors.dart';
import 'package:flutter_puzzle_hack/presentation/styles/app_text_styles.dart';
import 'package:provider/provider.dart';

class PuzzleSizeItem extends StatelessWidget {
  final int size;

  const PuzzleSizeItem({required this.size, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Consumer<PuzzleProvider>(
          builder: (c, puzzleProvider, _) {
            bool _isSelected = puzzleProvider.n == size;
            return ElevatedButton(
              onPressed: () {
                if (!_isSelected) {
                  puzzleProvider.resetPuzzleSize(size);
                  if (Scaffold.of(context).hasDrawer && Scaffold.of(context).isDrawerOpen) {
                    Navigator.of(context).pop();
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(width: 1, color: Colors.white),
                ),
                minimumSize: const Size.fromHeight(50),
                primary: _isSelected ? Colors.white : null,
              ),
              child: Text(
                '$size x $size',
                style: AppTextStyles.buttonSm.copyWith(color: _isSelected ? AppColors.primary : Colors.white),
              ),
            );
          },
        ),
        const SizedBox(height: 5),
        Text('${(size * size) - 1} Tiles', style: AppTextStyles.bodyXxs),
      ],
    );
  }
}
