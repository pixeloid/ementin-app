import 'package:eventapp/models/program_item_model.dart';
import 'package:eventapp/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class MyRatingBar extends StatelessWidget {
  final value;
  final ProgramItemModel presentation;

  const MyRatingBar({
    Key? key,
    required double this.value,
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
        full: Icon(
          PhosphorIcons.star_fill,
          color: Colors.amber,
        ),
        half: Icon(
          PhosphorIcons.star_half,
          color: Colors.amber,
        ),
        empty: Icon(
          PhosphorIcons.star,
          color: Colors.amber,
        ),
      ),
    );
  }
}
