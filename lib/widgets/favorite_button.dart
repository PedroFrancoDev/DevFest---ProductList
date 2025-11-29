import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteButton extends StatefulWidget {
  final bool isFavorite;
  final double size;
  final ValueChanged<bool>? onChanged;
  final bool favoriteActionEnabled;

  const FavoriteButton({
    super.key,
    this.isFavorite = false,
    this.size = 24,
    this.onChanged,
    this.favoriteActionEnabled = true,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with SingleTickerProviderStateMixin {
  late bool _isFavorite;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      value: _isFavorite ? 1.0 : 0.0,
    );
  }

  void _toggleFavorite() {
    setState(() => _isFavorite = !_isFavorite);
    if (_isFavorite) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    widget.onChanged?.call(_isFavorite);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.favoriteActionEnabled ? _toggleFavorite : null,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final scale = 1 + (_controller.value * 0.2);

          return Transform.scale(
            scale: scale,
            child: SvgPicture.asset(
              _isFavorite ? "assets/heart 2.svg" : "assets/heart.svg",
              width: widget.size,
              height: widget.size,
              colorFilter: ColorFilter.mode(
                _isFavorite ? Colors.redAccent : Colors.white,
                BlendMode.srcIn,
              ),
            ),
          );
        },
      ),
    );
  }
}
