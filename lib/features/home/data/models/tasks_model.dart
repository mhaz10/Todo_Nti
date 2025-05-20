class TasksModel {
  TasksModel({
    required this.status,
    required this.tasks,
  });

  final bool? status;
  final List<SingleTaskModel> tasks;

  factory TasksModel.fromJson(Map<String, dynamic> json){
    return TasksModel(
      status: json["status"],
      tasks: json["tasks"] == null ? [] : List<SingleTaskModel>.from(json["tasks"]!.map((x) => SingleTaskModel.fromJson(x))),
    );
  }

}

class SingleTaskModel {
  SingleTaskModel({
    required this.createdAt,
    required this.description,
    required this.id,
    required this.imagePath,
    required this.title,
  });

  final String? createdAt;
  final String? description;
  final int? id;
  final dynamic imagePath;
  final String? title;

  factory SingleTaskModel.fromJson(Map<String, dynamic> json){
    return SingleTaskModel(
      createdAt: json["created_at"],
      description: json["description"],
      id: json["id"],
      imagePath: json["image_path"],
      title: json["title"],
    );
  }

}
