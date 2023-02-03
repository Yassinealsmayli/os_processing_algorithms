import 'package:fluent_ui/fluent_ui.dart';
import 'package:os_algorithms_project/provider/input_page_provider.dart';
import 'package:provider/provider.dart';

class ProcessTable extends StatefulWidget {
  final int algorithm;

  const ProcessTable({
    Key? key,
    required this.algorithm,
  }) : super(key: key);

  @override
  State<ProcessTable> createState() => _ProcessTableState();
}

class _ProcessTableState extends State<ProcessTable> {
  String getStringFromInteger(int integer) {
    String string = "";
    (integer == -1) ? string = "-" : string = "$integer";
    return string;
  }

  @override
  Widget build(BuildContext context) {
    InputPageProvider provider = Provider.of<InputPageProvider>(context);
    List<Widget> tableContent = [];
    tableContent.add(Row(
      children: [
        const Expanded(child: Text("process")),
        const Expanded(child: Text("A.T.")),
        const Expanded(child: Text("B.T")),
        if (provider.index == 4) const Expanded(child: Text("priority")),
        if (provider.index == 5) const Expanded(child: Text("queue index")),
        const Expanded(child: Text("remove")),
      ],
    ));
    tableContent.add(const SizedBox(height: 10));
    for (var element in provider.list) {
      tableContent.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(child: Text("p${provider.list.indexOf(element)}")),
          Expanded(child: Text(getStringFromInteger(element.AT))),
          Expanded(child: Text(getStringFromInteger(element.BT))),
          if (provider.index == 4)
            Expanded(child: Text(getStringFromInteger(element.priority))),
          if (provider.index == 5)
            Expanded(child: Text(element.qIndex.toString())),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Row(
                  children: [
                    IconButton(
                        style: ButtonStyle(
                            backgroundColor: ButtonState.all<Color>(Colors.red),
                            iconSize: ButtonState.all<double>(10)),
                        onPressed: () => provider.removeProcess(
                            provider.list.indexOf(element), widget.algorithm),
                        icon: const Icon(
                          FluentIcons.remove,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ));
      tableContent.add(const SizedBox(
        height: 10,
      ));
    }
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: tableContent,
            ),
          )
        ],
      ),
    );
  }
}
