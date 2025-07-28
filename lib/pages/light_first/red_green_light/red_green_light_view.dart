import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'red_green_light_logic.dart';

enum LightState { red, yellow, green }

class RedGreenLightPage extends GetView<RedGreenLightLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text(
            'Traffic lights',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          )),
      body: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: TrafficLightScreen(),
      ),
    );
  }
}

class TrafficLightScreen extends StatefulWidget {
  const TrafficLightScreen({super.key});

  @override
  State<TrafficLightScreen> createState() => _TrafficLightScreenState();
}

class _TrafficLightScreenState extends State<TrafficLightScreen> {
  LightState _currentState = LightState.red;

  Timer? _timer;

  final Map<LightState, int> _durations = {
    LightState.red: 60,
    LightState.green: 60,
    LightState.yellow: 3,
  };

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer(
      Duration(seconds: _durations[_currentState]!),
      _switchLight,
    );
  }

  void _switchLight() {
    setState(() {
      switch (_currentState) {
        case LightState.red:
          _currentState = LightState.green;
          break;
        case LightState.green:
          _currentState = LightState.yellow;
          break;
        case LightState.yellow:
          _currentState = LightState.red;
          break;
      }
    });

    _timer?.cancel();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildLight(
              active: _currentState == LightState.red, color: const Color(0xffff0000)),
          _buildLight(
              active: _currentState == LightState.yellow,
              color: const Color(0xffffc400)),
          _buildLight(
              active: _currentState == LightState.green,
              color: const Color(0xff00ff4e)),
        ],
      ),
    );
  }

  Widget _buildLight({required bool active, required Color color}) {
    return Expanded(
        child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: active ? color : Colors.grey[800],
      ),
    ));
  }
}
