import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:provider/provider.dart';

import 'app/widgets/drawer/app_drawer_state.dart';
import 'app/widgets/scaffold_with_drawer.dart';
import 'app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterCleanArchitecture.debugModeOn();
    return ChangeNotifierProvider<AppDrawerState>(
      create: (context) => AppDrawerState(),
      child: MaterialApp(
        title: 'Flutter Case Study',
        theme: myTheme,
        // home: IntroRouter().scene
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithDrawer(title: "Flutter Case Study", body: buildBody());
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(children: [
            Text(
              'A Flutter Clean Architecture Case Study\n\nwith Providers\nfor simple state management\n' +
                  'such as the Drawer selected page (bold)\n\n' +
                  'Check the Categories page\nfor a full Clean Architecture\nRound Trip of\n\n' +
                  'Domain:\nUseCases,\nRepositories\nEntities and so on!\n\n\n' +
                  'Note: Data are local\nthe loader emulates a network call\n(fetching Categories)\n\n\n' +
                  'PS: The App is Responsive ;)\n\nYou can use it both\nin Portrait and\nLandscape modes!',
              textAlign: TextAlign.center,
              style: TextStyle(),
            ),
          ]),
        ),
      ),
    );
  }
}
