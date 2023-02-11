import 'package:fluent_ui/fluent_ui.dart';
import 'package:os_algorithms_project/algorithms.dart';

import '../global.dart';

class ExecuteProvider with ChangeNotifier {
  final List<Process> processesList;
  List<Process> queueList = [];
  List<Process> finishedProcessesList = [];
  final int algorithm;
  int _time = 0;
  int maxTime = 0;
  int qTime = 1;
  int? _currentQTime;
  int? mlqAlgorithm;

  int get time => _time;

  Process currentProcess = Process(-1, -1, -1, qIndex: 1, id: -1);
  void initTime() {
    _time = 1;
    timeChanged();
    notifyListeners();
  }

  timeInput(int t) {
    if (t > maxTime + 1) {
      _time = maxTime + 1;
    }
  }

  void changeTime(int t) {
    _time = t;
    timeInput(t);
    timeChanged();
    notifyListeners();
  }

  void setMaxTime() {
    _time = maxTime + 1;
    timeChanged();
    notifyListeners();
  }

  void timeDecrease() {
    if (_time > 1) {
      _time -= 1;
    }
    timeChanged();
    notifyListeners();
  }

  void timeIncrease() {
    _time += 1;
    timeInput(_time);
    timeChanged();
    notifyListeners();
  }

  void timeChanged() {
    queueList = [];
    finishedProcessesList = [];
    currentProcess = Process(-1, -1, -1, qIndex: 1, id: -1);
    for (int i = 0; i <= _time; i++) {
      for (var element in processesList) {
        if (element.AT == i) {
          Process process = Process(element.AT, element.BT, element.priority,
              id: element.id, qIndex: element.qIndex);

          queueList.add(process);
        }
      }
      if (algorithm == 3) {
        roundRobin();
      }
      currentProcess = currentTimeProcess(queueList);
      if (queueList.contains(currentProcess)) {
        queueList[queueList.indexOf(currentProcess)].BT -= 1;
      }
      for (int i = 0; i < queueList.length; i++) {
        if (queueList[i].BT <= 0) {
          queueList.removeAt(i);
        }
      }
      finishedProcessesList.add(currentProcess);
    }
  }

  void roundRobin() {
    if (_currentQTime == 0 &&
        queueList.where((element) => element != currentProcess).isNotEmpty) {
      currentProcess.AT = _time;
      queueList.sort((a, b) => a.AT.compareTo(b.AT));
      _currentQTime = qTime;
    } else {
      _currentQTime = (_currentQTime! - 1);
    }
  }

  Process currentTimeProcess(List<Process> queueList) {
    switch (algorithm) {
      case 0:
        return Algorithm.fcfs(queueList);
      case 1:
        return Algorithm.sjf(queueList, currentProcess);
      case 2:
        return Algorithm.srtf(queueList);
      case 3:
        return Algorithm.rr(queueList, currentProcess, _currentQTime!);
      case 4:
        return Algorithm.prio(queueList);
      case 5:
        return Algorithm.mlq(queueList, mlqAlgorithm!, currentProcess);
      default:
        return Process(-1, -1, -1, qIndex: 1, id: -1);
    }
  }

  ExecuteProvider(this.processesList, this.algorithm,
      {required this.qTime, this.mlqAlgorithm}) {
    initProvider();
  }

  void initProvider() {
    for (int i = 0; i < 999; i++) {
      _time = i;
      bool b = true;
      for (var element in processesList) {
        if (element.AT >= _time) {
          b = false;
          break;
        }
      }
      _currentQTime = qTime;
      timeChanged();
      if (b && queueList.isEmpty && currentProcess.BT == -1) {
        maxTime = _time;
        break;
      }
    }
  }
}
