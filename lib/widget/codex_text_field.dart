import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodexTextField extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  final String label;
  final String? hintText;
  final bool? pastable;
  final bool? copyable;
  final bool? readOnly;

  const CodexTextField({
    super.key,
    this.controller,
    this.onChanged,
    required this.label,
    this.hintText,
    this.pastable,
    this.copyable,
    this.readOnly,
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
    final pastable = widget.pastable ?? true;
    final copyable = widget.copyable ?? true;
    final readOnly = widget.readOnly ?? false;
    return Column(
      children: [
        Row(
          children: [
            Text(widget.label),
            const Spacer(),
            if (pastable)
              TextButton.icon(
                onPressed: pasteFromClipboard,
                icon: const Icon(Icons.paste_outlined),
                label: const Text('Paste'),
              ),
            if (copyable)
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
            readOnly: readOnly,
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
