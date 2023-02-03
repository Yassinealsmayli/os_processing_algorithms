import 'package:fluent_ui/fluent_ui.dart';
import 'package:os_algorithms_project/pages/excute_page/widgets/current_process_widget.dart';
import 'package:os_algorithms_project/pages/excute_page/widgets/finished_list_widget.dart';
import 'package:provider/provider.dart';

import '../../global.dart';
import '../../provider/excuting_page_provider.dart';
import 'widgets/controll_bar_widget.dart';
import 'widgets/queue_list_widget.dart';

class ExcutingPage extends StatelessWidget {
  final int algorithm;
  final List<Process> processesList;

  const ExcutingPage(
      {super.key, required this.algorithm, required this.processesList});
  String getStringFromInteger(int integer) {
    String string = "";
    (integer == -1) ? string = "-" : string = "$integer";
    return string;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ExcuteProvider>(
      create: ((context) => ExcuteProvider(processesList, algorithm)),
      builder: (context, _) {
        return NavigationView(
          appBar: NavigationAppBar(
              leading: IconButton(
                  icon: const Icon(FluentIcons.back),
                  onPressed: (() => Navigator.of(context).pop()))),
          content: Column(children: [
            Row(
              children: const [QueueListWidget(), CurrentProcessWidget()],
            ),
            const FinishedListWidget(),
            const ControllBarWidget()
          ]),
        );
      },
    );
  }
}
