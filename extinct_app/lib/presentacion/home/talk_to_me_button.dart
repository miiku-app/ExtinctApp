import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TalkToMeButton extends StatefulWidget {
  final VoidCallback onTap; // Añadir el parámetro onTap

  const TalkToMeButton(
      {super.key, required this.onTap}); // Asegúrate de marcarlo como requerido

  @override
  State<TalkToMeButton> createState() => _TalkToMeButtonState();
}

class _TalkToMeButtonState extends State<TalkToMeButton>
    with TickerProviderStateMixin {
  late final AnimationController _iconAnimationController;
  late final Animation<Offset> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _iconAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, 8)).animate(
      CurvedAnimation(
          parent: _iconAnimationController, curve: Curves.easeInOut),
    );
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap, // Usa el parámetro onTap aquí
      child: Column(
        children: [
          AnimatedBuilder(
              animation: _iconAnimation,
              builder: (context, iconAnimation) {
                if (_iconAnimationController.isCompleted) {
                  _iconAnimationController.reverse();
                }
                if (_iconAnimationController.isDismissed) {
                  _iconAnimationController.forward();
                }
                return Transform.translate(
                  offset: _iconAnimation.value,
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 48,
                  ),
                );
              }),
          Text(
            'Talk to Me',
            style: GoogleFonts.montserrat(
              textStyle: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
