import 'global.dart';

class Algorithm {
  static Process fcfs(List<Process> queueList) {
    if (queueList.isEmpty) {
      return Process(-1, -1, -1, qIndex: 1, id: -1);
    }
    Process minAT = queueList[0];
    for (var element in queueList) {
      if (element.AT < minAT.AT) {
        minAT = element;
      } else if (element.AT == minAT.AT && element.id < minAT.id) {
        minAT = element;
      }
    }
    return minAT;
  }

  static Process srtf(List<Process> queueList) {
    if (queueList.isEmpty) {
      return Process(-1, -1, -1, qIndex: 1, id: -1);
    }
    Process minBT = queueList[0];
    for (var element in queueList) {
      if (element.BT < minBT.BT) {
        minBT = element;
      }
    }
    return minBT;
  }

  static Process sjf(List<Process> queueList, Process lastProcess) {
    if (queueList.isEmpty) {
      return Process(-1, -1, -1, qIndex: 1, id: -1);
    }
    for (var element in queueList) {
      if (element == lastProcess) {
        return lastProcess;
      }
    }
    return srtf(queueList);
  }

  static Process prio(List<Process> queueList) {
    if (queueList.isEmpty) {
      return Process(-1, -1, -1, qIndex: 1, id: -1);
    }
    Process maxPrio = queueList[0];
    for (var element in queueList) {
      if (element.priority > maxPrio.priority) {
        maxPrio = element;
      }
    }
    return maxPrio;
  }

  static Process rr(
    List<Process> queueList,
    Process currentProcess,
    int qTime,
  ) {
    if (queueList.isEmpty) {
      return Process(-1, -1, -1, qIndex: 1, id: -1);
    } else {
      if (qTime == 0) {
        try {
          return queueList
              .where((element) => element != currentProcess)
              .toList()
              .first;
        } catch (e) {
          return currentProcess;
        }
      }
      return currentProcess;
    }
  }

  static Process mlq(
      List<Process> queueList, int queueAlgorithm, Process lastProcess,
      {int qTime = 1}) {
    if (queueList.isEmpty) {
      return Process(-1, -1, -1, qIndex: 1, id: -1);
    }
    int? highestQueue = queueList[0].qIndex;
    for (var element in queueList) {
      if (element.qIndex < highestQueue!) {
        highestQueue = element.qIndex;
      }
    }
    List<Process> highestQueueList =
        List.from(queueList.where((element) => element.qIndex == highestQueue));
    switch (queueAlgorithm) {
      case 0:
        return fcfs(highestQueueList);
      case 1:
        return sjf(highestQueueList, lastProcess);
      case 2:
        return srtf(highestQueueList);
      case 3:
        return prio(highestQueueList);
      case 4:
        return rr(highestQueueList, lastProcess, qTime);
      default:
        return Process(-1, -1, -1, qIndex: 1, id: -1);
    }
  }
}
