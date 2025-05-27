import 'package:flutter/material.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  //await windowManager.waitUntilReadyToShow();
  //await windowManager.setPreventClose(true);
  WindowOptions windowOptions = WindowOptions(
    size: Size(350, 250),
    center: true,
    skipTaskbar: true,
    titleBarStyle: TitleBarStyle.hidden,
    windowButtonVisibility: true,
    backgroundColor: Colors.transparent,
    alwaysOnTop: true,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Bar App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TrayListener {
  TextEditingController _controller = TextEditingController();
  String _output = "";

  @override
  void initState() {
    super.initState();
    trayManager.addListener(this);
    _initTray();
  }

  Future<void> _initTray() async {
    await trayManager.setIcon('assets/favicon.ico');
		await trayManager.setContextMenu(Menu(items: [
			MenuItem(key: 'show', label: 'Show'),
			MenuItem.separator(),
			MenuItem(key: 'exit', label: 'Exit'),
		]));
  }

  @override
  void onTrayIconRightMouseDown() {
		trayManager.popUpContextMenu();
  }

  @override
  void onTrayIconMouseDown() async {
    bool isVisible = await windowManager.isVisible();
  
    if (isVisible) {
      await windowManager.hide();
    } else {
      await windowManager.show();
      await windowManager.focus();
    }
  }

  @override
  void onWindowClose() async {
    await windowManager.hide(); 
  }

  @override
  void onTrayMenuItemClick(MenuItem menuItem) {
    switch (menuItem.key) {
      case 'show':
        windowManager.show();
        break;
      case 'exit':
        windowManager.close();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mini App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _controller),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _output = "Výstup: ${_controller.text}";
                });
              },
              child: Text("Zpracuj"),
            ),
            SizedBox(height: 20),
            Text(_output),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    trayManager.removeListener(this);
    super.dispose();
  }
}

