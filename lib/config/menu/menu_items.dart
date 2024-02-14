import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subtittle;
  final String link;
  final IconData icon;

  const MenuItems(
      {required this.title,
      required this.subtittle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItems>[
  MenuItems(
      title: 'Botones',
      subtittle: 'varios Botones',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItems(
      title: 'Tarjetas',
      subtittle: 'Contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card)
];
