import "package:flutter/material.dart";
import '../model/todo_model.dart'; 


class NotesProviders extends ChangeNotifier {
  //Notes List
 final List<Notes> _notes = [];
 List<Notes> get getNotes => _notes;

 void addNotes(String title,String descriptions)
 {
    Notes note =  Notes(title, descriptions);
   _notes.add(note);
    notifyListeners();
 }

 void updateTodo(int index, String newtitle, String newdes){
   _notes[index].title = newtitle;
   _notes[index].description = newdes;
  
   notifyListeners();
 }

 void removeNotes(int index)
 {
   _notes.removeAt(index);
   notifyListeners();
 }
}