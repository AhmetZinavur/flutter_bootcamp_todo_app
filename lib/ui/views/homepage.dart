import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_todo_app/data/entity/todo.dart';
import 'package:flutter_bootcamp_todo_app/ui/views/detailpage.dart';
import 'package:flutter_bootcamp_todo_app/ui/views/recordpage.dart';

import '../cubit/homepagecubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching ?
        TextField(
          decoration: const InputDecoration(hintText: "Ara"),
          onChanged: (result){
            context.read<HomePageCubit>().search(result);
          },
        ) :
        const Text("To DO's"),
        actions: [
          isSearching ?
          IconButton(onPressed: (){
            setState(() {
              isSearching = false;
            });
            context.read<HomePageCubit>().read();
          }, icon: const Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() {
              isSearching = true;
            });
          }, icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<HomePageCubit, List<ToDo>>(
        builder: (context, state) {
          if(state.isNotEmpty) {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                var todo = state[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(todo: todo,)))
                    .then((value) {
                      context.read<HomePageCubit>().read();
                    });
                  },
                  child: Card(
                    child: SizedBox(height: 100,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(todo.text,style: const TextStyle(fontSize: 20),),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("${todo.text} silinsin mi?"),
                                  action: SnackBarAction(label: "Evet", onPressed: () {
                                    context.read<HomePageCubit>().delete(todo.id);
                                  },),
                              )
                            );
                          }, icon: const Icon(Icons.clear, color: Colors.black54,))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RecordPage()))
              .then((value) {
            context.read<HomePageCubit>().read();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}