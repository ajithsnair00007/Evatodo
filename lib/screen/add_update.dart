import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/todo_model.dart';
import '../provider/todo_provider.dart';


class DialogWidget extends StatefulWidget {
  final Notes? notes;
  final int? index;
  
  final bool isupdate;
  const DialogWidget({Key? key, this.notes, this.index, required this.isupdate}) : super(key: key);
  
  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();
  @override
  void initState() {
    if(widget.isupdate ){
       title.text = widget.notes!.title;
       description.text =  widget.notes!.description;
    }
    super.initState();
    
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesProviders>(context, listen: false);

    return AlertDialog(
      title: Text(widget.isupdate == false ? 'Add Todo' : 'Edit Todo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: title,
            decoration: const InputDecoration(
              hintText: 'Enter Title',
            ),
          ),
          TextField(
            controller: description,
            decoration: const InputDecoration(
              hintText: 'Enter Description',
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
             String title1 = title.text;
             String description1 = description.text;

            if (widget.notes == null) {
              // Add todo
              provider.addNotes(title1, description1);
            } else {
              // Update todo
              provider.updateTodo(widget.index!, title1, description1);
            }

            Navigator.of(context).pop();
          },
          child: Text(widget.isupdate == false ? 'Add' : 'Update'),
        ),
      ],
    );
  }
}

