import 'package:flutter/material.dart';
import 'package:proj_planos/app/shared/classes/SizeConfig.dart';

class TextoFieldWidget extends StatelessWidget {
  final String text;
  final Color cor;
  final TextInputType keyboardType;
  final String errorText;
  final Function onChanged;
  final bool obscureText;
  final FocusNode focusNode;
  final bool readOnly;
  final Widget icon;
  final bool border;
  final TextAlign textAlign;
  final Function onTap;
  final TextEditingController controller;
  final TextStyle style;

  const TextoFieldWidget(
      {Key key,
      this.cor,
      this.keyboardType,
      this.text,
      this.errorText,
      this.onChanged,
      this.obscureText = false,
      this.focusNode,
      this.readOnly = false,
      this.icon,
      this.border = true,
      this.textAlign = TextAlign.left, this.onTap, this.controller, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return TextField(
      controller: controller,
      readOnly: readOnly,
      focusNode: focusNode,
      keyboardType: keyboardType,
      onChanged: onChanged,
      obscureText: obscureText,
      textAlign: textAlign,
      style: style,
      onTap: onTap,
      decoration: InputDecoration(
        suffixIcon: icon,
        border: border == true
            ? OutlineInputBorder(borderSide: new BorderSide(color: cor))
            : InputBorder.none,
        labelText: text,
        labelStyle: TextStyle(fontSize: SizeConfig.sizeHeight * 2.5),
        errorText: errorText,
      ),
    );
  }
}
