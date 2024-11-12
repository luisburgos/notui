import 'package:example/app/view/multi_pane_body_example.dart';
import 'package:example/app/view/sidebar_body_example.dart';
import 'package:example/app/view/sidebar_header_example.dart';
import 'package:example/app/view/sidebar_toolbar_example.dart';
import 'package:example/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notui/notui.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.material(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => NotUiSideBarController(initialIsExpanded: false),
          ),
          BlocProvider(
            create: (_) => NotUiMultiPaneController(),
          ),
        ],
        child: const ShowcaseSideBar(),
      ),
    );
  }
}

class ShowcaseSideBar extends StatelessWidget {
  const ShowcaseSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final multiPaneController = context.watch<NotUiMultiPaneController>();
    final sideBarController = context.watch<NotUiSideBarController>();

    return Scaffold(
      body: Row(
        children: [
          NotUiSidebarLayout(
            isExpanded: sideBarController.state.isExpanded,
            headerBuilder: () => SidebarHeaderExample(
              isExpanded: sideBarController.state.isExpanded,
            ),
            bodyBuilder: () => const SidebarBodyExample(),
            backgroundColor: ShadTheme.of(context).colorScheme.background,
          ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          Expanded(
            child: NotUiMultiPaneLayout(
              isLeftPaneOpen: multiPaneController.state.isLeftPaneOpen,
              isRightPaneOpen: multiPaneController.state.isRightPaneOpen,
              borderColor: ShadTheme.of(context).colorScheme.border,
              header: const SideBarToolbarExample(),
              body: MultiPaneBodyExample(
                isLeftPaneOpen: multiPaneController.state.isLeftPaneOpen,
                isRightPaneOpen: multiPaneController.state.isRightPaneOpen,
                setLeftOpen: (value) => multiPaneController.setLeftOpen(
                  isOpen: value,
                ),
                setRightOpen: (value) => multiPaneController.setRightOpen(
                  isOpen: value,
                ),
                isSidebarOpen: sideBarController.state.isExpanded,
                toggleSidebar: (value) => sideBarController.setExpanded(
                  isExpanded: value,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MyApp extends StatefulWidget {
  const _MyApp();

  @override
  State<_MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final logoButton = IconButton(
      //color: selectedIndex == 0 ? Colors.red : null,
      onPressed: () => setState(() {
        selectedIndex = 0;
      }),
      icon: const Icon(Icons.snapchat),
    );
    final homeButton = IconButton(
      color: selectedIndex == 0 ? Colors.red : null,
      onPressed: () => setState(() {
        selectedIndex = 0;
      }),
      icon: const Icon(Icons.home_filled),
    );
    final listButton = IconButton(
      color: selectedIndex == 1 ? Colors.red : null,
      onPressed: () => setState(() {
        selectedIndex = 1;
      }),
      icon: const Icon(Icons.list),
    );
    final profileButton = IconButton(
      color: selectedIndex == 2 ? Colors.red : null,
      onPressed: () => setState(() {
        selectedIndex = 2;
      }),
      icon: const Icon(Icons.person),
    );
    final settingsButton = IconButton(
      color: selectedIndex == 3 ? Colors.red : null,
      onPressed: () => setState(() {
        selectedIndex = 3;
      }),
      icon: const Icon(Icons.settings),
    );
    final backgroundColor = ShadTheme.of(context).colorScheme.background;

    return Scaffold(
      body: NotUiAppShell1Layout(
        width: screenWidth,
        breakpoints: const NotUiBreakpoints(
          small: 600,
        ),
        sideBar: NotUiSidebarLayout(
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
          backgroundColor: backgroundColor,
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
          backgroundColor: backgroundColor,
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
