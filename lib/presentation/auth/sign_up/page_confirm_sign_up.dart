import 'package:final_flutter_project/presentation/auth/sign_up/template_form_sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';

class PageConfirmSignUp extends StatelessWidget {
  final String username;
  final void Function() cancelForm;
  final void Function() validForm;

  const PageConfirmSignUp({
    Key? key,
    required this.username,
    required this.cancelForm,
    required this.validForm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateFormSignUp(
      label: "Do you like your profile ?",
      child: Column(
        children: [
          const SizedBox(height: 50),
          FluttermojiCircleAvatar(),
          const SizedBox(height: 25),
          Text(
            username,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 50),
          Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: cancelForm,
                  icon: const Icon(
                    CupertinoIcons.delete,
                    size: 30,
                  ),
                  splashColor: Colors.red,
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: validForm,
                  icon: const Icon(
                    CupertinoIcons.check_mark_circled,
                    color: Colors.green,
                    size: 30,
                  ),
                  splashColor: Colors.lightGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
