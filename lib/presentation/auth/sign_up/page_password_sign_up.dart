import 'package:final_flutter_project/presentation/auth/sign_up/template_form_sign_up.dart';
import 'package:final_flutter_project/presentation/shared/snap_text_field.dart';
import 'package:flutter/material.dart';

class PageCredentialSignUp extends StatelessWidget {
  static const routeName = 'screen_password';

  final TextEditingController emailController;
  final TextEditingController passwordController;

  const PageCredentialSignUp({
    Key? key,
    required this.passwordController,
    required this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateFormSignUp(
      label: "Set a password",
      child: Column(
        children: [
          SnapTextField(
            label: "Email",
            textController: emailController,
            obscure: false,
          ),
          const SizedBox(height: 25),
          SnapTextField(
            label: "Password",
            textController: passwordController,
            obscure: true,
          ),
        ],
      ),
    );
  }
}
