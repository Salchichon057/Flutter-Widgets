import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: const _HomeView());
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTitle(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  final MenuItem menuItem;

  const _CustomListTitle({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    final  colors = Theme.of(context).colorScheme; // Sirve para obtener los colores del tema actual

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_outlined, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      onTap: () {
        // Navigator.pushNamed(context, menuItem.link);
        // Existen varias formas de navegar entre pantallas, en este caso se usa la forma de GoRouter
        // .push() es un método de GoRouter que permite navegar a una nueva pantalla
        // .pushNamed() es un método que usa el nombre de la ruta para navegar a una nueva pantalla
        // .replace() es un método que reemplaza la pantalla actual por una nueva

        context.push(menuItem.link);
        // context.pushNamed(CardsScreen.routeName);
      }
    );
  }
}
