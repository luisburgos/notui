import 'package:example/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notui/notui.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShadApp.material(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: ProviderScope(
        child: ShowcaseSideBar(),
      ),
    );
  }
}

class ShowcaseSideBar extends StatelessWidget {
  const ShowcaseSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NotUiSideBar(
            headerBuilder: (state, controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state.isExpanded) ...[
                    const Icon(Icons.snapchat),
                    const Spacer(),
                  ],
                  Switch(
                    value: state.isExpanded,
                    onChanged: (value) => controller.setExpanded(value),
                  ),
                ],
              );
            },
            bodyBuilder: (state, controller) {
              return Column(
                children: [
                  NotUiSideBarMenuItem(
                    data: NotUiSideBarMenuItemData(
                      id: 'home',
                      label: 'Home',
                      iconData: Icons.home,
                    ),
                    onPressed: (item) {},
                  ),
                  NotUiSideBarMenuItem(
                    data: NotUiSideBarMenuItemData(
                      id: 'profile',
                      label: 'Profile',
                      iconData: Icons.person,
                    ),
                    onPressed: (item) {},
                  ),
                ],
              );
            },
          ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          Expanded(
            child: NotUiMultiPane(
              headerBuilder: (state, controller) {
                return Row(
                  children: [
                    Flexible(
                      child: SwitchListTile(
                        title: const Text('isLeftPaneOpen'),
                        value: state.isLeftPaneOpen,
                        onChanged: controller.setLeftOpen,
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      child: SwitchListTile(
                        title: const Text('isRightPaneOpen'),
                        value: state.isRightPaneOpen,
                        onChanged: controller.setRightOpen,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
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
