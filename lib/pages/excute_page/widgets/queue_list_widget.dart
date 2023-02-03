import 'package:fluent_ui/fluent_ui.dart';
import 'package:os_algorithms_project/provider/excuting_page_provider.dart';
import 'package:provider/provider.dart';

import '../../../global.dart';

class QueueListWidget extends StatelessWidget {
  const QueueListWidget({super.key});
  String getStringFromInteger(int integer) {
    String string = "";
    (integer == -1) ? string = "-" : string = "$integer";
    return string;
  }

  @override
  Widget build(BuildContext context) {
    ExcuteProvider provider = Provider.of<ExcuteProvider>(context);
    List<Widget> queueList = [];
    queueList.add(const SizedBox(height: 10));
    List<Process> listOfQueue = provider.queueList;
    queueList.addAll(listOfQueue.map<Widget>((element) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: Text("p${element.id}")),
                Expanded(child: Text(getStringFromInteger(element.AT))),
                Expanded(child: Text(getStringFromInteger(element.BT))),
                Expanded(child: Text(getStringFromInteger(element.priority))),
              ],
            ),
          ],
        )));
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Process Queue at time ${provider.time}:"),
          Container(
            height: 400,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(border: Border.all()),
            //For the queue table
            child: Column(
              children: [
                Row(
                  children: const [
                    Expanded(child: Text("process")),
                    Expanded(child: Text("A.T.")),
                    Expanded(child: Text("B.T")),
                    Expanded(child: Text("priority")),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: queueList,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
