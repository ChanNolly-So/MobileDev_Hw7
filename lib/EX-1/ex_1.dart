import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
         child: Column(
          children: [
            SelectableButton(),
            SizedBox(height: 10,),
            SelectableButton(),
            SizedBox(height: 10,),
            SelectableButton(),
          ],
         ),
        ),
      ),
    ));

class SelectableButton extends StatefulWidget {
  const new({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected=false;
  String get text {
    if (isSelected) {
      return ('Selected');
    } else {
      return ('Not Selected');
    }
  }
    Color get textColor {
      if (isSelected) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }

    Color? get backgroundColor {
      if (isSelected) {
        return Colors.blue[500];
      } else {
        return Colors.blue[50]; 
      }
    }
  

  void toggle(){
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: toggle,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: Text(text,style: TextStyle(color: textColor),),
      ),
    );
  }
}