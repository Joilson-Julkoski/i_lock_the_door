import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final String darkTitle;
  final Function backCallback;
  final String? text;
  const Header(
      {super.key,
      required this.title,
      required this.darkTitle,
      required this.backCallback,
      this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.all(5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () => {Navigator.pop(context)},
                icon: Icon(Icons.arrow_back_ios_new_rounded)),
          ],
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          darkTitle,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        if (text != null)
          Column(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              Text(
                text!,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 12),
              ),
            ],
          ),
        Padding(padding: EdgeInsets.all(20)),
      ],
    );
  }
}
