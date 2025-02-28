class GSheetAttendeeFields {
  static const String id = "id";
  static const String date = "date";
  static const String name = "name";
  static const String checkIn = "check-in";
  static const String checkOut = "check-out";

  static List<String> getFields() => [id, date, name, checkIn, checkOut];
}

/// sample response

// {
// "id": 1,
// "name": "krishna",
// "date": "10-02-2035",
// "check-in": "10:00 AM",
// "check-out": "07:00 PM"
// }

class AttendeeModel {
  AttendeeModel({
    required this.id,
    required this.name,
    required this.date,
    required this.checkIn,
    required this.checkOut,
  });

  final int? id;
  final String? name;
  final String? date;
  final String? checkIn;
  final String? checkOut;

  AttendeeModel copyWith({
    int? id,
    String? name,
    String? date,
    String? checkIn,
    String? checkOut,
  }) {
    return AttendeeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
    );
  }

  factory AttendeeModel.fromJson(Map<String, dynamic> json) {
    return AttendeeModel(
      id: json["id"],
      name: json["name"],
      date: json["date"],
      checkIn: json["check-in"],
      checkOut: json["check-out"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "date": date,
        "check-in": checkIn,
        "check-out": checkOut,
      };

  @override
  String toString() {
    return "$id, $name, $date, $checkIn, $checkOut, ";
  }
}
