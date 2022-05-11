import 'package:eventapp/models/event_registration_model.dart';
import 'package:intl/intl.dart';

class EventModel {
  final int id;
  final String iri;
  final String name;
  bool checkedIn;
  final int start;
  final String end;
  final String venue;
  final String address;
  final String? image;
  final String? deadline;
  final String? abstractDeadline;
  final EventRegistrationModel? eventRegistration;

  final String daterange;

  final bool isInProgress;

  EventModel({
    required this.id,
    required this.iri,
    required this.start,
    required this.end,
    required this.venue,
    required this.address,
    this.image,
    required this.name,
    required this.checkedIn,
    this.deadline,
    this.abstractDeadline,
    this.eventRegistration,
    required this.daterange,
    required this.isInProgress,
  });

  factory EventModel.fromJson(json) {
    return EventModel(
      id: json['id'],
      iri: json['@id'],
      name: json['name'] as String,
      checkedIn: json['checkedIn'],
      end: DateFormat('yyyy. MMMM d.').format(DateTime.parse(json['end'])),
      start: DateTime.parse(json['start']).millisecondsSinceEpoch,
      venue: json['venue'],
      image: json['image'],
      address: json['venueAddress'] ?? '',
      eventRegistration: json['eventRegistration'] != null
          ? EventRegistrationModel?.fromJson(json['eventRegistration'])
          : null,
      deadline: json['deadline'] != null
          ? DateFormat('yyyy. MMMM d.').format(DateTime.parse(json['deadline']))
          : null,
      abstractDeadline: json['abstractDeadline'] != null
          ? DateFormat('yyyy. MMMM d.')
              .format(DateTime.parse(json['abstractDeadline']))
          : null,
      daterange:
          DateFormat('yyyy. MMMM d').format(DateTime.parse(json['start'])) +
              DateFormat('-d.').format(DateTime.parse(json['end'])),
      isInProgress: json['isInProgress'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
