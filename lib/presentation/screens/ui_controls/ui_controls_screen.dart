import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String routeName = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controles de UI'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportations { car, plane, boat, subway, bike }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloperMode = true;
  Transportations selectedTransportation = Transportations.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode',
              style: TextStyle(fontWeight: FontWeight.w600)),
          subtitle: const Text('Activar modo desarrollador'),
          value: isDeveloperMode,
          onChanged: (value) {
            setState(() {
              isDeveloperMode = !isDeveloperMode;
            });
          },
        ),

        // Si queremos capturar el valor de un RadioListTile, solo  necesitamos tomar en este
        // caso el valor de selectedTransportation

        ExpansionTile( // ExpansionTile es un widget que permite expandir un contenido oculto
          title: const Text('Vehículos de transporte'),
          subtitle: Text(selectedTransportation.toString().split('.').last.toUpperCase()),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar en coche'),
              value: Transportations.car,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportations.car;
                });
              },
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar en avión'),
              value: Transportations.plane,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportations.plane;
                });
              },
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar en barco'),
              value: Transportations.boat,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportations.boat;
                });
              },
            ),
            RadioListTile(
              title: const Text('By Subway'),
              subtitle: const Text('Viajar en metro'),
              value: Transportations.subway,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportations.subway;
                });
              },
            ),
            RadioListTile(
              title: const Text('By Bike'),
              subtitle: const Text('Viajar en bicicleta'),
              value: Transportations.bike,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportations.bike;
                });
              },
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text('¿Quieres Desayunar?'),
          value: wantsBreakfast,
          onChanged: (value) {
            setState(() {
              wantsBreakfast = !wantsBreakfast;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('¿Quieres Almorzar?'),
          value: wantsLunch,
          onChanged: (value) {
            setState(() {
              wantsLunch = !wantsLunch;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('¿Quieres Cenar?'),
          value: wantsDinner,
          onChanged: (value) {
            setState(() {
              wantsDinner = !wantsDinner;
            });
          },
        ),
      ],
    );
  }
}
