import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Todo esto es posible gracias a ti!',
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'La Calculadora de Préstamos es completamente gratis y estamos trabajando muy duro para hacer nuevas aplicaciones! Si te gusta nuestra aplicación, puedes apoyar a nuestro equipo con un poco de amor para alimentar nuestros esfuerzos! A cambio, vamos a habilitar las notificaciones sobre cuándo tienes que pagar tus préstamos y eliminaremos los anuncios!',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Image.asset(
                        'assets/dog.png',
                        height: 200,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Tus donaciones nos ayudan muchísimo\nAlimenta nuestras mascotas',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Acción para donar USD 2,99
                          },
                          child: const Text('USD 2,99'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Acción para donar USD 4,99
                          },
                          child: const Text('USD 4,99'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Acción para donar USD 6,99
                          },
                          child: const Text('USD 6,99'),
                        ),
                      ],
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Acción para restaurar compras
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.restorePurchase,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
