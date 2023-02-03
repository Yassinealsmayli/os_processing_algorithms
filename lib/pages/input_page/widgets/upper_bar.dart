// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:os_algorithms_project/provider/input_page_provider.dart';

class UpperBar extends StatefulWidget {
  int index;

  UpperBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<UpperBar> createState() => _UpperBarState();
}

class _UpperBarState extends State<UpperBar> {
  @override
  Widget build(BuildContext context) {
    TextEditingController rrController = TextEditingController();
    InputPageProvider provider = Provider.of<InputPageProvider>(context);
    List<Widget> list = [];
    list.add(const Text(
      "Choose Algorithm for each queue:",
      textAlign: TextAlign.start,
    ));
    for (var e in provider.mlqQueue()) {
      list.add(Row(
        children: [
          Text("queue $e:"),
          DropDownButton(
            title: Text((provider.mlqMap[e] == null)
                ? "-"
                : algorithmPicked(provider.mlqMap[e]!)),
            items: [
              MenuFlyoutItem(
                  text: const Text("FCFS"),
                  onPressed: () {
                    provider.mlqMap[e] = 0;
                    setState(() {
                      
                    });
                  }),
              MenuFlyoutItem(
                  text: const Text("SJF"),
                  onPressed: () {
                    provider.mlqMap[e] = 1;
                    setState(() {
                      
                    });
                  }),
              MenuFlyoutItem(
                  text: const Text("SRTF"),
                  onPressed: () {
                    provider.mlqMap[e] = 2;
                    setState(() {
                      
                    });
                  }),
            ],
          )
        ],
      ));
    }
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: (widget.index == 3)
            ? [
                Row(
                  children: [
                    const Text("Quantum Time: "),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: TextBox(
                        onChanged: ((value) {
                          provider.queueTime = (int.tryParse(value) != null)
                              ? int.parse(value)
                              : 1;
                        }),
                        controller: rrController,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                      ),
                    )
                  ],
                )
              ]
            : list);
  }

  String algorithmPicked(int i) {
    String s = "";
    switch (i) {
      case 0:
        s = "FCFS";
        break;
      case 1:
        s = "SJF";
        break;
      case 2:
        s = "SRTF";
        break;
      default:
        s = "-";
    }
    return s;
  }
}
