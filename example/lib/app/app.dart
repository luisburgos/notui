import 'package:example/app/app_bloc.dart';
import 'package:example/app/shadcn_app_wrapper.dart';
import 'package:example/l10n/l10n.dart';
import 'package:example/showcase/showcase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notui/notui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadAppWrapper(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
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
        child: const ShowcaseView(),
      ),
    );
  }
}
