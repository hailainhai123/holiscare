import 'package:flutter/material.dart';

class TouchableOpacity extends StatefulWidget {
  final Widget child;
  final Function onTap;
  final Duration duration = const Duration(milliseconds: 50);
  final double opacity = 0.5;
  final bool? disabled;

  const TouchableOpacity(
      {Key? key, required this.child, required this.onTap, this.disabled})
      : super(key: key);

  @override
  _TouchableOpacityState createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  bool isDown = false;

  @override
  void initState() {
    super.initState();
    setState(() => isDown = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isDown = true),
      onTapUp: (_) => setState(() => isDown = false),
      onTapCancel: () => setState(() => isDown = false),
      onTap: () => WidgetsBinding.instance.addPostFrameCallback((_) {
        // ignore: unnecessary_statements
        widget.disabled == true ? () {} : widget.onTap();
      }),
      child: widget.disabled == true
          ? widget.child
          : AnimatedOpacity(
              child: widget.child,
              duration: widget.duration,
              opacity: isDown ? widget.opacity : 1,
            ),
    );
  }
}
