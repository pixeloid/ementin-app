import 'package:eventapp/models/program_item_model.dart';
import 'package:flutter/material.dart';

import 'program_item_hero.dart';

class ProgramItem extends StatelessWidget {
  final String? prefix;

  const ProgramItem({Key? key, required this.presentation, this.prefix})
      : super(key: key);

  final ProgramItemModel presentation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProgramItemHero(
          presentation: presentation,
          showBody: false,
          prefix: prefix,
          showLoveButton: presentation.type == 'Presentation',
          onTap: presentation.body != null
              ? () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return Scaffold(
                          body: ProgramItemFullHero(
                            presentation: presentation,
                            showBody: true,
                            showLoveButton: presentation.type == 'Presentation',
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        );
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(0.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.ease;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                      transitionDuration: Duration(milliseconds: 500),
                    ),
                  );
                }
              : () {},
        ),
      ],
    );
  }
}
