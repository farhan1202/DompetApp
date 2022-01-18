import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.title,
    this.action = TextInputAction.next,
    required this.controllerC,
  }) : super(key: key);

  final String title;
  final TextInputAction action;
  final TextEditingController controllerC;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(vertical: 10),
            // height: 54,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  offset: Offset(0, 15),
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: TextField(
              controller: controllerC,
              textInputAction: action,
              decoration: InputDecoration(
                hintText: title,
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
