import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text('Dice App'),
          backgroundColor: Colors.teal,
        ),
        body: DiceApp(),
      ),
    );
  }
}


// We need stateful widget for dice app because we are continuously 
//changing the image state.

class DiceApp extends StatefulWidget {
  const DiceApp({super.key});

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {

  int leftDiceNumber = 1;
  int rightDiceNumber = 3;

  void randomDiceFunc() {
    // using state to change the dice images.
    setState(() => {
      /*
        Note -: we have used the, maximum limit = 6 as we have total, 6 dice's,
        We are using Math random for selecting any random numbers that we want.
        But it will only range in between 0 to 5, because we have total 6 numbers.
        That is 0 to 5 , so we add +1. So 0 + 1 = 1, 5 + 1 = 6, so that our app 
        doesnot get crash.
      */
      leftDiceNumber = Random().nextInt(6) + 1,
      rightDiceNumber = Random().nextInt(6) + 1,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: randomDiceFunc,
              child: Image.asset('assets/images/dice${leftDiceNumber}.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: randomDiceFunc,
              child: Image.asset('assets/images/dice${rightDiceNumber}.png')
            ),
          ),
        ],
      ),
    );
  }
}
