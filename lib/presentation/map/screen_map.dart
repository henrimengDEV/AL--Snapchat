import 'package:final_flutter_project/domain/user.dart';
import 'package:final_flutter_project/persistence/store/store_cubit.dart';
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
      body: BlocBuilder<StoreCubit, StoreState>(
        builder: (_, store) => SingleChildScrollView(
          child: Column(
            children: store.user.entities
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
