import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:os_algorithms_project/provider/excuting_page_provider.dart';

class ControllBarWidget extends StatelessWidget {
  const ControllBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ExcuteProvider provider = Provider.of<ExcuteProvider>(context);
    TextEditingController timeController = TextEditingController.fromValue(
        TextEditingValue(text: "${provider.time}"));
    return Expanded(
        child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            icon: const Icon(FluentIcons.double_chevron_left8),
            style: ButtonStyle(iconSize: ButtonState.all<double>(40)),
            onPressed: () => provider.initTime()),
        const SizedBox(
          width: 20,
        ),
        IconButton(
            style: ButtonStyle(iconSize: ButtonState.all<double>(40)),
            icon: const Icon(FluentIcons.caret_solid_left),
            onPressed: (() => provider.timeDecrease())),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 40,
          height: 35,
          child: TextBox(
            controller: timeController,
            maxLength: 4,
            maxLines: 1,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
            ],
            decoration: BoxDecoration(border: Border.all(width: 2)),
            highlightColor: Colors.white,
            initialValue: provider.time.toString(),
            onChanged: ((value) => {
                  (int.tryParse(value) == null)
                      ? 0
                      : provider.changeTime(int.parse(value))
                }),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        IconButton(
            icon: const Icon(FluentIcons.caret_solid_right),
            style: ButtonStyle(iconSize: ButtonState.all<double>(40)),
            onPressed: () => provider.timeIncrease()),
        const SizedBox(
          width: 20,
        ),
        IconButton(
            style: ButtonStyle(iconSize: ButtonState.all<double>(40)),
            icon: const Icon(FluentIcons.double_chevron_right8),
            onPressed: (() => provider.setMaxTime())),
      ],
    ));
  }
}
