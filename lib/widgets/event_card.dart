import 'package:auto_route/auto_route.dart';
import 'package:ementin_flutter/app_define/app_route.gr.dart';
import 'package:ementin_flutter/models/event_model.dart';
import 'package:ementin_flutter/providers/event_provider.dart';
import 'package:ementin_flutter/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EventCard extends StatelessWidget {
  final EventModel event;

  const EventCard({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    final LocaleProvider localeProvider =
        Provider.of<LocaleProvider>(context, listen: false);
    return Consumer<EventProvider>(
      builder: (context, eventProvider, child) {
        return Card(
          child: GestureDetector(
            onTap: () {
              eventProvider.selectedEventId = event.id;
              localeProvider.locale = Locale(event.locale);
              AutoRouter.of(context)
                  .push(MainRoute(children: [EventProgramRoute()]));
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(243, 244, 246, 1),
                      width: 1,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (event.isInProgress)
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 1),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 208, 57, 57),
                          ),
                          child: Text(
                            'Jelenleg zajlik'.toUpperCase(),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 11,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        decoration: const BoxDecoration(),
                        child: Column(
                          children: <Widget>[
                            if (event.image != null)
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(243, 244, 246, 1),
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        'https://home.ementin.hu/${event.image}'),
                                    fit: BoxFit.cover,
                                    onError: (error, stackTrace) =>
                                        debugPrint(error.toString()),
                                  ),
                                ),
                              ),
                            const SizedBox(height: 13),
                            Row(
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        event.name.toUpperCase(),
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                          letterSpacing: -.5,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        event.name,
                                        style: const TextStyle(
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
                                )
                              ],
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
                              child: Text(event.daterange.toUpperCase(),
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontWeight: FontWeight.w900)),
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
                              child: Container(
                                decoration: const BoxDecoration(),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    if (event.venue != null)
                                      Text(
                                        event.venue.toString(),
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color:
                                                Color.fromRGBO(31, 41, 55, 1),
                                            fontSize: 14,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.bold,
                                            height: 1.4285714285714286),
                                      ),
                                    const SizedBox(height: 0),
                                    Text(
                                      event.address,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          color: Color.fromRGBO(31, 41, 55, 1),
                                          fontSize: 12,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1.6666666666666667),
                                    ),
                                    if (event.deadline != null ||
                                        event.abstractDeadline != null)
                                      Column(
                                        children: [
                                          const SizedBox(height: 13),
                                          Container(
                                              height: 1,
                                              decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    229, 231, 235, 1),
                                              )),
                                          const SizedBox(height: 13),
                                          Container(
                                            decoration: const BoxDecoration(),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 0),
                                            child: Row(
                                              children: <Widget>[
                                                if (event.deadline != null)
                                                  Expanded(
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 0,
                                                          vertical: 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          Text(
                                                              'KEDVezményes REGISZTRÁCIÓ HATÁRIDEJE:'
                                                                  .toUpperCase(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 2,
                                                              style:
                                                                  const TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        55,
                                                                        65,
                                                                        81,
                                                                        1),
                                                                fontSize: 9,
                                                                letterSpacing:
                                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                              )),
                                                          const SizedBox(
                                                              height: 4),
                                                          Text(
                                                            event.deadline
                                                                .toString()
                                                                .toUpperCase(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style:
                                                                const TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      31,
                                                                      41,
                                                                      55,
                                                                      1),
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                if (event.abstractDeadline !=
                                                    null)
                                                  Expanded(
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 0,
                                                          vertical: 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          const Text(
                                                            'ABSZTRAKT BEADÁSI HATÁRIDŐ:',
                                                            maxLines: 2,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        55,
                                                                        65,
                                                                        81,
                                                                        1),
                                                                fontSize: 9,
                                                                letterSpacing:
                                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                height:
                                                                    1.7777777777777777),
                                                          ),
                                                          const SizedBox(
                                                              height: 4),
                                                          Text(
                                                            event
                                                                .abstractDeadline
                                                                .toString()
                                                                .toUpperCase(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 2,
                                                            style: const TextStyle(
                                                                color: Color
                                                                    .fromRGBO(31,
                                                                        41, 55, 1),
                                                                fontSize: 14,
                                                                letterSpacing:
                                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                height:
                                                                    1.4285714285714286),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
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
        );
      },
    );
  }
}
