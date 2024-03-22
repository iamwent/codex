import 'package:codex/kit/kit.dart';
import 'package:codex/widget/codex_text_field.dart';
import 'package:flutter/material.dart';

class UrlCoder extends StatefulWidget {
  const UrlCoder({super.key});

  static Kit kit = Kit(
    name: 'Url',
    route: 'url_coder',
    description: 'Encode or decode all the applicable characters to their corresponding URL',
    icon: Icons.link_outlined,
    category: KitGroup.coder,
    builder: (context) => const UrlCoder(),
  );

  @override
  State createState() {
    return UrlCoderState();
  }
}

class UrlCoderState extends State<UrlCoder> {
  TextEditingController inputController = TextEditingController();
  TextEditingController outputController = TextEditingController();

  void encode(String? decoded) {
    if (decoded == null || decoded.isEmpty) {
      outputController.clear();
      return;
    }

    outputController.text = Uri.encodeComponent(decoded);
  }

  void decode(String? encoded) {
    if (encoded == null || encoded.isEmpty) {
      inputController.clear();
      return;
    }
    inputController.text = Uri.decodeComponent(encoded);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${UrlCoder.kit.name} ${UrlCoder.kit.category}",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: CodexTextField(
                  label: 'Decoded',
                  controller: inputController,
                  onChanged: encode,
                  hintText: 'Enter your raw url here',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CodexTextField(
                  label: 'Encoded',
                  controller: outputController,
                  onChanged: decode,
                  hintText: 'Enter your encoded url here',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
