import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'task';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: Scaffold(
        body: Center(
          child: Homepage(),
        ),
      ),
    );
  }
}


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _Homepage();
}
class _Homepage extends State<Homepage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(lowerBound: 0,upperBound: 100,
    duration: const Duration(seconds: 1),
    vsync: this,
  )
    ..forward()..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,

      builder: (BuildContext context, Widget? child) {
        return Container(
          margin: EdgeInsets.only(top:_controller.value),
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green,),


        );
      },
    );
  }
}
