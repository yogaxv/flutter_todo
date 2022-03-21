import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/bloc/theme/theme_cubit.dart';
import 'package:flutter_todo/widget/card_widget.dart';
import 'package:flutter_todo/widget/info_widge.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state ? ThemeData.dark() : ThemeData.light(),
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          DayNightSwitcherIcon(
              isDarkModeEnabled: context.read<ThemeCubit>().state,
              onStateChanged: (bool val) {
                if (val)
                  context.read<ThemeCubit>().useDarkTheme();
                else
                  context.read<ThemeCubit>().useLightTheme();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoWidget(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 30),
              child: Text("Categories",
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    wordSpacing: 1.2,
                  ))),
            ),
            Container(
              height: 225.0,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 160.0,
                    color: Colors.red,
                  ),
                  Container(
                    width: 160.0,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 160.0,
                    color: Colors.green,
                  ),
                  Container(
                    width: 160.0,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 160.0,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  child: Text("Today",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        wordSpacing: 1.2,
                      ))),
                ),
                Container(
                  width: 100,
                  child: Text("Week",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black.withOpacity(0.4),
                        wordSpacing: 1.2,
                      ))),
                ),
                Container(
                  width: 100,
                  child: Text("Month",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black.withOpacity(0.4),
                        wordSpacing: 1.2,
                      ))),
                ),
              ],
            )
          ],
        ),
      ),
      // body: ListView.builder(
      //   itemCount: 100,
      //   itemBuilder: (context, index) {
      //     return CardWidget();
      //   },
      // ),
    );
  }
}
