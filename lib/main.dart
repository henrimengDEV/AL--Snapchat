import 'package:final_flutter_project/persistence/camera_provider.dart';
import 'package:final_flutter_project/persistence/store/user_cubit.dart';
import 'package:final_flutter_project/presentation/auth/form_birthday/screen_birthday.dart';
import 'package:final_flutter_project/presentation/auth/form_password/screen_password.dart';
import 'package:final_flutter_project/presentation/auth/form_username/screen_username.dart';
import 'package:final_flutter_project/presentation/auth/login/screen_login.dart';
import 'package:final_flutter_project/presentation/auth/sign_up/screen_sign_up.dart';
import 'package:final_flutter_project/presentation/camera/screen_camera.dart';
import 'package:final_flutter_project/presentation/chat/screen_chat.dart';
import 'package:final_flutter_project/presentation/conversation/screen_conversation.dart';
import 'package:final_flutter_project/presentation/screen_snapchat.dart';
import 'package:final_flutter_project/presentation/map/screen_map.dart';
import 'package:final_flutter_project/presentation/profile/screen_profile.dart';
import 'package:final_flutter_project/presentation/story/screen_story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CameraProvider.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          ScreenMap.routeName: (BuildContext context) => const ScreenMap(),
          ScreenChat.routeName: (BuildContext context) => const ScreenChat(),
          ScreenCamera.routeName: (BuildContext context) => const ScreenCamera(),
          ScreenStory.routeName: (BuildContext context) => const ScreenStory(),
          ScreenProfile.routeName: (BuildContext context) => const ScreenProfile(),
          ScreenLogin.routeName: (BuildContext context) => ScreenLogin(),
          ScreenSignUp.routeName: (BuildContext context) => ScreenSignUp(),
          ScreenBirthday.routeName: (BuildContext context) => ScreenBirthday(),
          ScreenUsername.routeName: (BuildContext context) => ScreenUsername(),
          ScreenPassword.routeName: (BuildContext context) => ScreenPassword(),
          ScreenMap.routeName: (BuildContext context) => const ScreenMap(),
          ScreenConversation.routeName: (BuildContext context) => const ScreenConversation(),
        },
        onGenerateRoute: (RouteSettings settings) {
          Widget screen = const ScreenSnapchat();

          switch (settings.name) {
            case ScreenMap.routeName:
              screen = const ScreenMap();
              break;
            case ScreenChat.routeName:
              screen = const ScreenChat();
              break;
            case ScreenCamera.routeName:
              screen = const ScreenCamera();
              break;
            case ScreenStory.routeName:
              screen = const ScreenStory();
              break;
            case ScreenProfile.routeName:
              screen = const ScreenProfile();
              break;
            case ScreenLogin.routeName:
              screen =  ScreenLogin();
              break;
            case ScreenSignUp.routeName:
              screen =  ScreenSignUp();
              break;
            case ScreenBirthday.routeName:
              screen =  ScreenBirthday();
              break;
            case ScreenUsername.routeName:
              screen =  ScreenUsername();
              break;
            case ScreenPassword.routeName:
              screen =  ScreenPassword();
              break;
          }

          return MaterialPageRoute(builder: (context) => screen);
        },
        theme: ThemeData(
            // bottomAppBarColor: Colors.black
            ),
      ),
    );
  }
}
