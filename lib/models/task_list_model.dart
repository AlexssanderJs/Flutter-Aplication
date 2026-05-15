class TaskListModel {
  final String title;
  final String description;
  final bool isCompleted;

  const TaskListModel({
    required this.title,
    required this.description,
    this.isCompleted = false,
  });

  String get status => isCompleted ? 'Concluído' : 'Em andamento';
}
