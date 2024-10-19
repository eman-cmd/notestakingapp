import 'package:flutter/material.dart';

void main() => runApp(NoteTakingApp());

class NoteTakingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note Taking App',
      theme: ThemeData(
        primaryColor: Colors.teal,
        colorScheme: ColorScheme.light(secondary: Colors.orange), // Updated to use colorScheme
      ),
      home: NotesListScreen(),
    );
  }
}

class NotesListScreen extends StatefulWidget {
  @override
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  List<Note> notes = [];

  void addNote() {
    // Logic to add a new note
    setState(() {
      notes.add(Note(
          title: 'New Note', content: 'This is a new note content.'));
    });
  }

  void editNote(Note note) {
    // Logic to edit an existing note
  }

  void deleteNote(Note note) {
    setState(() {
      notes.remove(note);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Add your background image here
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              color: Colors.white.withOpacity(0.8),
              child: ListTile(
                title: Text(
                  notes[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(
                  notes[index].content,
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () => editNote(notes[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteNote(notes[index]),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNote,
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}

class Note {
  String title;
  String content;

  Note({required this.title, required this.content});
}
