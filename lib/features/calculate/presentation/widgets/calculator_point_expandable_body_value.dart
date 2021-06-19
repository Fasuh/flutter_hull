import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
import 'package:flutter_otoczka/core/style/text_styles.dart';
import 'package:flutter_otoczka/features/calculate/presentation/input_formatters/double_text_input_formatter.dart';

typedef OnPointValueChanged = Function(double value);

class CalculatorPointExpandableBodyValue extends StatefulWidget {
  const CalculatorPointExpandableBodyValue({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final double value;

  final OnPointValueChanged onChanged;

  @override
  _CalculatorPointExpandableBodyValueState createState() => _CalculatorPointExpandableBodyValueState();
}

class _CalculatorPointExpandableBodyValueState extends State<CalculatorPointExpandableBodyValue> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController.fromValue(
      TextEditingValue(
        text: widget.value.toStringAsFixed(1),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: NeumorphicText(
            widget.label,
            style: NeumorphicStyle(
              depth: 1.5,
              intensity: 200,
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Expanded(
          child: Neumorphic(
            style: NeumorphicStyle(
              depth: -5,
            ),
            child: TextField(
              onChanged: (value) {
                widget.onChanged(double.tryParse(value) ?? 0.0);
              },
              inputFormatters: [
                DoubleTextInputFormatter(),
              ],
              controller: textEditingController,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
              style: roboto.s26.bold,
            ),
          ),
        )
      ],
    );
  }
}
