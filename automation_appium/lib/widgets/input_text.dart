import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final IconData icon;
  final Color iconColor;
  final String hintText;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final FocusNode focusNode;
  const InputText({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.icon,
    required this.hintText,
    required this.onFieldSubmitted,
    required this.onSaved,
    required this.iconColor,
    required this.focusNode,
  });

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  final FocusNode _focusNode = FocusNode();
  Color focusBorderColor = Colors.grey.shade400;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 400),
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: focusBorderColor, width: 1.0),
              borderRadius: BorderRadius.circular(10.0)),
          child: TextFormField(
            key: widget.key,
            style: const TextStyle(fontFamily: 'Exo2'),
            obscureText: widget.obscureText,
            controller: widget.controller,
            onSaved: widget.onSaved,
            onFieldSubmitted: widget.onFieldSubmitted,
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  widget.icon,
                  color: widget.iconColor,
                  size: 22,
                ),
                hintText: widget.hintText),
          ),
        ))
      ],
    );
  }
}
