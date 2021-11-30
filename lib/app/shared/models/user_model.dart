class UserModel {
  UserModel({
    required this.gender,
    required this.name,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
  });

  final String gender;
  final Name name;
  final String email;
  final String phone;
  final String cell;
  final String nat;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        gender: json["gender"],
        name: Name.fromJson(json["name"]),
        email: json["email"],
        phone: json["phone"],
        cell: json["cell"],
        nat: json["nat"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "email": email,
        "phone": phone,
        "cell": cell,
        "nat": nat,
      };

  static List<UserModel>? fromJsonList(List list) {
    return list.map((item) => UserModel.fromJson(item)).toList();
  }
}

class Name {
  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  final String title;
  final String first;
  final String last;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}
