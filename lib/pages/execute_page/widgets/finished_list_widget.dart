// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../../global.dart';
import '../../../provider/executing_page_provider.dart';

class FinishedListWidget extends StatelessWidget {
  const FinishedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ExecuteProvider provider = Provider.of<ExecuteProvider>(context);
    List<ProcessTile> finishedProcesses = [];
    List<Process> listOfFinished = provider.finishedProcessesList;
    Map<int, int> flexMap = {};
    List<Widget> numberBar = [];
    for (int i = 0; i < listOfFinished.length; i++) {
      numberBar.add(Expanded(
          child: Center(
        child: Text(i.toString()),
      )));
      if (i != 0 && listOfFinished[i].id == listOfFinished[i - 1].id) {
        flexMap[finishedProcesses.length - 1] =
            flexMap[finishedProcesses.length - 1]! + 1;
      } else {
        finishedProcesses.add(ProcessTile(process: listOfFinished[i]));
        flexMap[finishedProcesses.length - 1] = 1;
      }
    }
    for (int i = 0; i < finishedProcesses.length; i++) {
      finishedProcesses[i].flex = ((flexMap[i] == null) ? 0 : flexMap[i])!;
    }
    return Expanded(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Finished Processes:"),
        Container(
          decoration: const BoxDecoration(
              border: Border.symmetric(horizontal: BorderSide())),
          child: Row(
            children: numberBar,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              border: Border.symmetric(horizontal: BorderSide())),
          child: Row(
            children: finishedProcesses,
          ),
        ),
      ],
    ));
  }
}

// ignore: must_be_immutable
class ProcessTile extends StatefulWidget {
  Process process;
  int flex = 1;
  ProcessTile({
    Key? key,
    required this.process,
  }) : super(key: key);

  @override
  State<ProcessTile> createState() => _ProcessTileState();
}

class _ProcessTileState extends State<ProcessTile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: widget.flex,
        child: Container(
          height: 30,
          decoration: const BoxDecoration(
              border: Border.symmetric(vertical: BorderSide())),
          child: Center(
            child:
                Text((widget.process.id != -1) ? "p${widget.process.id}" : ""),
          ),
        ));
  }
}
