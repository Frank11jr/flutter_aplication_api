import 'package:flutter/material.dart';
import 'package:flutter_application_api/providers/provider_comment.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Comentarios extends StatefulWidget {
  const Comentarios({super.key});

  @override
  State<Comentarios> createState() => _ComentariosState();
}

class _ComentariosState extends State<Comentarios> {

  List<Comments> commentsDisplayList=[];
  Future<List<Comments>> getComments() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode==200) {
      for(Map i in data) {
        Comments comments = Comments(name: i['name'], email: i['email'], id: i['id']);
        commentsDisplayList.add(comments);
      }
      return commentsDisplayList;
    } else {
      return commentsDisplayList;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Comentarios'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(child: FutureBuilder(
            future: getComments(),
            builder: (context, AsyncSnapshot<List<Comments>> snapshot){
              return ListView.builder(
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          title: Text('Num: ${snapshot.data![index].id}', 
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          subtitle: Text('Nombre: ${snapshot.data![index].name}',
                          style: const TextStyle(fontSize: 15),),
                          trailing: Text('Email: ${snapshot.data![index].email}',
                          style: const TextStyle(fontSize: 10),),
                        ),
                      ),
                    ),
                  );
                },
              );
            }))
        ],
      ),
    );
  }
}