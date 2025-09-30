import 'package:flutter/material.dart';

import 'Custom Widgets/customClippingDesign.dart';

class SignupFirstScreen extends StatelessWidget {
  const SignupFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: AppBar(backgroundColor: Colors.orange.shade300),

      /// Body
      body: SafeArea(
        child: Stack(
          children: [
            /// Background Custom Design
            const CustomClippingDesign(),

            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

              ],
            )
          ],
        ),
      ),
    );
  }
}
