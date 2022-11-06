import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String _value;
  final Function _funct;
  final int _flexvalue;
  final Color _bgcolor;
  CustomButton(this._value, this._funct, this._flexvalue, this._bgcolor);
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: _flexvalue,
      child: Container(
          padding: EdgeInsets.all(0.5),
          child: InkWell(
            child: Container(
              alignment: Alignment.center,
              color: this._bgcolor,
              child: Text(
                this._value,
                style: TextStyle(color: Colors.black, fontSize: 28),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () => this._funct(),
          )
      ),
    );
  }
}