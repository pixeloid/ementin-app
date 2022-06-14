import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/utils/widgets/w_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class RegistrationDetailsPage extends StatelessWidget {
  const RegistrationDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context, listen: true);
    final reg = eventProvider.selectedEvent!.eventRegistration;
    final tickets =
        reg!.tickets.where((ticket) => ticket.qty != 0).toList().reversed;
    return Column(
      children: [
        WHeader(
          title: 'Regisztráció részletei',
          isShowBackButton: false,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              if (reg != null)
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          children: [
                            Text(
                              'Üdvözöljük',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            Text(
                              '${reg.firstname} ${reg.lastname}'.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                            Text(
                              'Az ön regisztrációja:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          if (reg.accommodation != null)
                            RegItem(children: [
                              Text('Szállás'.toUpperCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).primaryColor,
                                  )),
                              Text('${reg.accommodation}'),
                              Text('${reg.room}'),
                              Text('${reg.checkin} - ${reg.checkout}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  )),
                            ]),
                          if (reg.tickets.isNotEmpty)
                            RegItem(children: [
                              Text('Étkezés, programok'.toUpperCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).primaryColor,
                                  )),
                              if (tickets.isNotEmpty)
                                Column(
                                  children: tickets
                                      .toList()
                                      .map<Widget>(
                                        (ticket) => Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CircleAvatar(
                                                radius: 16,
                                                child: Icon(
                                                  PhosphorIcons.fork_knife,
                                                  size: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${ticket.name}'
                                                          .toUpperCase(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          height: 1.2),
                                                    ),
                                                    Text(
                                                        '${DateFormat('EEEE', 'hu').format(ticket.date)} (${DateFormat('MMM d.', 'hu').format(ticket.date)})',
                                                        style: TextStyle(
                                                          height: 1.2,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              Text('${ticket.qty} fő',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18,
                                                      height: 1.2)),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                )
                            ]),
                        ],
                      )
                    ],
                  ),
                ),
            ]),
          ),
        )
      ],
    );
  }
}

class RegItem extends StatelessWidget {
  const RegItem({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            color: Color(0xFFFFFFFF),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(children: children),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
