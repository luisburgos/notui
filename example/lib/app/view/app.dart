import 'package:example/app/view/app_bloc.dart';
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
    const colorSchemeName = 'blue';
    return ShadApp.material(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: ShadColorScheme.fromName(
          colorSchemeName,
          brightness: Brightness.dark,
        ),
      ),
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: ShadColorScheme.fromName(
          colorSchemeName,
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => NotUiSideBarCubit(initialIsExpanded: false),
          ),
          BlocProvider(
            create: (_) => NotUiMultiPaneCubit(),
          ),
          BlocProvider(
            create: (_) => AppCubit(),
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
    final multiPaneController = context.watch<NotUiMultiPaneCubit>();
    final sideBarController = context.watch<NotUiSideBarCubit>();
    final appCubit = context.watch<AppCubit>();

    return Scaffold(
      body: NotUiAppShell1(
        sideBar: NotUiSideBar(
          isExpanded: sideBarController.state.isExpanded,
          headerBuilder: () => SidebarHeaderExample(
            isExpanded: sideBarController.state.isExpanded,
          ),
          bodyBuilder: () => SidebarBodyExample(
            selectedIndex: appCubit.state.selectedIndex,
            setSelectedIndex: appCubit.setSelectedIndex,
          ),
          backgroundColor: ShadTheme.of(context).colorScheme.background,
        ),
        body: NotUiMultiPane(
          isLeftPaneOpen: multiPaneController.state.isLeftPaneOpen,
          isRightPaneOpen: multiPaneController.state.isRightPaneOpen,
          borderColor: ShadTheme.of(context).colorScheme.border,
          header: SideBarToolbarExample(
            title: appCubit.titleForSelectedIndex,
          ),
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
    );
  }
}
