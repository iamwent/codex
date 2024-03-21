import 'dart:convert';

import 'package:codex/widget/codex_text_field.dart';
import 'package:flutter/material.dart';

class Base64Coder extends StatefulWidget {
  const Base64Coder({super.key});

  @override
  State createState() {
    return Base64CoderState();
  }
}

class Base64CoderState extends State<Base64Coder> {
  TextEditingController inputController = TextEditingController();
  TextEditingController outputController = TextEditingController();
  final coder = utf8.fuse(base64);

  void encode(String? decoded) {
    if (decoded == null || decoded.isEmpty) {
      outputController.clear();
      return;
    }

    outputController.text = coder.encode(decoded);
  }

  void decode(String? encoded) {
    if (encoded == null || encoded.isEmpty) {
      inputController.clear();
      return;
    }
    inputController.text = coder.decode(encoded);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Base64 Encoders / Decoders",
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
                    label: 'Text',
                    controller: inputController,
                    onChanged: encode,
                    hintText: 'Enter your raw text here',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CodexTextField(
                    label: 'Encoded',
                    controller: outputController,
                    onChanged: decode,
                    hintText: 'Enter your encoded text here',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
