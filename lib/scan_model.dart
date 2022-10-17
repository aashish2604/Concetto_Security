class ScanModel {
  int id;
  String email;
  String name;
  String college;
  String events;
  String gender;
  String phone;
  String transportation;
  String arrival;
  String departure;
  String comboPack;
/*
    "id": 1,
    "email": "test@test.com",
    "name": "Test Name",
    "college": "Test College",
    "events": "Event 1, Event 2, Event 5",
    "gender": "M",
    "phone": "9898989898",
    "transportation": "Bus",
    "arrival": "10/15/2022 22:23:28",
    "departure": "10/15/2022 22:23:28",
    "combo_pack": "A"
*/
  ScanModel({
    required this.id,
    required this.email,
    required this.name,
    required this.college,
    required this.events,
    required this.gender,
    required this.phone,
    required this.transportation,
    required this.arrival,
    required this.departure,
    required this.comboPack,
  });

  factory ScanModel.fromJson(Map<String, dynamic> json) {
    // DateTime arrivalTime = DateTime.parse(json['arrival']);
    // DateTime departureTime = DateTime.parse(json['departure']);

    return ScanModel(
      id: json['id'] as int,
      email: json['email'],
      name: json['name'],
      college: json['college'],
      events: json['events'],
      gender: json['gender'],
      phone: json['phone'],
      transportation: json['transportation'],
      arrival: json['arrival'],
      departure: json['departure'],
      comboPack: json['combo_pack'],
    );
  }
}
