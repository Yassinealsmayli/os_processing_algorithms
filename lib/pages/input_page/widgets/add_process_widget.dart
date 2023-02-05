// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:os_algorithms_project/provider/input_page_provider.dart';
import 'package:provider/provider.dart';

import '../../../global.dart';

// ignore: must_be_immutable
class AddProcessWidget extends StatefulWidget {
  int algorithm;

  AddProcessWidget({
    Key? key,
    required this.algorithm,
  }) : super(key: key);

  @override
  State<AddProcessWidget> createState() => _AddProcessWidgetState();
}

class _AddProcessWidgetState extends State<AddProcessWidget> {
  TextEditingController name = TextEditingController();
  TextEditingController at = TextEditingController();
  TextEditingController bt = TextEditingController();
  TextEditingController prio = TextEditingController();
  TextEditingController qIndex = TextEditingController();

  @override
  Widget build(BuildContext context) {
    InputPageProvider provider = Provider.of<InputPageProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Add processe:",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 70,
          height: 30,
          child: TextBox(
            controller: at,
            maxLength: 3,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
            ],
            outsidePrefix: const Text("A.T:"),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 70,
          height: 30,
          child: TextBox(
            controller: bt,
            maxLength: 3,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
            ],
            outsidePrefix: const Text("B.T:"),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        if (widget.algorithm == 4)
          SizedBox(
            width: 100,
            height: 30,
            child: TextBox(
              controller: prio,
              maxLength: 3,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              outsidePrefix: const Text("Priority:"),
              keyboardType: TextInputType.number,
            ),
          ),
        if (widget.algorithm == 5)
          SizedBox(
            width: 120,
            height: 30,
            child: TextBox(
              controller: qIndex,
              maxLength: 1,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              outsidePrefix: const Text("Queue Index:"),
              keyboardType: TextInputType.number,
            ),
          ),
        const Expanded(
            child: SizedBox(
          width: 1,
        )),
        Button(
            style: ButtonStyle(
                backgroundColor: ButtonState.all<Color>(Colors.blue)),
            onPressed: () {
              provider.addProcess(
                  Process(
                      (at.text.isEmpty) ? -2 : int.parse(at.text),
                      (bt.text.isEmpty) ? -2 : int.parse(bt.text),
                      (widget.algorithm == 4) ? int.parse(prio.text) : -1,
                      qIndex: (int.tryParse(qIndex.text) == null)
                          ? 1
                          : int.parse(qIndex.text),
                      id: -1),
                  widget.algorithm);
            },
            child: const Text("add", style: TextStyle(color: Colors.white)))
      ],
    );
  }
}
