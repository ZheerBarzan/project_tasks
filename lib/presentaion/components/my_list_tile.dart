import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyListTile extends StatelessWidget {
  final String? text;
  void Function()? onTap;
  MyListTile({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        onTap: onTap,
        title: Text(text!),
      ),
    );
  }
}
