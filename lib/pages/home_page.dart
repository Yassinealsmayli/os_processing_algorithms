import 'package:fluent_ui/fluent_ui.dart';

import 'input_page/input_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Welcome,\n press start to continue.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 70),
                ),
                const SizedBox(
                  height: 10,
                ),
                Button(
                    onPressed: () => onPressed(context),

                    // ignore: sort_child_properties_last
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Start",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: ButtonState.all<Color>(Colors.blue))),
                const SizedBox(height: 100),
                const Text(
                  "/*Hi,this project was created by the CS student 'Yassine alsmayli',\n thanks for using my project i hope you enjoy.*/",
                  style: TextStyle(color: Color.fromARGB(255, 163, 162, 162)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void onPressed(BuildContext context) {
    Navigator.of(context)
        .push(FluentPageRoute(builder: ((context) => const InputPage())));
    return;
  }
}
