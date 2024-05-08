import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memiz_bk/routes/app_routes.dart';
import 'package:memiz_bk/themes/app_theme_data.dart';
import 'package:memiz_bk/ui/bloc/user_bloc/user_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('uk')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      // assetLoader: const CodegenLoader(),
      child: BlocProvider(
        create: (context) => UserBloc()..add(CallLatestUserEvent()),
        child: const MemizBook(),
      ),
    ),
  );
}

class MemizBook extends StatelessWidget {
  const MemizBook({
    super.key,
  });

  static final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.generateRoute,
      theme: AppThemeData.mainTheme,
    );
  }
}
