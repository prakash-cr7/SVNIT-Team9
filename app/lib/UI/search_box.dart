import 'package:app/UI/constans.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.grey,
      onChanged: (val) {},
      decoration: InputDecoration(
          fillColor: Colors.grey,
          hintText: 'Search',
          focusColor: Colors.grey,
          hoverColor: Colors.grey,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: UiColors.primaryColor,
          )),
    );
  }
}
