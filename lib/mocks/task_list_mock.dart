import '../models/task_list_model.dart';

final List<TaskListModel> taskListMock = [
  TaskListModel(
    title: 'Planejar o dia',
    description: 'Organizar prioridades e definir a ordem das entregas.',
    isCompleted: true,
  ),
  TaskListModel(
    title: 'Revisar tarefas pendentes',
    description:
        'Verificar o que ainda está em andamento e atualizar o status.',
  ),
  TaskListModel(
    title: 'Enviar relatório',
    description: 'Compartilhar o resumo das atividades concluídas com o time.',
  ),
  TaskListModel(
    title: 'Fazer backup',
    description:
        'Salvar os arquivos importantes antes de finalizar o expediente.',
    isCompleted: true,
  ),
  TaskListModel(
    title: 'Organizar agenda de amanhã',
    description: 'Separar os blocos de tempo para as próximas demandas.',
  ),
];

TaskListModel sampleTask() => taskListMock.first;
