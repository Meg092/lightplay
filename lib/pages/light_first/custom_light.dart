import 'dart:async';
import 'package:flutter/material.dart';

class CustomLight extends StatefulWidget {
  @override
  _CustomLightState createState() => _CustomLightState();

  CustomLight(
      {required this.duration,
        this.delay = 100,
        required this.child,
        required this.color});

  final int duration;
  final int delay;
  final Widget child;
  final Color color;
}

class _CustomLightState extends State<CustomLight> {
  bool _show = true;
  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    _timer = null;
    _timer = Timer.periodic(Duration(milliseconds: widget.duration), (timer) {
      setState(() => _show = !_show);
      Future.delayed(Duration(milliseconds: widget.delay), () {
        if (mounted) setState(() => _show = true);
      });
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    startTimer();
    return AnimatedContainer(
        duration: Duration(milliseconds: widget.delay),
        color: _show ? widget.color : Colors.transparent,
        child: widget.child);
  }
}
