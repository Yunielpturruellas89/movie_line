import 'package:flutter/material.dart';
import 'package:movie_line/src/class/hymn.dart';

class DetalleHimnoScreen extends StatelessWidget {
  final Hymn himno;

  const DetalleHimnoScreen({super.key, required this.himno});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${himno.number} - ${himno.name}'),
      ),
      backgroundColor: const Color.fromARGB(255, 236, 234, 234),
      body: Column(
        children: [
          // Texto para mostrar la cita bíblica
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Cita bíblica: ${himno.biblicalQuote}', // Añadir la propiedad biblicalQuote a Hymn
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic, // Estilos para la cita bíblica
                    color: Color.fromARGB(255, 156, 154, 154)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: himno.verses.length,
              itemBuilder: (context, index) {
                final verse = himno.verses[index];
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (verse.type == 'Chorus')
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: [
                              Text(
                                "Coro:",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (verse.type != 'Chorus')
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Alinea las líneas al inicio
                            children: [
                              // Número del verso
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                    index == 0 ? '${index + 1}. ' : '$index. ',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),
                              ),
                              Expanded(
                                // Ocupa el espacio restante
                                child: Column(
                                  // Muestra las líneas en columna
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (final line in verse.text)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 16.0,
                                            bottom:
                                                4.0), // Espacio antes de la línea
                                        child: Text(
                                          line,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (final line in verse.text)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 26.0, right: 4.0, bottom: 4.0),
                                  child: Text(
                                    line,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ]);
              },
            ),
          )
        ],
      ),
    );
  }
}
