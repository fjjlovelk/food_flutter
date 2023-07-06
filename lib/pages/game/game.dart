import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final StreamController<int> _inputController = StreamController.broadcast();
  final StreamController<int> _scoreController = StreamController.broadcast();
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: StreamBuilder(
          stream: _scoreController.stream,
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              score += snapshot.data as int;
              return Text('得分：$score');
            }
            if (snapshot.hasError) {
              return Text('error：${snapshot.error}');
            }
            return const Text('监听中。。。');
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Stack(
            children: List.generate(
              10,
              (index) => Game(
                controller: _inputController,
                scoreController: _scoreController,
              ),
            ),
          )),
          KeyPad(controller: _inputController)
        ],
      ),
    );
  }
}

class Game extends StatefulWidget {
  final StreamController<int> controller;
  final StreamController<int> scoreController;
  const Game(
      {Key? key, required this.controller, required this.scoreController})
      : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> with SingleTickerProviderStateMixin {
  late int a, b;
  late double x;
  late Color color;
  late AnimationController _animationController;

  void reset() {
    a = Random().nextInt(5) + 1;
    b = Random().nextInt(5);
    x = Random().nextDouble() * 300;
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  @override
  void initState() {
    super.initState();
    reset();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: Random().nextInt(5000) + 2000),
    );
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.scoreController.add(-1);
        reset();
        _animationController.forward(from: 0.0);
      }
    });

    widget.controller.stream.listen((event) {
      if (a + b == event) {
        widget.scoreController.add(3);
        reset();
        _animationController.forward(from: 0.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (ctx, child) {
          return Positioned(
            top: Tween(begin: -40.0, end: 450.0)
                .animate(_animationController)
                .value,
            left: x,
            child: _buildBox(),
          );
        });
  }

  Widget _buildBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(width: 1),
      ),
      child: Text(
        "$a+$b=?",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}

class KeyPad extends StatelessWidget {
  final StreamController<int> controller;
  const KeyPad({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1.5,
      children: List.generate(
        9,
        (index) => TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
            backgroundColor: MaterialStateProperty.all(
              Colors.primaries[index],
            ),
          ),
          onPressed: () {
            controller.add(index + 1);
          },
          child: Text(
            '${index + 1}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
