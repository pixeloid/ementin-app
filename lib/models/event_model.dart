import 'package:eventapp/models/event_registration_model.dart';
import 'package:eventapp/models/sponsor_category.dart';
import 'package:intl/intl.dart';

class EventModel {
  final int id;
  final String iri;
  final String name;
  bool checkedIn;
  final int start;
  final String end;
  final String? venue;
  final String address;
  final String domain;
  final String? image;
  final String? deadline;
  final String? abstractDeadline;
  final EventRegistrationModel? eventRegistration;
  final String daterange;
  final bool isInProgress;
  final List<AdModel> ads;
  final DateTime startDate;
  final DateTime endDate;
  final String? instaUrl;
  final List<SponsorCategory>? sponsorCategories;

  EventModel({
    required this.id,
    required this.iri,
    required this.start,
    required this.end,
    required this.venue,
    required this.address,
    required this.domain,
    this.image,
    required this.name,
    required this.checkedIn,
    this.deadline,
    this.abstractDeadline,
    this.eventRegistration,
    required this.daterange,
    required this.isInProgress,
    required this.ads,
    required this.startDate,
    required this.endDate,
    required this.instaUrl,
    this.sponsorCategories,
  });

  factory EventModel.fromJson(json) {
    return EventModel(
      id: json['id'],
      iri: json['@id'],
      name: json['name'] as String,
      domain: json['domain'] as String,
      checkedIn: json['checkedIn'],
      end:
          DateFormat('yyyy. MMMM d.', 'hu').format(DateTime.parse(json['end'])),
      start: DateTime.parse(json['start']).millisecondsSinceEpoch,
      endDate: DateTime.parse(json['end']).toLocal(),
      startDate: DateTime.parse(json['start']).toLocal(),
      venue: json['venue'],
      image: json['image'],
      address: json['venueAddress'] ?? '',
      eventRegistration: json['eventRegistration'] != null
          ? EventRegistrationModel?.fromJson(
              json['eventRegistration'] as Map<String, dynamic>)
          : null,
      deadline: json['deadline'] != null
          ? DateFormat('yyyy. MMMM d.', 'hu')
              .format(DateTime.parse(json['deadline']))
          : null,
      abstractDeadline: json['abstractDeadline'] != null
          ? DateFormat('yyyy. MMMM d.', 'hu')
              .format(DateTime.parse(json['abstractDeadline']))
          : null,
      daterange: DateFormat('yyyy. MMMM d', 'hu')
              .format(DateTime.parse(json['start'])) +
          DateFormat('-d.', 'hu').format(DateTime.parse(json['end'])),
      isInProgress: json['isInProgress'] ?? false,
      ads: json['ads'] != null
          ? (json['ads'] as List).map((ad) => AdModel.fromJson(ad)).toList()
          : [],
      instaUrl: json['insta'],
      sponsorCategories: (json['sponsors'] as List<dynamic>?)
          ?.map((e) => SponsorCategory.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

class AdModel {
  final String? image;
  final String? url;
  final int id;

  AdModel({
    required this.id,
    required this.image,
    this.url,
  });

  factory AdModel.fromJson(json) {
    return AdModel(
      id: json['id'],
      image: json['image'],
      url: json['url'].isNotEmpty ? json['url'] : null,
    );
  }
}
