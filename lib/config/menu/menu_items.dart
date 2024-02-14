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
      icon: Icons.credit_card),
  MenuItems(
      title: 'Progress Indicator',
      subtittle: 'indicador de progreso dinamico',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItems(
      title: 'Snackbar y dialogos',
      subtittle: 'indicadores en pantalla',
      link: '/snackbar',
      icon: Icons.info_outline),
  MenuItems(
      title: 'animated',
      subtittle: 'animacion en pantalla',
      link: '/animated',
      icon: Icons.move_up_outlined),
  MenuItems(
      title: 'ui-controls',
      subtittle: 'controles de pantalla',
      link: '/controls',
      icon: Icons.noise_control_off_sharp),
  MenuItems(
      title: 'tutorial',
      subtittle: 'Tutorial de la aplicacion',
      link: '/tutorial',
      icon: Icons.accessible_rounded)
];
