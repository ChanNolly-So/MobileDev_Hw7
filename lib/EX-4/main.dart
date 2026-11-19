import 'package:flutter/material.dart';

void main () {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.lightGreen,
      body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardScore(title: "Flutter"),
              CardScore(title: "Dart"),
              CardScore(title: "React"),
            ],
          ),
    ),

  )) );
}
class CardScore extends StatefulWidget {
  final String title;

  const CardScore({super.key, required this.title});

  @override
  State<CardScore> createState() => _CardScoreState();
}

class _CardScoreState extends State<CardScore> {
  int score = 0;

  void increase () {
    setState(() {
      if (score < 10) {
        score++; 
      }
    });
  }

  void decrease () {
    setState(() {
      if (score > 0) {
        score--;
      }
    });
  }

Color? color () {
  if (score>=8) {
    return Colors.green[800];
  } else if (score >= 5) {
    return Colors.green[600];
  } else {
    return Colors.green[300];
  }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child: Column(
      
        children: [
          Text('My score in ${widget.title}',
          style: TextStyle(
            color: Colors.grey
          ),),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: decrease, 
                icon: Icon(Icons.remove)),
              
              IconButton(
                onPressed: increase, 
                icon: Icon(Icons.add)),
            ],
          ),

          Stack(
            children: [
              Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: score * 30,
                height: 40,
                decoration: BoxDecoration(
                  color: color(),
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ],
          )
          
        ],
      ),
    );
  }
}