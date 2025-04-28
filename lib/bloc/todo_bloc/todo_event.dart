abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent{
  int number;
  AddTodoEvent({required this.number});
}
class RemoveTodoEvent extends TodoEvent{
  int number;
  RemoveTodoEvent({required this.number});
}