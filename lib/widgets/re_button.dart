import 'package:flutter/material.dart';

class ReButton extends StatelessWidget {
  const ReButton({super.key, required this.text, this.onPressed, this.backgroundColor, this.foregroundColor});

  final String text;

  final Color? backgroundColor;

  final Color? foregroundColor;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        fixedSize: const Size(120.0, 40.0),
        textStyle: const TextStyle(fontWeight: FontWeight.w400),
      ),
      child: Text(text),
    );
  }
}

class ElevatedIconButton extends StatelessWidget {
  const ElevatedIconButton({super.key, required this.icons, required this.text, this.onPressed});

  final IconData icons;

  final String text;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20.0),
          minimumSize: const Size(double.maxFinite, 0.0),
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
        ),
        icon: Icon(icons),
        label: Text(text),
        onPressed: onPressed,
      ),
    );
  }
}

class RoomDirectButton extends StatelessWidget {
  const RoomDirectButton({super.key, required this.text, this.onPressed});

  final String text;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
