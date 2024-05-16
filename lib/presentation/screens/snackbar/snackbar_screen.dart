import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  
  static const String routeName = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars(); // Limpiar SnackBar

    final snackBar = SnackBar(
      content: const Text('Hola Mundo!'),
      action: SnackBarAction(
        label: 'Ok!',
        onPressed: () {}
      ),
      duration: const Duration(seconds: 5),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context){
    showDialog(
      barrierDismissible: false, // No se puede cerrar con clic afuera
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Estas seguro?'),
        content: const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Cerrar')
          ),
          FilledButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Aceptar')
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar y Dialogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: const [
                    Text('Este es un dialogo de Acerca de'),
                    Text('Desarrollado por: @SrSalchicha')
                  ]
                );
              },
              child: const Text('Licencia de Uso')
            ),
            FilledButton.tonal(
              onPressed: (){
                openDialog(context);
              },
              child: const Text('Mostrar Dialogo')
            ),
          ],
        )
      ),



      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar SnackBar'),
        icon: const Icon(Icons.remove_red_eye_outlined  ),
        onPressed: () => showCustomSnackBar(context)
      )
    );
  }
}