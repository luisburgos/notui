import 'package:example/app/app_bloc.dart';
import 'package:example/showcase/showcase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notui/notui.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ShowcaseView extends StatelessWidget {
  const ShowcaseView({super.key});

  @override
  Widget build(BuildContext context) {
    final multiPaneController = context.watch<NotUiMultiPaneCubit>();
    final sideBarController = context.watch<NotUiSideBarCubit>();
    final appCubit = context.watch<AppCubit>();

    return Scaffold(
      body: NotUiAppShell1(
        sideBar: NotUiSideBar(
          isExpanded: sideBarController.state.isExpanded,
          headerBuilder: () => MySidebarHeader(
            isExpanded: sideBarController.state.isExpanded,
          ),
          bodyBuilder: () => MySidebarBody(
            selectedIndex: appCubit.state.selectedIndex,
            setSelectedIndex: appCubit.setSelectedIndex,
          ),
          backgroundColor: ShadTheme.of(context).colorScheme.background,
        ),
        body: NotUiMultiPane(
          isLeftPaneOpen: multiPaneController.state.isLeftPaneOpen,
          isRightPaneOpen: multiPaneController.state.isRightPaneOpen,
          borderColor: ShadTheme.of(context).colorScheme.border,
          header: MySideBarToolbar(
            title: appCubit.titleForSelectedIndex,
          ),
          body: MyMultiPaneBody(
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
