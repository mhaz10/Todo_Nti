class UpdateTaskModel {
  UpdateTaskModel({
    required this.message,
    required this.status,
    required this.task,
  });

  final String? message;
  final bool? status;
  final TaskModel? task;

  factory UpdateTaskModel.fromJson(Map<String, dynamic> json){
    return UpdateTaskModel(
      message: json["message"],
      status: json["status"],
      task: json["task"] == null ? null : TaskModel.fromJson(json["task"]),
    );
  }

}

class TaskModel {
  TaskModel({
    required this.description,
    required this.id,
    required this.imagePath,
    required this.title,
  });

  final String? description;
  final int? id;
  final dynamic imagePath;
  final String? title;

  factory TaskModel.fromJson(Map<String, dynamic> json){
    return TaskModel(
      description: json["description"],
      id: json["id"],
      imagePath: json["image_path"],
      title: json["title"],
    );
  }

}
