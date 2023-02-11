import 'package:fluent_ui/fluent_ui.dart';
import 'package:os_algorithms_project/pages/execute_page/widgets/current_process_widget.dart';
import 'package:os_algorithms_project/pages/execute_page/widgets/finished_list_widget.dart';
import 'package:provider/provider.dart';

import '../../global.dart';
import '../../provider/executing_page_provider.dart';
import 'widgets/control_bar_widget.dart';
import 'widgets/queue_list_widget.dart';

class ExecutingPage extends StatelessWidget {
  final int algorithm;
  final List<Process> processesList;

  final int qTime;

  const ExecutingPage(
      {super.key,
      required this.algorithm,
      required this.processesList,
      required this.qTime});
  String getStringFromInteger(int integer) {
    String string = "";
    (integer == -1) ? string = "-" : string = "$integer";
    return string;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ExecuteProvider>(
      create: ((context) =>
          ExecuteProvider(processesList, algorithm, qTime: qTime)),
      builder: (context, _) {
        return NavigationView(
          appBar: NavigationAppBar(
              leading: IconButton(
                  icon: const Icon(FluentIcons.back),
                  onPressed: (() => Navigator.of(context).pop()))),
          content: const Column(children: [
            Row(
              children: [QueueListWidget(), CurrentProcessWidget()],
            ),
            FinishedListWidget(),
            ControlBarWidget()
          ]),
        );
      },
    );
  }
}
