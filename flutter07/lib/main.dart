import 'package:flutter/material.dart';
import 'package:flutter07/database.dart';
import 'package:flutter07/model/filme_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<Filme> filmes = Database.getFilmes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 218, 199, 215),
        appBar: AppBar(
          title: Text("CineFlutter"),
          backgroundColor: const Color.fromARGB(255, 235, 200, 236),
        ),

        body: 
        ListView.builder(
          itemCount: filmes.length,
          itemBuilder: (context, index) {
            final filme = filmes[index];

            return Card( 
              margin: EdgeInsets.all(6.0),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
                ),
              color: const Color.fromARGB(255, 218, 210, 215),
              elevation: 6.0, 
              child: ListTile(
              leading: Icon(Icons.movie, color: const Color.fromARGB(255, 0, 86, 136)),
              title: Text(filme.titulo),
              subtitle: Text('Ano: ${filme.anoLancamento}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (filme.imdb >= 8.5)
                    Icon(Icons.star, color: const Color.fromARGB(255, 255, 191, 0), size: 18)
                  else
                    Icon(
                      Icons.star,
                      color: const Color.fromARGB(255, 145, 145, 145),
                      size: 18,
                    ),
                  Text(filme.imdb.toString()),
                ],
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Clicou em: ${filme.titulo}"),
                    duration: Duration(seconds: 1),
                  )
                );
              },
              onLongPress: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Segurou em: ${filme.titulo}"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
            );
          },
        ),
      ),
    );
  }
}

// https://www.kge.eti.br/profkge/sendproject/