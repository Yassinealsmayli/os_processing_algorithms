import 'package:fluent_ui/fluent_ui.dart';
import 'package:os_algorithms_project/pages/execute_page/execute_page.dart';
import 'package:os_algorithms_project/pages/input_page/widgets/upper_bar.dart';
import 'package:provider/provider.dart';

import '../../provider/input_page_provider.dart';
import 'widgets/add_process_widget.dart';
import 'widgets/table_widget.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InputPageProvider>(
        create: ((context) => InputPageProvider()),
        builder: (context, _) {
          InputPageProvider transaction =
              Provider.of<InputPageProvider>(context);
          return NavigationView(
            pane: NavigationPane(
                selected: index,
                onChanged: (newIndex) {
                  transaction.changeIndex(newIndex);
                  setState(() {
                    index = newIndex;
                  });
                },
                displayMode: PaneDisplayMode.open,
                items: [
                  PaneItem(
                      icon: const Text("FCFS"),
                      title: const Text("First Come First Served(FCFS)"),
                      body: const InputPageBody(index: 0)),
                  PaneItemSeparator(),
                  PaneItem(
                      icon: const Text("SJF"),
                      title: const Text("Shortest Job First(SJF)"),
                      body: const InputPageBody(index: 1)),
                  PaneItemSeparator(),
                  PaneItem(
                      icon: const Text("SRTF"),
                      title: const Text("Shortest Remaining Time First(SRTF)"),
                      body: const InputPageBody(index: 2)),
                  PaneItemSeparator(),
                  PaneItem(
                      icon: const Text("RR"),
                      title: const Text("Round Robin(RR)"),
                      body: const InputPageBody(index: 3)),
                  PaneItemSeparator(),
                  PaneItem(
                      icon: const Text("P"),
                      title: const Text("Priority"),
                      body: const InputPageBody(index: 4)),
                  PaneItemSeparator(),
                  PaneItem(
                      icon: const Text("MLQ"),
                      title: const Text("Multilevel Queue"),
                      body: const InputPageBody(index: 5)),
                  PaneItemSeparator(),
                ]),
            appBar: NavigationAppBar(
                leading: IconButton(
                    icon: const Icon(FluentIcons.back),
                    onPressed: () => Navigator.of(context).pop()),
                actions: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Button(
                      style: ButtonStyle(
                          backgroundColor: ButtonState.all<Color>(Colors.red),
                          padding: ButtonState.all<EdgeInsetsGeometry>(
                              const EdgeInsets.all(10))),
                      onPressed: () => {
                            Navigator.of(context).push(FluentPageRoute(
                                builder: ((context) => ExecutingPage(
                                      algorithm: index,
                                      processesList:
                                          List.from(transaction.list),
                                    ))))
                          },
                      child:
                          const Row(mainAxisSize: MainAxisSize.min, children: [
                        Text(
                          "Run",
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          FluentIcons.play,
                          color: Colors.white,
                        )
                      ])),
                )),
          );
        });
  }
}

class InputPageBody extends StatelessWidget {
  final int index;
  const InputPageBody({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (index == 3 || index == 5) UpperBar(index: index),
        AddProcessWidget(algorithm: index),
        Expanded(child: ProcessTable(algorithm: index))
      ],
    );
  }
}
