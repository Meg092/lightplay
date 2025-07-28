import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:light_play/main.dart';

import 'multicolored_lights_logic.dart';

class MulticoloredLightsPage extends GetView<MulticoloredLightsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text(
            'More lights',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          )),
      body: PageViewWithIndicator(
        pages: colorList
            .map((e) => Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: e,
                ))
            .toList(),
        activeDotColor: Colors.white,
        inactiveDotColor: Colors.white.withOpacity(0.21),
        dotSize: 16.0,
        spacing: 9.0,
        autoPlayInterval: const Duration(seconds: 3),
      ),
    );
  }
}

class PageViewWithIndicator extends StatefulWidget {
  final List<Widget> pages;
  final Color activeDotColor;
  final Color inactiveDotColor;
  final double dotSize;
  final double spacing;
  final Duration autoPlayInterval;

  const PageViewWithIndicator({
    super.key,
    required this.pages,
    this.activeDotColor = Colors.blue,
    this.inactiveDotColor = Colors.grey,
    this.dotSize = 8.0,
    this.spacing = 8.0,
    this.autoPlayInterval = const Duration(seconds: 3),
  });

  @override
  State<PageViewWithIndicator> createState() => _PageViewWithIndicatorState();
}

class _PageViewWithIndicatorState extends State<PageViewWithIndicator> {
  late PageController _pageController;
  late int _currentPage;
  Timer? _autoPlayTimer;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _pageController = PageController();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _stopAutoPlay();
    super.dispose();
  }

  void _startAutoPlay() {
    _autoPlayTimer = Timer.periodic(widget.autoPlayInterval, (timer) {
      if (_currentPage < widget.pages.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _stopAutoPlay() {
    _autoPlayTimer?.cancel();
    _autoPlayTimer = null;
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onPanDown: (_) => _stopAutoPlay(),
          onPanEnd: (_) => _startAutoPlay(),
          child: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: widget.pages,
          ),
        ),

        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.pages.length,
                (index) => _buildDot(index),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDot(int index) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        width: widget.dotSize,
        height: widget.dotSize,
        margin: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == _currentPage
              ? widget.activeDotColor
              : widget.inactiveDotColor,
        ),
      ),
    );
  }
}
