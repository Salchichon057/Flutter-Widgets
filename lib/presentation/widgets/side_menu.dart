import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key, 
    required this.scaffoldKey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex, // Sirve para mantener el índice seleccionado en el menú
      onDestinationSelected: (value) { // Sirve para actualizar el índice seleccionado en el menú
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value]; // Sirve para obtener el ítem seleccionado
        context.push(menuItem.link); // Sirve para navegar a la pantalla seleccionada

        // Se escribe widget para acceder a las propiedades del widget padre
        widget.scaffoldKey.currentState?.closeDrawer(); // Sirve para cerrar el menú lateral
      },
      children:  [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
          child: Text(
            'Menu',
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ),

        ...appMenuItems
          .sublist(0, 3)
          .map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon),
          label: Text(item.title),
        )),
        
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
          child: Text(
            'More Options',
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ),
        
        ...appMenuItems
          .sublist(3, appMenuItems.length)
          .map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon),
          label: Text(item.title),
        )),
      ]
    );
  }
}