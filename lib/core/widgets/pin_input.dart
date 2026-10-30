import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// The 4-digit PIN entry used on both Connexion and Inscription.
/// Auto-advances focus as each digit is typed; exposes the full
/// code via [onCompleted] once all 4 boxes are filled.
class PinInput extends StatefulWidget {
  const PinInput({super.key, required this.onChanged, this.onCompleted, this.length = 4});

  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onCompleted;
  final int length;

  @override
  State<PinInput> createState() => _PinInputState();
}

class _PinInputState extends State<PinInput> {
  late final List<TextEditingController> _controllers =
      List.generate(widget.length, (_) => TextEditingController());
  late final List<FocusNode> _nodes = List.generate(widget.length, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final n in _nodes) {
      n.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.isNotEmpty && index < widget.length - 1) {
      _nodes[index + 1].requestFocus();
    }
    final code = _controllers.map((c) => c.text).join();
    widget.onChanged(code);
    if (code.length == widget.length) {
      widget.onCompleted?.call(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (i) {
        return Padding(
          padding: EdgeInsets.only(right: i == widget.length - 1 ? 0 : 12),
          child: SizedBox(
            width: 52,
            height: 56,
            child: TextField(
              controller: _controllers[i],
              focusNode: _nodes[i],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              obscureText: true,
              obscuringCharacter: '•',
              maxLength: 1,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontFamily: null,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(counterText: ''),
              onChanged: (v) => _onChanged(i, v),
            ),
          ),
        );
      }),
    );
  }
}
