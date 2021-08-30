class UserModel {
  UserModel({
    this.gender,
    this.name,
    this.email,
    this.phone,
    this.cell,
    this.nat,
  });

  String? gender;
  Name? name;
  String? email;
  String? phone;
  String? cell;
  String? nat;

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
    this.title,
    this.first,
    this.last,
  });

  String? title;
  String? first;
  String? last;

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
