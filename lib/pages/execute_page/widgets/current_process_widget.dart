import 'package:fluent_ui/fluent_ui.dart';
import 'package:os_algorithms_project/provider/executing_page_provider.dart';
import 'package:provider/provider.dart';

class CurrentProcessWidget extends StatelessWidget {
  const CurrentProcessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      width: 30,
      height: 400,
      //For the current executable process
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50,
                ),
                Icon(
                  FluentIcons.caret_right_solid8,
                  size: 50,
                ),
              ],
            ),
            const SizedBox(
              width: 50,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "CPU:",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 100,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all(width: 2)),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: Center(
                      child: Text(
                        (Provider.of<ExecuteProvider>(context)
                                    .currentProcess
                                    .AT !=
                                -1)
                            ? "p${Provider.of<ExecuteProvider>(context).currentProcess.id}"
                            : "",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
