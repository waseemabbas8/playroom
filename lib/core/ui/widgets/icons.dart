import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const double _kDefaultSize = 18.0;

class RatingStar extends StatelessWidget {
  const RatingStar({super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.92),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5), // Shadow color with opacity
          spreadRadius: 0.5, // Spread radius
          blurRadius: 0.55, // Blur radius
          offset: const Offset(0, 0), // changes position of shadow (x, y)
        ),
      ],
    ),
    padding: const EdgeInsets.all(3),
    child: SvgPicture.asset(
      width: 10,
      height: 10,
      'assets/icons/ic_star.svg',
      colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
    ),
  );
}

abstract class _Icon extends StatelessWidget {
  final Color? color;
  final Size? size;
  const _Icon({super.key, this.color, this.size});

  ColorFilter? getColorFilter() => color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null;
}

//play icon
class PlayIcon extends _Icon {
  const PlayIcon({super.key, super.color, super.size});

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    width: size?.width ?? _kDefaultSize,
    height: size?.height ?? _kDefaultSize,
    'assets/icons/ic_play.svg',
    colorFilter: getColorFilter(),
  );
}