

import 'package:fluent_ui/fluent_ui.dart';

import '../global.dart';

class InputPageProvider with ChangeNotifier {
  List<Process> fcfsList = [];
  List<Process> sjfList = [];
  List<Process> srtfList = [];
  List<Process> rrList = [];
  List<Process> priorityList = [];
  List<Process> mlqList = [];
  List<Process> list = [];
  int index = 0;
  int qTime = 1;

  InputPageProvider() {
    changeIndex(index);
  }

  Map<int, int> mlqMap = {};
  List<int> mlqQueue() {
    List<int> list = [];
    for (var element in mlqList) {
      if (!list.contains(element.qIndex)) {
        list.add(element.qIndex);
      }
    }
    return list;
  }

  void addProcess(Process process, int index) {
    if (!(process.AT == -2 || process.BT == -2)) {
      list.add(process);
      list.sort(((a, b) => a.AT.compareTo(b.AT)));
    }
    setId();
    notifyListeners();
  }

  void removeProcess(int index, int algorithm) {
    list.removeWhere(
      (element) => list.indexOf(element) == index,
    );
    setId();
    notifyListeners();
  }

  void setId() {
    for (var element in list) {
      element.id = list.indexOf(element);
    }
  }

  void changeIndex(int i) {
    index = i;
    switch (index) {
      case 0:
        list = fcfsList;
        break;
      case 1:
        list = sjfList;
        break;
      case 2:
        list = srtfList;
        break;
      case 3:
        list = rrList;
        break;
      case 4:
        list = priorityList;
        break;
      case 5:
        list = mlqList;
    }
    for (var i = 0; i < list.length; i++) {
      list[i].id = i;
    }
    notifyListeners();
  }
}
