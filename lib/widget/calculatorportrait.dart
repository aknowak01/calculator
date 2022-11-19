import 'package:calculator/widget/custombutton.dart';
import 'package:flutter/material.dart';
import 'evaluate.dart';

class CalculatePortrait extends StatefulWidget {
  final String str;
  final String ttile;

  const CalculatePortrait({super.key, required this.ttile, required this.str});
  @override
  _CalculatePortraitState createState() => _CalculatePortraitState(str);

}
class _CalculatePortraitState extends State<CalculatePortrait> {
  String _str;
  _CalculatePortraitState(this._str);

  void _update(String val){
    Evaluate.add(val);
    setState(() {
      _str = Evaluate.str;
    });
  }

  void _clear(){
    Evaluate.clear();
    setState(() {
      _str = Evaluate.str;
    });
  }

  void _delete(){
    Evaluate.delete();
    setState(() {
      _str = Evaluate.str;
    });
  }
  void compute(){
    if(Evaluate.str.compareTo('0') != 0){
      setState(() {
        _str = Evaluate().equalPressed();
        Evaluate.str = _str;
      });
    }
  }
  @override
  void initState(){
    super.initState();
    setState(() {
      _str = Evaluate.str;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(widget.ttile),
    ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
           child: Container(
             alignment: Alignment.bottomRight,
             child: Padding(
               padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
               child: Text(
                   _str,
                 textScaleFactor: 3.0,
                 style: const TextStyle(fontSize: 20),
                 textAlign: TextAlign.right,
               ),
             ),
           ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomButton('C', (){_delete();}, 6, Colors.grey),
                CustomButton('AC', (){_clear();}, 3, Colors.grey),
                CustomButton('/', (){_update('/');}, 3, Colors.grey),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomButton('7', (){_update('7');}, 3, Colors.grey),
                CustomButton('8', (){_update('8');}, 3, Colors.grey),
                CustomButton('9', (){_update('9');}, 3, Colors.grey),
                CustomButton('*', (){_update('*');}, 3, Colors.grey),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomButton('4', (){_update('4');}, 3, Colors.grey),
                CustomButton('5', (){_update('5');}, 3, Colors.grey),
                CustomButton('6', (){_update('6');}, 3, Colors.grey),
                CustomButton('-', (){_update('-');}, 3, Colors.grey),
              ],
            ),
          ), Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomButton('1', (){_update('1');}, 3, Colors.grey),
                CustomButton('2', (){_update('2');}, 3, Colors.grey),
                CustomButton('3', (){_update('3');}, 3, Colors.grey),
                CustomButton('+', (){_update('+');}, 3, Colors.grey),
              ],
            ),
          ), Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomButton('0', (){_update('0');}, 6, Colors.grey),
                CustomButton('.', (){_update('.');}, 3, Colors.grey),
                CustomButton('=', (){compute();}, 3, Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}