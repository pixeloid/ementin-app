import 'package:auto_route/auto_route.dart';
import 'package:ementin_flutter/models/event_registration_model.dart';
import 'package:ementin_flutter/providers/event_provider.dart';
import 'package:ementin_flutter/utils/widgets/w_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:ementin_flutter/l10n/app_localizations.dart';

@RoutePage()
class RegistrationDetailsPage extends StatelessWidget {
  const RegistrationDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context, listen: true);
    final reg = eventProvider.selectedEvent!.eventRegistration;
    late Iterable<TicketModel> tickets;
    if (reg != null) {
      tickets =
          reg.tickets.where((ticket) => ticket.qty != 0).toList().reversed;
    }
    return (reg != null)
        ? Column(
            children: [
              WHeader(
                title: AppLocalizations.of(context)!
                    .page_title_registration_details,
                isShowBackButton: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Column(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.welcome,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                Text(
                                  '${reg.firstname} ${reg.lastname}'
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                                Text(
                                  '${AppLocalizations.of(context)!.your_registration}:',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              if (reg.accommodation != null)
                                RegItem(children: [
                                  Text(
                                      AppLocalizations.of(context)!
                                          .accommodation
                                          .toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(context).primaryColor,
                                      )),
                                  Text('${reg.accommodation}'),
                                  Text('${reg.room}'),
                                  Text(
                                      '${DateFormat('MMMEd').format(reg.checkin ?? DateTime.now())} - ${DateFormat('MMMEd').format(reg.checkout ?? DateTime.now())}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      )),
                                ]),
                              if (reg.tickets.isNotEmpty)
                                RegItem(children: [
                                  Text(
                                      AppLocalizations.of(context)!
                                          .dining_programs
                                          .toUpperCase(),
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 16,
                                                    child: Icon(
                                                      PhosphorIcons.fork_knife,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 16,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          ticket.name
                                                              .toUpperCase(),
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 1.2),
                                                        ),
                                                        Text(
                                                            '${DateFormat('EEEE').format(ticket.date)} (${DateFormat('MMM d.').format(ticket.date)})',
                                                            style:
                                                                const TextStyle(
                                                              height: 1.2,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                      '${ticket.qty} ${AppLocalizations.of(context)!.persons_unit.toLowerCase()}',
                                                      style: const TextStyle(
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
          )
        : const Text('Loading');
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
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
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
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
