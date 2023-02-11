import 'package:final_flutter_project/persistence/store/store_cubit.dart';
import 'package:final_flutter_project/presentation/profile/bitmoji/screen_bitmoji.dart';
import 'package:final_flutter_project/presentation/shared/modal/friends_modal.dart';
import 'package:final_flutter_project/presentation/shared/snap_avatar.dart';
import 'package:final_flutter_project/presentation/shared/snap_shadow_button.dart';
import 'package:final_flutter_project/presentation/shared/snap_title_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({Key? key}) : super(key: key);

  @override
  State<BodyProfile> createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(235, 235, 235, 1),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              BlocBuilder<StoreCubit, StoreState>(
                builder: (context, state) {
                  return SnapAvatar(
                    avatar: state.user.currentUser.avatar!,
                    size: 100,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Henri',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SnapTitleDivider(text: 'Friends'),
              SnapShadowButton(
                onPress: () {
                  FriendsModal.showIt(context);
                },
                label: 'Add Friends',
              ),
              const SnapTitleDivider(text: 'Bitmoji'),
              SnapShadowButton(
                onPress: () => _goToScreenBitmoji(context),
                label: 'Edit my bitmoji',
                leadingIcon: Icons.edit,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _goToScreenBitmoji(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenBitmoji.routeName);
  }
}
