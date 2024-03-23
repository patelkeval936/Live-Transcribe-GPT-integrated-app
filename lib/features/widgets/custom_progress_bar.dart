import 'package:flutter/material.dart';

class CustomProgressBar extends StatefulWidget {
  CustomProgressBar({super.key});

  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  final GlobalKey key = GlobalKey();

  final height = 20.0;

  final percentage = 40;

  double width = 0;
  final animationDuration = 1000;
  int value = 9;
  final label = 'Trust';

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        width = key.currentContext?.size?.width ?? 0;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('width is $width');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0, bottom: 10),
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height),
              boxShadow: const [
                BoxShadow(
                color : Color.fromRGBO(77,121,130,1),
                  spreadRadius: 4,
                  blurRadius: 8,
                )
              ]
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: height + 4,
                  key: key,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(9, 28, 86, 1),
                      Color.fromRGBO(54, 95, 154, 1),
                      Color.fromRGBO(90, 161, 231, 1),
                    ]),
                    borderRadius: BorderRadius.circular(height),
                  ),
                ),
                Container(
                  height: height,
                  width: width <= 0 ? 0 : width - 2,
                  decoration: BoxDecoration(
                    color: Color(0xff010314),
                    borderRadius: BorderRadius.circular(height),
                  ),
                ),
                AnimatedContainer(
                  height: 20,
                  width: width * percentage / 100,
                  duration: Duration(milliseconds: animationDuration),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(9, 28, 86, 1),
                      Color.fromRGBO(54, 95, 154, 1),
                      Color.fromRGBO(90, 161, 231, 1),
                    ]),
                    borderRadius: BorderRadius.circular(height),
                  ),
                ),
                AnimatedPositioned(
                  left: width * percentage / 100 - 20,
                  duration: Duration(milliseconds: animationDuration),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: const Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                AnimatedPositioned(
                  left: (width * percentage / 100 - 20) / 2,
                  duration: Duration(milliseconds: animationDuration),
                  child: Center(
                    child: Text(
                      value.toString(),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
