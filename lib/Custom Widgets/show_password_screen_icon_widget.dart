import 'package:flutter/material.dart';

class ShowPasswordScreenIconWidget extends StatelessWidget {
  const ShowPasswordScreenIconWidget({
    super.key,
    required this.isVisible,
    required this.onPress,
  });

  final bool isVisible;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      /// Show / Hide
      IconButton(
        iconSize: 30,
        icon: Icon(_isVisible ? Icons.visibility_off : Icons.visibility),
        onPressed: () => setState(() => _isVisible = !_isVisible),
      ),
      const SizedBox(width: 30),

      /// Copy
      IconButton(
        icon: Icon(Icons.copy),
        onPressed: () {
          Clipboard.setData(ClipboardData(text: _userPass));
          _showSnackBar(label: "Password copied");
        },
      ),
    ],
  );
}
