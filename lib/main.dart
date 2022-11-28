import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/pages/add_pet_page.dart';
import 'package:pets/pages/edit_pet_page.dart';
import 'package:pets/pages/pet_list_page.dart';
import 'package:pets/providers/pet_provider.dart';
import 'package:provider/provider.dart';
import 'models/pets_model.dart';

void main() {
  runApp(const MyApp());
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => PetListPage(),
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => AddPetPage(),
    ),
    GoRoute(
      path: '/edit',
      builder: (context, state) => EditPetPage(
        pet: state.extra as Pet,
      ),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PetProvider()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routerConfig: router,
      ),
    );
  }
}
