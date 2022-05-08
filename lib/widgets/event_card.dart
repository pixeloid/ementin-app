import 'package:auto_route/auto_route.dart';
import 'package:eventapp/models/event_model.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../app_define/app_route.gr.dart';

class EventCard extends StatelessWidget {
  final EventModel event;

  const EventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventProvider>(
      builder: (context, eventProvider, child) {
        return Card(
          child: GestureDetector(
            onTap: () {
              eventProvider.selectedEventId = event.id;
              AutoRouter.of(context).push(const MainRoute(children: [
                EventMainRoute(
                  children: [
                    EventProgramRoute(),
                  ],
                ),
              ]));
            },
            child: Column(
              children: [
                // Figma Flutter Generator Frame6Widget - FRAME - HORIZONTAL
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    border: event.checkedIn
                        ? Border.all(
                            color: const Color.fromARGB(255, 255, 0, 242),
                            width: 4,
                          )
                        : Border.all(
                            color: const Color.fromRGBO(243, 244, 246, 1),
                            width: 1,
                          ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Container(
                    decoration: const BoxDecoration(),
                    width: MediaQuery.of(context).size.width - 40,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        if (event.image != null)
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              border: Border.all(
                                color: const Color.fromRGBO(243, 244, 246, 1),
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://home.ementin.hu/${event.image}'),
                                fit: BoxFit.cover,
                                onError: (error, stackTrace) => error,
                              ),
                            ),
                          ),
                        const SizedBox(height: 13),
                        Container(
                          decoration: const BoxDecoration(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                event.name.toUpperCase(),
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                style: GoogleFonts.poppins(
                                  color: const Color.fromRGBO(55, 65, 81, 1),
                                  fontSize: 16,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.w700,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'XX. Jubileumi Fiatal Gyermekgyógyászok Konferenciája',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromRGBO(55, 65, 81, 1),
                                  fontSize: 12,
                                  height: 1.4,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 13),
                        Container(
                            height: 1,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(229, 231, 235, 1),
                            )),
                        const SizedBox(height: 13),
                        Container(
                          width: 311,
                          decoration: const BoxDecoration(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'KEDVezményes REGISZTRÁCIÓ HATÁRIDEJE:',
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: GoogleFonts.poppins(
                                            color: const Color.fromRGBO(
                                                55, 65, 81, 1),
                                            fontSize: 9,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1.7777777777777777),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        event.deadline.toString(),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            color: const Color.fromRGBO(
                                                31, 41, 55, 1),
                                            fontSize: 14,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.w700,
                                            height: 1.4285714285714286),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Text(
                                        'ABSZTRAKTBEADÁSI HATÁRIDŐ:',
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(55, 65, 81, 1),
                                            fontSize: 9,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1.7777777777777777),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        event.abstractDeadline
                                            .toString()
                                            .toUpperCase(),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: GoogleFonts.poppins(
                                            color: const Color.fromRGBO(
                                                31, 41, 55, 1),
                                            fontSize: 14,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.w700,
                                            height: 1.4285714285714286),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 13),
                        Container(
                            height: 1,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(229, 231, 235, 1),
                            )),
                        const SizedBox(height: 13),
                        Container(
                          decoration: const BoxDecoration(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Stack(children: const <Widget>[])),
                              const SizedBox(width: 8),
                              Text(
                                (event.start + event.end).toUpperCase(),
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                    color: const Color.fromRGBO(31, 41, 55, 1),
                                    fontSize: 14,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.w700,
                                    height: 1.4285714285714286),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 13),
                        Container(
                            width: 311,
                            height: 1,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(229, 231, 235, 1),
                            )),
                        const SizedBox(height: 13),
                        Container(
                          decoration: const BoxDecoration(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Stack(children: const <Widget>[])),
                              const SizedBox(width: 8),
                              Container(
                                decoration: const BoxDecoration(),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      event.venue,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          color: Color.fromRGBO(31, 41, 55, 1),
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1.4285714285714286),
                                    ),
                                    const SizedBox(height: 0),
                                    Text(
                                      event.address,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          color: Color.fromRGBO(31, 41, 55, 1),
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1.6666666666666667),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
