import 'package:intl/intl.dart';

class EventModel {
  final int id;
  final String iri;
  final String name;
  bool checkedIn;
  final String start;
  final String end;
  final String venue;
  final String address;
  final String? image;
  final String? deadline;
  final String? abstractDeadline;
  final String? eventRegistration;

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
  });

  factory EventModel.fromJson(json) {
    return EventModel(
      id: json['id'],
      iri: json['@id'],
      name: json['name'] as String,
      checkedIn: json['checkedIn'],
      end: DateFormat('Hm').format(DateTime.parse(json['end'])),
      start: DateFormat('Hm').format(DateTime.parse(json['start'])),
      venue: json['venue'],
      image: json['image'] ?? '',
      address: json['venueAddress'] ?? '',
      eventRegistration: json['eventRegistration'] != null
          ? json['eventRegistration']['id'].toString()
          : '',
      deadline: json['deadline'] != null
          ? DateFormat('Md').format(DateTime.parse(json['deadline']))
          : '',
      abstractDeadline: json['abstractDeadline'] != null
          ? DateFormat('Hm').format(DateTime.parse(json['abstractDeadline']))
          : '',
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
