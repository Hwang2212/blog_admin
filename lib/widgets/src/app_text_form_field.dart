import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputAction? textInputAction;
  final String? labelText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool isNumber;
  final bool? obscureText;
  const AppTextFormField(
      {Key? key,
      required this.textEditingController,
      this.isNumber = false,
      this.onChanged,
      this.textInputAction,
      this.validator,
      this.labelText,
      this.onTap,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return TextFormField(
      onTap: onTap,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      validator: validator,
      textInputAction: textInputAction,
      style:
          textTheme.bodyMedium?.copyWith(color: colorScheme.primaryContainer),
      decoration: InputDecoration(
        labelText: labelText,
      ),
      controller: textEditingController,
      keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
    );
  }
}
