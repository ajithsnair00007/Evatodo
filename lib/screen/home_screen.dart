

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/todo_model.dart';
import '../provider/todo_provider.dart';
import 'add_update.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 244, 247),
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<NotesProviders>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.getNotes.length,
              itemBuilder: (context, index) {
                return CardList(
                  notes: value.getNotes[index],
                  index: index,
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
         
          showDialog(
            context: context,
            builder: (_) =>const DialogWidget(isupdate: false,),
          );
        },
        backgroundColor: const Color.fromARGB(255, 167, 253, 7),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final Notes? notes;
  final int? index;

  const CardList({
    Key? key,
     this.notes,
     this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: ElevatedButton.icon(
            label: const Text('Edit'),
            onPressed: () {
              // _isUpdate= true;
              showDialog(
                context: context,
                builder: (_) => DialogWidget(
                  notes: notes,
                  index: index, isupdate: true,
                ),
              );
            },
            icon: const Icon(
              Icons.edit_note_sharp,
              color: Color.fromARGB(255, 70, 244, 54),
            ),
          ),
          title: Text(notes!.title),
          subtitle: Text(notes!.description),
          trailing: ElevatedButton.icon(
            label: const Text('Delete'),
            onPressed: () {
              
              Provider.of<NotesProviders>(context, listen: false)
                  .removeNotes(index!);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
