import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rgc_test_apk/core/theme/color_pallets.dart';

class TextFieldWidget extends HookWidget {
  const TextFieldWidget(
      {super.key, required this.textController, this.obSecure = false});
  final TextEditingController textController;
  final bool obSecure;

  @override
  Widget build(BuildContext context) {
    final visibility = useState(obSecure);
    return TextField(
      controller: textController,
      obscureText: obSecure ? visibility.value : false,
      decoration: InputDecoration(
          suffix: obSecure
              ? InkWell(
                  onTap: () {
                    visibility.value = !visibility.value;
                  },
                  child: Icon(visibility.value
                      ? Icons.visibility
                      : Icons.visibility_off))
              : null,
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: ColorPallets.lightBlue)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: ColorPallets.borderColor,
              ))),
    );
  }
}
