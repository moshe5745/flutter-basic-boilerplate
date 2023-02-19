import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tfilafinder/screens/home.dart';
import 'package:tfilafinder/screens/settings.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
        builder: (context, state, child) {
          return SafeArea(child: Scaffold(
            appBar: AppBar(title: Text(state.name ?? '#')),
            body: child,
          ));
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'Home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/settings',
            name: 'Settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ]
    )
  ],
);