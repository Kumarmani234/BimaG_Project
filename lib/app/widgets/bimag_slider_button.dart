import 'package:flutter/material.dart';

class CustomSliderButton extends StatefulWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color iconColor;
  final Widget sliderButtonContent;
  final child;
  final VoidCallback onConfirmation;
  final Gradient? gradient;
  final BorderRadius? borderRadius;

  const CustomSliderButton({
    Key? key,
    this.height = 70,
    this.width = 300,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.blueAccent,
    this.iconColor = Colors.white,
    this.sliderButtonContent = const Icon(
      Icons.chevron_right,
      color: Colors.white,
      size: 35,
    ),
    this.child,
    required this.onConfirmation,
    this.gradient,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<CustomSliderButton> createState() => CustomSliderButtonState();
}

class CustomSliderButtonState extends State<CustomSliderButton> {
  double position = 0;

  void updatePosition(DragUpdateDetails details) {
    setState(() {
      position = details.localPosition.dx - (widget.height / 2);
    });
  }

  void sliderReleased(DragEndDetails details) {
    if (position > widget.width - widget.height) {
      widget.onConfirmation();
    }
    setState(() {
      position = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: updatePosition,
      onPanEnd: sliderReleased,
      child: Container(
        height: widget.height,
        width: widget.width,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          gradient: widget.gradient,
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: widget.child,
            ),
            Positioned(
              left: widget.height / 2,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 0),
                curve: Curves.ease,
                height: widget.height - 10,
                width: position.clamp(0, widget.width - widget.height),
                decoration: BoxDecoration(
                  borderRadius: widget.borderRadius,
                  color: widget.backgroundColor,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 0),
              curve: Curves.bounceOut,
              left: position.clamp(0, widget.width - widget.height),
              top: 0,
              child: Container(
                height: widget.height - 10,
                width: widget.height - 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.height / 2),
                  color: widget.foregroundColor,
                ),
                child: widget.sliderButtonContent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
