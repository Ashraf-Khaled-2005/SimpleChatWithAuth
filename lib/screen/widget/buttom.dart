import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const CustomButtom({
    super.key,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: Color(0xff26425c),
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
