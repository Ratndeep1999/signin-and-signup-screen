import 'package:flutter/material.dart';

class ShowPasswordScreenIconWidget extends StatelessWidget {
  const ShowPasswordScreenIconWidget({
    super.key,
    required this.isVisible,
    required this.onPress,
    required this.onCopyPress,
  });

  final bool isVisible;
  final VoidCallback onPress;
  final VoidCallback onCopyPress;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      /// Show / Hide
      IconButton(
        iconSize: 30,
        icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
        onPressed: onPress,
      ),
      const SizedBox(width: 30),

      /// Copy
      IconButton(
        icon: Icon(Icons.copy),
        onPressed: onCopyPress,
      ),
    ],
  );
}
