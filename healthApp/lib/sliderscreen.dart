import 'dart:async';
import 'package:flutter/material.dart';

class CarouselSlider extends StatefulWidget {
  @override
  _CarouselSliderState createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<String> _images = [
    'assets/images/health1.jfif',
    'assets/images/health2.jfif',
    'assets/images/health3.webp',
    'assets/images/health.jfif',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _controller.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          height: 325 ,
          child: PageView.builder(
            controller: _controller,
            itemCount: _images.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                _images[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      );
  }
}
