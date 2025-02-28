class GSheetEmpFields {
  static const String id = "id";
  static const String empName = "name";

  static List<String> getFields() => [id, empName];
}

/// sample response

// {
// "id": 1,
// "name": "krishna"
// }

class EmployeeModel {
  EmployeeModel({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  EmployeeModel copyWith({
    int? id,
    String? name,
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  String toString() {
    return "$id, $name, ";
  }
}
