import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      margin: EdgeInsets.all(10),
      // padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        child: TextField(
          enabled: false,
          autofocus: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(CupertinoIcons.search),
          ),
        ),
      ),
    );
  }
}
