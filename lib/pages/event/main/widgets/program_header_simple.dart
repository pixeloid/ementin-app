import 'package:flutter/material.dart';

class ProgramHeaderSimple extends StatelessWidget {
  final String? time;
  final String title;

  const ProgramHeaderSimple({
    Key? key,
    required this.time,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (time != null)
          Text(
            time!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C2B7A),
              height: 1.2,
            ),
          ),
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontSize: 18,
            height: 1.2,
            color: Color(0xFF2C2B7A),
            fontWeight: FontWeight.w700,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
        ),
      ],
    );
  }
}
