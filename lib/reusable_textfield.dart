import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReusableTextField extends StatelessWidget {
  ReusableTextField(
      {super.key,
      required this.fieldController,
      required this.hintText,
      this.formatter,
      this.maxLength,
      this.onTap});
  TextEditingController? fieldController;
  String hintText;
  List<TextInputFormatter>? formatter;
  int? maxLength;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: TextField(
          onTap: onTap,
          maxLength: maxLength,
          inputFormatters: formatter,
          onChanged: (value) {},
          controller: fieldController,
          style: TextStyle(
              color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.black38,
                fontSize: 18,
                fontWeight: FontWeight.w600),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
          ),
        ),
      ),
    );
  }
}
