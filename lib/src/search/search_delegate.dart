import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {

  String seleccion = '';

  final peliculas = [
    'Iron Man',
    'Thor',
    'Venom',
    'Joker',
    'La casa de papel',
    'Avenger: Endgame',
    'Bad Boys'
  ];

  final peliculasRecientes = [
    'SpiderMan',
    'Capitana Marvel'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro app bar, cerrar o cancelar busqueda
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      ),
      FlatButton(
        child: Text('Cancelar'),
        onPressed: (){},
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Builder que crea los resultados que vamos a mostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Text( seleccion ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe

    final listaSugerida = (query.isEmpty) 
                            ? peliculasRecientes
                            : peliculas.where( (p) => p.toLowerCase().startsWith(query.toLowerCase()) 
                            ).toList();


    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: ( context, i ) {
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaSugerida[i]),
          onTap: (){
            seleccion = listaSugerida[i];
            //construye los resultados
            showResults(context);
          },
        );
      },
    );
  }



}