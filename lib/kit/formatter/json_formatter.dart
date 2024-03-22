import 'dart:convert';

import 'package:codex/kit/kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JsonFormatter extends ConsumerStatefulWidget {
  const JsonFormatter({super.key});

  static Kit kit = Kit(
    name: 'JSON',
    route: 'json_formatter',
    description: 'Indent or minify JSON data',
    icon: Icons.data_object_outlined,
    category: KitGroup.formatter,
    builder: (context) => const JsonFormatter(),
  );

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return JsonFormatterState();
  }
}

class JsonFormatterState extends ConsumerState<JsonFormatter> {
  TextEditingController controller = TextEditingController();
  static const decoder = JsonDecoder();
  static const prettyEncoder = JsonEncoder.withIndent('  ');
  static const minifyEncoder = JsonEncoder();

  void pasteFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final text = data?.text;
    if (text == null || text.isEmpty) {
      return;
    }
    controller.text = text;
  }

  void copyToClipboard() async {
    final text = controller.text;
    if (text.isEmpty) {
      return;
    }
    await Clipboard.setData(ClipboardData(text: text));
  }

  void escape() {
    final text = controller.text;
    if (text.isEmpty) {
      return;
    }

    var escaped = text.replaceAll(r'\"', '"');
    if (escaped[0] == '"') {
      escaped = escaped.substring(1);
    }
    if (escaped.endsWith('"')) {
      escaped = escaped.substring(0, escaped.length - 1);
    }
    controller.text = escaped;
    pretty();
  }

  void pretty() {
    final text = controller.text;
    if (text.isEmpty) {
      return;
    }

    controller.text = prettyEncoder.convert(decoder.convert(text));
  }

  void minify() {
    final text = controller.text;
    if (text.isEmpty) {
      return;
    }
    controller.text = minifyEncoder.convert(decoder.convert(text));
  }

  Widget operators() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextButton.icon(
          onPressed: pasteFromClipboard,
          icon: const Icon(Icons.paste_outlined),
          label: const Text('Paste'),
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
            alignment: Alignment.centerLeft,
          ),
        ),
        const SizedBox(height: 24),
        TextButton.icon(
          onPressed: pretty,
          icon: const Icon(Icons.format_align_left_outlined),
          label: const Text('Pretty'),
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
            alignment: Alignment.centerLeft,
          ),
        ),
        const SizedBox(height: 4),
        TextButton.icon(
          onPressed: escape,
          icon: const Icon(Icons.output_outlined),
          label: const Text('Escape'),
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
            alignment: Alignment.centerLeft,
          ),
        ),
        const SizedBox(height: 4),
        TextButton.icon(
          onPressed: minify,
          icon: const Icon(Icons.vertical_align_center_outlined),
          label: const Text('Minify'),
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
            alignment: Alignment.centerLeft,
          ),
        ),
        const SizedBox(height: 24),
        TextButton.icon(
          onPressed: copyToClipboard,
          icon: const Icon(Icons.copy_outlined),
          label: const Text('Copy'),
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
            alignment: Alignment.centerLeft,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${JsonFormatter.kit.name} ${JsonFormatter.kit.category}",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 110,
                child: operators(),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: controller,
                  maxLines: double.maxFinite.toInt(),
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: 'Paste your JSON data here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      gapPadding: 2,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
