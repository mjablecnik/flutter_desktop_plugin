import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:flutter_desktop_plugin/utils.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final TextEditingController _controller = TextEditingController();
  String _output = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      final clipboardData = await Clipboard.getData('text/plain');
      if (clipboardData != null && clipboardData.text != null) {
        setState(() => _controller.text = clipboardData.text!);
        convert();
      }
    }
  }

  void convert() {
    setState(() => _output = Utils.keyboardFromUsToCz(_controller.text));
    Clipboard.setData(ClipboardData(text: _output));
  }

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              MacosTextField(controller: _controller),
              PushButton(
                controlSize: ControlSize.regular,
                onPressed: convert,
                child: const Text('US to CZ'),
              ),
              SelectableText(_output, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
