import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Myinputtextfield extends StatelessWidget {
  const Myinputtextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        children: [
          SizedBox(width: 15),
          SvgPicture.asset("Assets/Icons/search.svg"),
          SizedBox(width: 15),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search Here...",
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          )
        ],
      ),
    );
  }
}
