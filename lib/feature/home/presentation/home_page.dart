import 'package:flutter/material.dart';
import 'package:playroom/core/ui/base/build_context.dart';

import '../../../../core/ui/widgets/icons.dart';
import '../../../../core/util/color_generator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const _Appbar(),
          const SizedBox(height: 16),
          const _Today(),
          const SizedBox(height: 16),
          Row(
            children: [
              _Option(
                context.colorScheme.secondaryContainer,
                image: 'assets/images/logo.png',
                text: context.l10n.alphabets,
              ),
              const SizedBox(width: 8),
              _Option(
                context.colorScheme.tertiary.withOpacity(0.5),
                image: 'assets/images/peng_pencil.webp',
                text: context.l10n.numbers,
              ),
              const SizedBox(width: 8),
              _Option(
                const Color(0xFFFF9674),
                image: 'assets/images/bear_bag.webp',
                text: context.l10n.more,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _PuzzleGame(),
          const SizedBox(height: 16),
          ..._moreStories(context),
        ],
      ),
    );
  }

  List<Widget> _moreStories(BuildContext context) => [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              context.l10n.moreStories,
              style: context.textTheme.labelLarge,
            ),
            Text(
              context.l10n.seeAll,
              style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.tertiary,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          color: const Color(0xFFFDE2B9),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mystical Stories',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '"Story About the Happy Lion."',
                        style: context.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          PlayButton(
                            onPressed: () {},
                          ),
                          const SizedBox(width: 12),
                          Icon(
                            Icons.access_time,
                            size: 20,
                            color: context.colorScheme.onSurfaceVariant.withOpacity(0.6),
                          ),
                          Text(
                            '14 min',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.colorScheme.onSurfaceVariant.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/happy_lion.webp',
                  width: 120,
                ),
              ],
            ),
          ),
        ),
      ];
}

class _Appbar extends StatelessWidget {
  const _Appbar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: context.colorScheme.primary,
          child: CircleAvatar(
            radius: 18,
            child: Padding(
              padding: const EdgeInsets.all(2.5),
              child: Image.network(
                'https://avatar.iran.liara.run/public/job/police/female',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Afternoon!',
                style: context.textTheme.bodySmall,
              ),
              Text(
                'Muhammad Shabbir',
                style: context.textTheme.labelMedium,
              ),
            ],
          ),
        ),
        _Ratings(12000, color: context.colorScheme.primary),
      ],
    );
  }
}

class _Ratings extends StatelessWidget {
  final int rating;
  final Color? color;
  final Color? textColor;

  const _Ratings(this.rating, {this.color, this.textColor});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: color ?? context.colorScheme.surface,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          children: [
            const RatingStar(),
            const SizedBox(width: 5),
            Text(
              '$rating',
              style: context
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: textColor ?? Colors.white),
            ),
          ],
        ),
      );
}

class _Today extends StatelessWidget {
  const _Today();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: context.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.todayHabits,
                    style: context.textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant.withOpacity(0.6),
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '"Kindness makes the world a better place."',
                    style: context.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      PlayButton(
                        onPressed: () {},
                      ),
                      const SizedBox(width: 12),
                      _Ratings(100, textColor: context.colorScheme.onSurface),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/sparrow_book.webp',
              width: 120,
            ),
          ],
        ),
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final Color color;
  final String image;
  final String text;

  const _Option(this.color, {required this.image, required this.text});

  @override
  Widget build(BuildContext context) => Expanded(
        child: Card.outlined(
          elevation: 0,
          color: color.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: color,
            ),
          ),
          child: AspectRatio(
            aspectRatio: 104 / 145,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image),
                Text(text, style: context.textTheme.bodyMedium),
              ],
            ),
          ),
        ),
      );
}

class _PuzzleGame extends StatelessWidget {
  const _PuzzleGame();

  @override
  Widget build(BuildContext context) => Card.outlined(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: context.colorScheme.secondaryContainer,
          ),
        ),
        child: SizedBox(
          height: 100,
          child: Row(
            children: [
              const SizedBox(width: 16),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.l10n.puzzleGame,
                    style: context.textTheme.headlineSmall,
                  ),
                  Text(
                    context.l10n.playMatchPuzzle,
                    style: context.textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant.withOpacity(0.6),
                        ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: -8,
                      child: GridView.count(
                        crossAxisCount: 5,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                        childAspectRatio: 1,
                        children: List.generate(15, _puzzleItem),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            context.colorScheme.surface,
                            context.colorScheme.surface.withOpacity(0),
                          ],
                          end: Alignment.centerLeft,
                          begin: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _puzzleItem(int index) {
    final Color color;
    if (index.isOdd) {
      color = Colors.white;
    } else {
      color = ColorGenerator.getRandomColor(alpha: 100);
    }
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  final Color? color;
  final VoidCallback onPressed;

  const PlayButton({super.key, this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) => FilledButton.tonal(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: context.colorScheme.surface,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          minimumSize: const Size(80, 32),
          maximumSize: const Size(80, 32),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(context.l10n.play),
            const SizedBox(width: 8),
            PlayIcon(
              color: context.colorScheme.primary,
            ),
          ],
        ),
      );
}
