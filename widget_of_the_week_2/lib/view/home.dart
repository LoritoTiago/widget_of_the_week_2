import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:widget_of_the_week_2/view/widget/button.dart';
import 'package:widget_of_the_week_2/view/widget/text.dart';

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
    Future.delayed(const Duration(seconds: 5), () {
      isFinish = true;
      setState(() {});
    });
    _lottie!.addListener(() {
      if (_lottie!.value > 0.9) {
        _lottie!.stop();
        isFinish = true;
        setState(() {});
        Future.delayed(const Duration(milliseconds: 500), () {
          shoWText = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _lottie!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              color: const Color(0xff4D7321),
              width: w,
              height: h / 2.6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    const TextView(
                      bold: true,
                      size: 30.0,
                      text: "We bring your product to you",
                    ),
                    const SizedBox(height: 20),
                    const TextView(
                      bold: false,
                      size: 20.0,
                      text:
                          "Lorito Deliveries is a non-real world company used for testing.",
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Button(
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.white,
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: AnimatedContainer(
              height: isFinish ? h / 1.5 : h,
              width: w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(isFinish ? 20 : 0),
                  bottomRight: Radius.circular(isFinish ? 20 : 0),
                ),
              ),
              duration: const Duration(seconds: 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Visibility(
                    visible: isFinish,
                    child: LottieBuilder.asset(
                      "assets/animation/food.json",
                      controller: _lottie,
                      onLoaded: (lot) {
                        _lottie!
                          ..duration = lot.duration
                          ..forward();
                      },
                    ),
                  ),
                  Visibility(
                    visible: !isFinish,
                    child: LottieBuilder.asset(
                      "assets/animation/food.json",
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: AnimatedOpacity(
                      duration: const Duration(seconds: 1),
                      opacity: shoWText ? 1 : 0,
                      child: const Text(
                        "Delivery",
                        style: TextStyle(
                          color: Color(
                            0xff4D7321,
                          ),
                          fontSize: 40,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
