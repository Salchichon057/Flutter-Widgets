import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  
  static const String routeName = 'progress_screen';
  
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Screen'),
      ),
      body: const _ProgressView()
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 50),
          Text('Circular Progress Indicator'),
          
          SizedBox(height: 10),
          CircularProgressIndicator(strokeWidth: 4, backgroundColor: Colors.grey),

          SizedBox(height: 50),
          Text('Circular y Linear Controlado'),

          SizedBox(height: 10),
          _ControllerProgressIndicator()

        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder( // Se construye en tiempo de ejecución
      stream: Stream.periodic(const Duration(milliseconds: 300), (value){
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),
       // Se detiene cuando el valor sea mayor a 1
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 2,
                backgroundColor: Colors.black12,
              ),
              const SizedBox(width: 20),
        
              // LinearProgressIndicator necesita saber cual es el espacio que tiene para llenar, sino la app se rompe
              Expanded(
                child: LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: Colors.grey,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}