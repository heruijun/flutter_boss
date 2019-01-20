class Job {
  final String id;
  final String title;
  final String salary;
  final String company;
  final String info;
  final String category;
  final String head;
  final String publish;

  Job(
      {this.id,
      this.title,
      this.salary,
      this.company,
      this.info,
      this.category,
      this.head,
      this.publish});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      title: json['title'],
      salary: json['salary'],
      company: json['company'],
      info: json['info'],
      category: json['category'],
      head: json['head'],
      publish: json['publish'],
    );
  }
}
