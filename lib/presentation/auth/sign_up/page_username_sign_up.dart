import 'package:final_flutter_project/presentation/auth/sign_up/template_form_sign_up.dart';
import 'package:final_flutter_project/presentation/shared/snap_text_field.dart';
import 'package:flutter/material.dart';

class PageUsernameSignUp extends StatelessWidget {
  static const routeName = 'screen_username';
  final TextEditingController usernameController;
  final Function(String username) onUsernameChange;

  const PageUsernameSignUp({
    Key? key,
    required this.usernameController,
    required this.onUsernameChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateFormSignUp(
      label: "Your Username",
      child: SnapTextField(
        label: "Username",
        textController: usernameController,
        obscure: false,
        onChange: onUsernameChange,
      ),
    );
  }
}
