import 'package:final_flutter_project/domain/user.dart';
import 'package:final_flutter_project/persistence/store/user_cubit.dart';
import 'package:final_flutter_project/presentation/shared/snap_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermoji/fluttermoji.dart';

class ScreenMap extends StatelessWidget {
  static const routeName = 'screen_map';

  const ScreenMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserCubit, List<User>>(
        builder: (_, users) => SingleChildScrollView(
          child: Column(
            children: users
                .map(
                  (user) => Expanded(
                    child: SvgPicture.string(
                      getBitmoji(user),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      bottomNavigationBar: const SnapBottomBar(routeActivated: routeName),
    );
  }

  String getBitmoji(User last) {
    if (last.avatar != null) {
      return FluttermojiFunctions().decodeFluttermojifromString(last.avatar!);
    }

    return "";
  }
}
