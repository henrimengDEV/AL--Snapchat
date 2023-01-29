import 'package:final_flutter_project/persistence/camera_provider.dart';
import 'package:final_flutter_project/persistence/store/friend_cubit.dart';
import 'package:final_flutter_project/persistence/store/store_cubit.dart';
import 'package:final_flutter_project/persistence/store/user_cubit.dart';
import 'package:final_flutter_project/persistence/store/user_cubit.dart';
import 'package:final_flutter_project/presentation/camera/screen_camera.dart';
import 'package:final_flutter_project/presentation/chat/screen_chat.dart';
import 'package:final_flutter_project/presentation/map/screen_map.dart';
import 'package:final_flutter_project/presentation/page_not_found.dart';
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
      create: (_) => StoreCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          ScreenMap.routeName: (BuildContext context) => const ScreenMap(),
          ScreenChat.routeName: (BuildContext context) => const ScreenChat(),
          ScreenCamera.routeName: (BuildContext context) =>
              const ScreenCamera(),
          ScreenStory.routeName: (BuildContext context) => const ScreenStory(),
          ScreenProfile.routeName: (BuildContext context) =>
              const ScreenProfile(),
        },
        onGenerateRoute: (RouteSettings settings) {
          Widget screen = const PageNotFound();

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
