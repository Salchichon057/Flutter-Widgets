import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

// * Cambiamos el StatelessWidget por ConsumerWidget para poder usar Riverpod
class CounterScreen extends ConsumerWidget  { 

  static const String routeName = 'counter_screen';

  const CounterScreen({super.key});

  // ! Se agrega el ref para poder usar Riverpod
  @override
  Widget build(BuildContext context, WidgetRef ref) { 
    final int counterValue = ref.watch(counterProvider);
    // watch() es una función de Riverpod que nos permite escuchar un provider
    // ! NO SE USA EL watch() en métodos ( Como onPressed() ) 
    // y actualizar el widget cuando el valor del provider cambia

    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: (){
              ref.read(isDarkModeProvider.notifier)
                .update((isDarkMode) => !isDarkMode);
            },
          )
        ],
      ),
      body: Center(
        child: Text('Valor: $counterValue', style: const TextStyle(fontSize: 32)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          // ? Se usa ref.read() para leer el provider y ref.watch() para escucharlo
          // De esta forma podemos modificar el valor del provider
          ref.read(counterProvider.notifier).state++;

          // La otra forma de modificar el valor del provider es usando el método update()
          // ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}