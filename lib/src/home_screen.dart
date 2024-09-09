import 'package:clothes_app/bloc/bloc_tab/bottom_nav_bloc.dart';
import 'package:clothes_app/src/add_item_screen.dart';
import 'package:clothes_app/src/item_screen.dart';
import 'package:clothes_app/src/profile_screen.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Widget> tabs = const [
    ItemScreen(),
    AddItemScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<HomeBloc>();
        return Scaffold(
          bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return FlashyTabBar(
                onItemSelected: (index) {
                  if (state is IndexChangeState) {
                    bloc.currentIndex = index;
                    bloc.add(NavigatorBetweenScreenEvent(selectedIndex: index));
                  }
                },
                selectedIndex: bloc.currentIndex,
                items: [
                  FlashyTabBarItem(
                    icon: const Icon(
                      Iconsax.home_bold,
                      color: Color.fromARGB(255, 214, 169, 100),
                      size: 30,
                    ),
                    title: const Text('Home'),
                  ),
                  FlashyTabBarItem(
                    icon: const Icon(
                      Iconsax.card_add_bold,
                      color: Color.fromARGB(122, 18, 140, 156),
                      size: 30,
                    ),
                    title: const Text('Add'),
                  ),
                  FlashyTabBarItem(
                    icon: const Icon(
                      Iconsax.profile_2user_bold,
                      color: Colors.blueGrey,
                      size: 30,
                    ),
                    title: const Text('Profile'),
                  ),
                ],
              );
            },
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return tabs[bloc.currentIndex];
            },
          ),
        );
      }),
    );
  }
}
