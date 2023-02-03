import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_size/window_size.dart';

import 'pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('My App');
    setWindowMinSize(const Size(1000, 700));
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: "process management algorithms",
      debugShowCheckedModeBanner: false,
      color: Colors.blue,
      initialRoute: '/',
      routes: {'/': (context) => const HomePage()},
    );
  }
}
