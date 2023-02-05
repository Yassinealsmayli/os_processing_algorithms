import 'package:flutter/cupertino.dart';
import 'package:os_algorithms_project/algorithms.dart';

import '../global.dart';

class ExcuteProvider with ChangeNotifier {
  final List<Process> processesList;
  List<Process> queueList = [];
  List<Process> finishedProcessesList = [];
  final int algorithm;
  int _time = 0;
  int maxTime = 0;
  int? qTime = 1;
  int? _currentQTime;
  int? mlqAlgorithm;

  int get time => _time;

  Process currentProcess = Process(-1, -1, -1, qIndex: 1, id: -1);
  void initTime() {
    _time = 0;
    timeChanged();
    notifyListeners();
  }

  timeInput(int t) {
    if (t > maxTime) {
      _time = maxTime;
    }
  }

  void changeTime(int t) {
    _time = t;
    timeInput(t);
    timeChanged();
    notifyListeners();
  }

  void setMaxTime() {
    _time = maxTime;
    timeChanged();
    notifyListeners();
  }

  void timeDecrease() {
    if (_time > 0) {
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
      finishedProcessesList.add(currentProcess);

      for (var element in processesList) {
        if (element.AT == i) {
          Process process = Process(element.AT, element.BT, element.priority,
              id: element.id, qIndex: element.qIndex);

          queueList.add(process);
        }
      }
      if (algorithm == 3) {
        if (currentTimeProcess(queueList) == currentProcess &&
            _currentQTime == 0) {
          Process process = queueList[0];
          queueList.removeAt(0);
          queueList.add(process);
          _currentQTime = qTime;
        } else {
          _currentQTime = _currentQTime! - 1;
        }
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
        return Algorithm.rr(queueList);
      case 4:
        return Algorithm.prio(queueList);
      case 5:
        return Algorithm.mlq(queueList, mlqAlgorithm!, currentProcess);
      default:
        return Process(-1, -1, -1, qIndex: 1, id: -1);
    }
  }

  ExcuteProvider(this.processesList, this.algorithm,
      {this.qTime, this.mlqAlgorithm}) {
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
      timeChanged();
      if (b && queueList.isEmpty && currentProcess.BT == -1) {
        maxTime = _time;
        break;
      }
    }
  }
}
