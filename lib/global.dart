// ignore_for_file: non_constant_identifier_names

class Process {
  int? id;
  int qIndex = 1;
  int AT = -1;
  int BT = -1;
  int priority = -1;
  Process(this.AT, this.BT, this.priority, {this.id, required this.qIndex});
}
