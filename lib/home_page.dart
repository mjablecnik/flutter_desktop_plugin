import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  String _output = "";

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MacosTextField(controller: _controller, placeholder: 'Zadejte text'),
              const SizedBox(height: 16),
              PushButton(
                controlSize: ControlSize.regular,
                child: const Text('Zobrazit'),
                onPressed: () {
                  setState(() {
                    _output = _controller.text;
                  });
                },
              ),
              const SizedBox(height: 16),
              Text(_output, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
