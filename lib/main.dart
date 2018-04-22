import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationcontroller;

  @override
  void initState() {
    super.initState();
    animationcontroller = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);

    animation = Tween(begin: 0.0, end: 1000.0).animate(animationcontroller);
    animation.addStatusListener((status){
        if(status == AnimationStatus.completed){
          animationcontroller.reverse();
        }else if(status == AnimationStatus.dismissed){
          animationcontroller.forward();
        }
    });

    animationcontroller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return LogonAnimation(
      animation: animation,
    );
  }

  @override
  void dispose() {
    animationcontroller.dispose();
    super.dispose();
  }
}

class LogonAnimation extends AnimatedWidget {
  LogonAnimation({Key key, Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
