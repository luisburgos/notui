import 'package:example/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:notui/notui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: const _MyApp(),
    );
  }
}

class _MyApp extends StatefulWidget {
  const _MyApp({super.key});

  @override
  State<_MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final logoButton = IconButton(
      onPressed: () => setState(() {
        selectedIndex = 0;
      }),
      icon: const Icon(Icons.snapchat),
    );
    final homeButton = IconButton(
      onPressed: () => setState(() {
        selectedIndex = 0;
      }),
      icon: const Icon(Icons.home_filled),
    );
    final listButton = IconButton(
      onPressed: () => setState(() {
        selectedIndex = 1;
      }),
      icon: const Icon(Icons.list),
    );
    final profileButton = IconButton(
      onPressed: () => setState(() {
        selectedIndex = 3;
      }),
      icon: const Icon(Icons.person),
    );
    final settingsButton = IconButton(
      onPressed: () => setState(() {
        selectedIndex = 4;
      }),
      icon: const Icon(Icons.settings),
    );

    return Scaffold(
      body: NotUiAppShell1Layout(
        width: screenWidth,
        breakpoints: const NotUiBreakpoints(
          small: 600,
        ),
        sideBar: NotSidebarLayout(
          headerBuilder: () => SizedBox(
            height: 40,
            child: logoButton,
          ),
          bodyBuilder: () {
            return Column(
              children: [
                homeButton,
                listButton,
                profileButton,
              ],
            );
          },
          footerBuilder: () {
            return Column(
              children: [
                settingsButton,
              ],
            );
          },
          backgroundColor: Colors.white,
        ),
        topBar: Row(
          children: [
            logoButton,
            const Spacer(),
            profileButton,
          ],
        ),
        body: Center(
          child: Text('Selected index: $selectedIndex'),
        ),
        bottomBar: NotUiSidebarBottomBar(
          children: [
            homeButton,
            listButton,
            settingsButton,
          ],
        ),
      ),
    );
  }
}
