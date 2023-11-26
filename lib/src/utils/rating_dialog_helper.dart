// rating_dialog_helper.dart
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class RatingDialogHelper {
  static void showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return RatingDialog(
          title: Text('Califica Nuestra Aplicación'),
          message: Text(
              'Tómate un momento para valorar la aplicación. Agradecemos tus comentarios.'),
          image: const Icon(Icons.star, size: 100, color: Colors.blue),
          submitButtonText: 'Enviar',
          onCancelled: () => print('Cancelado'),
          onSubmitted: (response) {
            // Manejo de la respuesta del usuario
            print(
                'Rating: ${response.rating}, Comentario: ${response.comment}');
          },
        );
      },
    );
  }
}
