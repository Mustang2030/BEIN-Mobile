import 'package:bein_mobile/misc/colors.dart';
import 'package:flutter/material.dart';

// Texts that can redirect you
class NavButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String what;
  const NavButton({
    super.key,
    required this.onPressed,
    required this.what,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        what,
        style: const TextStyle(color: ListColors.lowVis, fontSize: 16),
      ),
    );
  }
}

//SubmitButton for things like login and registering
class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String na;
  const SubmitButton({super.key, required this.onPressed, required this.na});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ListColors.mainColor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          na,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

//Button for filtering options
class FillButton extends StatelessWidget {
  final String sect;
  final VoidCallback onPressed;
  const FillButton({
    super.key,
    required this.sect,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        width: 150,
        height: 48,
        child: FloatingActionButton(
          backgroundColor: ListColors.mainColor,
          onPressed: onPressed,
          child: Text(
            sect,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
