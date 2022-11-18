import 'package:flutter/material.dart';
import 'evaluate.dart';
import 'calculate.dart';
import 'custombutton.dart';

class CalculateLandscape extends StatefulWidget {
  final String str;
  final String ttile;
  CalculateLandscape({ Key? key, required this.ttile, required this.str});
  @override
  _CalculateLandscapeState createState() => _CalculateLandscapeState(this.str);

}
class _CalculateLandscapeState extends State<CalculateLandscape> {
  String _str;
  _CalculateLandscapeState(this._str);

  void _update(String val){
    evaluate.add(val);
    setState(() {
      this._str = evaluate.str;
    });
  }

  void _clear(){
    evaluate.clear();
    setState(() {
      this._str = evaluate.str;
    });
  }

  void _delete(){
    evaluate.delete();
    setState(() {
      this._str = evaluate.str;
    });
  }
  void compute(){
    if(evaluate.str.compareTo('0') != 0){
      setState(() {
        this._str = evaluate().equalPressed();
        evaluate.str = this._str;
      });
    }
  }
  @override
  void initState(){
    super.initState();
    setState(() {
      this._str = evaluate.str;
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
            flex: 3,
            child: Container(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 30),
                child: Text(
                  _str,
                  textScaleFactor: 3.0,
                  style: TextStyle(fontSize: 20),
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
                CustomButton('C', (){_delete();}, 3, Colors.grey),
                CustomButton('AC', (){_clear();}, 3, Colors.grey),
                CustomButton('/', (){_update('/');}, 3, Colors.grey),
                CustomButton('x^2', (){_update('^2');}, 3, Colors.grey),
                CustomButton('x^3', (){_update('^3');}, 3, Colors.grey),
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
                CustomButton('10^x', (){_update('10^');}, 3, Colors.grey),
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
                CustomButton('ln', (){_update('ln');}, 3, Colors.grey),
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
                CustomButton('Pi', (){_update('3,14');}, 3, Colors.grey),
              ],
            ),
          ), Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomButton('0', (){_update('0');}, 3, Colors.grey),
                CustomButton('.', (){_update('.');}, 3, Colors.grey),
                CustomButton('=', (){compute();}, 3, Colors.grey),
                CustomButton('%', (){_update('%');}, 3, Colors.grey),
                CustomButton('!', (){_update('!');}, 3, Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }

}