import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String _value;
  final Function _funct;
  final int _flexvalue;
  final Color _bgcolor;
  const CustomButton(this._value, this._funct, this._flexvalue, this._bgcolor, {super.key});
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: _flexvalue,
      child: Container(
          padding: const EdgeInsets.all(0.5),
          child: InkWell(
            child: Container(
              alignment: Alignment.center,
              color: _bgcolor,
              child: Text(
                _value,
                style: const TextStyle(color: Colors.black, fontSize: 28),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () => _funct(),
          )
      ),
    );
  }
}