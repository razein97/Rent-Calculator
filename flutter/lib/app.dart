import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_calculator/providers/building_provider.dart';
import 'package:rent_calculator/providers/tenants_provider.dart';
import 'package:rent_calculator/providers/theme_provider.dart';
import 'package:rent_calculator/routing/router.gr.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BuildingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TenantProvider(),
        ),
      ],
      child: const MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatefulWidget {
  const MaterialAppWithTheme({super.key});

  @override
  State<MaterialAppWithTheme> createState() => _MaterialAppWithThemeState();
}

class _MaterialAppWithThemeState extends State<MaterialAppWithTheme> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    Provider.of<ThemeDataProvider>(context, listen: false)
        .getCurrentThemeSystem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeDataProvider>(context);

    return MaterialApp.router(
      title: 'Rent Calculator',
      theme: theme.getTheme(),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
