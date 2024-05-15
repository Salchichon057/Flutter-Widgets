import 'package:flutter/material.dart';

class MenItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon
  });
}

const AppMenuItems = <MenItem>[
  MenItem(
    title: 'Botones',
    subtitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined
  ),
  MenItem(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/card',
    icon: Icons.credit_card
  ),
];