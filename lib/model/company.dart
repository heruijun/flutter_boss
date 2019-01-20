class Company {
  final String id;
  final String company;
  final String logo;
  final String info;
  final String hot;

  Company({this.id, this.company, this.logo, this.info, this.hot});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
        id: json['id'],
        company: json['company'],
        logo: json['logo'],
        info: json['info'],
        hot: json['hot']);
  }
}
