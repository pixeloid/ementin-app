class EventRegistrationModel {
  final String iri;
  final String firstname;
  final String lastname;
  final String city;
  final String? accommodation;
  final String? room;
  final List<TicketModel> tickets;
  final DateTime? checkin;
  final DateTime? checkout;

  EventRegistrationModel({
    required this.iri,
    required this.firstname,
    required this.lastname,
    required this.city,
    required this.tickets,
    this.accommodation,
    this.room,
    this.checkin,
    this.checkout,
  });

  factory EventRegistrationModel.fromJson(Map<String, dynamic> json) {
    final t = json['tickets'] as List;
    final tickets = t.where(
      (element) {
        return element['qty'] > 0;
      },
    );
    return EventRegistrationModel(
      iri: json['@id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      city: json['city'],
      tickets:
          List<TicketModel>.from(tickets.map((p) => TicketModel.fromJson(p))),
      accommodation: json['accommodation'],
      room: json['room'],
      checkin: json['checkin'] != null ? DateTime.parse(json['checkin']) : null,
      checkout:
          json['checkout'] != null ? DateTime.parse(json['checkout']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
      };
}

class TicketModel {
  final DateTime date;
  final int qty;
  final String? description;
  final String name;

  TicketModel({
    required this.date,
    required this.qty,
    this.description,
    required this.name,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      name: json['name'],
      description: json['description'],
      qty: json['qty'],
      date: DateTime.parse(json['date']),
    );
  }
}
