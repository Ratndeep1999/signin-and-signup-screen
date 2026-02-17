import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_clipping_design.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/show_data_widget.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/show_password_screen_icon_widget.dart';
import '../Custom Widgets/custom_clickable_text.dart';
import '../Custom Widgets/custom_heading.dart';
import '../Custom Widgets/custom_second_heading.dart';
import '../Custom Widgets/custom_text_field_label.dart';

class ShowPasswordScreen extends StatefulWidget {
  final String email;
  final String password;

  const ShowPasswordScreen({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  State<ShowPasswordScreen> createState() => _ShowPasswordScreenState();
}

class _ShowPasswordScreenState extends State<ShowPasswordScreen> {
  late String _userEmail;
  late String _userPass;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _userEmail = widget.email;
    _userPass = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFefb744),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            /// Custom Background Design
            CustomClippingDesign(),

            Column(
              children: [
                CustomHeading(
                  bigText: "Warning!\n",
                  smallText: "Don't Share With Anyone",
                ),
                const SizedBox(height: 40),

                /// Card
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 50.0,
                    ),
                    child: Column(
                      children: [
                        /// 2nd Heading
                        CustomSecondHeading(
                          bigText: "Don't Forget Again\n",
                          smallText:
                              "Lorem ipsum dolor sit amet. consectetuer adipiscing sed\n diam nonummy nibh euismod tincidunt.",
                        ),
                        const SizedBox(height: 32.0),

                        /// Email Label
                        const CustomTextFieldLabel(
                          label: 'Email Address',
                          labelFontSize: 15.0,
                        ),
                        const SizedBox(height: 8.0),

                        /// Email Address
                        ShowDataWidget(
                          isVisible: _isVisible,
                          value: _userEmail,
                        ),
                        const SizedBox(height: 22.0),

                        /// Password Label
                        const CustomTextFieldLabel(
                          label: 'Password',
                          labelFontSize: 15.0,
                        ),
                        const SizedBox(height: 8.0),

                        /// Password
                        ShowDataWidget(isVisible: _isVisible, value: _userPass),
                        const SizedBox(height: 40.0),

                        /// Icons
                        ShowPasswordScreenIconWidget(
                          isVisible: _isVisible,
                          onPress: () =>
                              setState(() => _isVisible = !_isVisible),
                        ),

                        const SizedBox(height: 40.0),

                        /// Back To Login Button
                        CustomClickableText(
                          label: 'Back to Login',
                          onTap: () {
                            Navigator.of(
                              context,
                            ).popUntil((route) => route.isFirst);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// SnackBar Method
  void _showSnackBar({required String label}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomTextFieldLabel(label: label, labelFontSize: 15.0),
        duration: Duration(seconds: 2),
        backgroundColor: const Color(0xFFfeb64d),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 28.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
