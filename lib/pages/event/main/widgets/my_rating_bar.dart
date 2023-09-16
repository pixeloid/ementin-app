import 'package:eventapp/models/schedule_model.dart';
import 'package:eventapp/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class MyRatingBar extends StatelessWidget {
  final double value;
  final ScheduleEvent presentation;

  const MyRatingBar({
    Key? key,
    required this.value,
    required this.presentation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: value,
      itemCount: 5,
      onRatingUpdate: (val) =>
          Provider.of<ProgramProvider>(context, listen: false)
              .rate(presentation, val),
      ratingWidget: RatingWidget(
        full: const Icon(
          PhosphorIcons.star_fill,
          color: Colors.amber,
        ),
        half: const Icon(
          PhosphorIcons.star_half,
          color: Colors.amber,
        ),
        empty: const Icon(
          PhosphorIcons.star,
          color: Colors.amber,
        ),
      ),
    );
  }
}
