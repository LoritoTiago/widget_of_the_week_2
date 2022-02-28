import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController? _lottie;
  bool isFinish = false, shoWText = false;

  @override
  void initState() {
    super.initState();
    _lottie = AnimationController(vsync: this);
    _lottie!.addListener(() {
      if (_lottie!.value > 0.2) {
        _lottie!.stop();
        setState(() {});
        Future.delayed(const Duration(seconds: 2), () {
          shoWText = true;
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
