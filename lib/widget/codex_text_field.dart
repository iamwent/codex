import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodexTextField extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  final String label;
  final String? hintText;

  const CodexTextField({
    super.key,
    this.controller,
    this.onChanged,
    required this.label,
    this.hintText,
  });

  @override
  State<StatefulWidget> createState() {
    return CodexTextFieldState();
  }
}

class CodexTextFieldState extends State<CodexTextField> {
  void pasteFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final text = data?.text;
    if (text == null || text.isEmpty) {
      return;
    }
    widget.controller?.text = text;
    widget.onChanged?.call(text);
  }

  void copyToClipboard() async {
    final text = widget.controller?.text;
    if (text == null || text.isEmpty) {
      return;
    }
    await Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(widget.label),
            const Spacer(),
            TextButton.icon(
              onPressed: pasteFromClipboard,
              icon: const Icon(Icons.paste_outlined),
              label: const Text('Paste'),
            ),
            IconButton(
              onPressed: copyToClipboard,
              icon: const Icon(Icons.copy_outlined),
            ),
          ],
        ),
        Expanded(
          child: TextField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            maxLines: double.maxFinite.toInt(),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gapPadding: 2,
              ),
            ),
          ),
        )
      ],
    );
  }
}
