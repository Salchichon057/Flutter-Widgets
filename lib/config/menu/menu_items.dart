import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subtitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined
  ),
  MenuItem(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card
  ),
  MenuItem(
    title: 'Progress Indicators',
    subtitle: 'Generales y Controlados',
    link: '/progress',
    icon: Icons.refresh_rounded
  ),
  MenuItem(
    title: 'Snackbars y Dialogos',
    subtitle: 'Indicadores de estado en pantalla',
    link: '/snackbars',
    icon: Icons.info_outline_rounded
  ),
  MenuItem(
    title: 'Animated Container',
    subtitle: 'Stateful Widget Animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_rounded
  ),
  MenuItem(
    title: 'Controles de UI',
    subtitle: 'Controles de usuario en Flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined
  ),
  MenuItem(
    title: 'Introducción a la App',
    subtitle: 'Pequeño tutorial de la app',
    link: '/app-tutorial',
    icon: Icons.accessible_rounded
  ),
];