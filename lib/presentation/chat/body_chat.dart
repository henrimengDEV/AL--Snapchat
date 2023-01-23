import 'package:final_flutter_project/domain/user.dart';
import 'package:final_flutter_project/persistence/store/user_cubit.dart';
import 'package:final_flutter_project/presentation/chat/header_chat.dart';
import 'package:final_flutter_project/presentation/chat/item_chat.dart';
import 'package:final_flutter_project/presentation/shared/snap_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermoji/fluttermoji.dart';

class BodyChat extends StatelessWidget {
  const BodyChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const HeaderChat(),
            BlocBuilder<UserCubit, List<User>>(
              builder: (context, users) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: users.map((item) => ItemChat(item: item),).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
