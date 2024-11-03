import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const book(),
    );
  }
}

class book extends StatefulWidget {
  const book({super.key});

  @override
  State<book> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<book> {
  DateTime today = DateTime.now();
  final List<Note> notes = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  void _addNote() {
    if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
      setState(() {
        notes.add(Note(
          title: titleController.text,
          content: contentController.text,
          date: today,
        ));
        titleController.clear();
        contentController.clear();
      });
    }
    Navigator.pop(context);
  }

  void _showNoteInputSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Başlık',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(
                  labelText: 'Not',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _addNote,
                child: const Text('Kaydet'),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildNotesForSelectedDay() {
    return notes
        .where((note) => isSameDay(note.date, today))
        .map((note) => Dismissible(
      key: Key(note.title),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: const Icon(Icons.delete, color: Color(0xFFB0A89F)),
      ),
      onDismissed: (direction) {
        setState(() {
          notes.remove(note);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${note.title} silindi."),
          ),
        );
      },
      child: Card(
        color: const Color(0xFFE5DED0), // Note card background color
        child: ListTile(
          title: Text(note.title),
          subtitle: Text(note.content),
        ),
      ),
    ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB0A89F), // Updated AppBar color
        title: const Text("Dijital Duygu Aynası", style: TextStyle(color: Colors.black)), // Title color
      ),
      body: Container(
        color: const Color(0xFF352F30),
        child: Column(
          children: [
            TableCalendar(
              locale: "en_US",
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(color: Colors.white),
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: const BoxDecoration(
                  color: Color(0xFF7D7B76),
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                defaultTextStyle: const TextStyle(color: Colors.white),
                weekendTextStyle: const TextStyle(color: Colors.white),
              ),
              focusedDay: today,
              onDaySelected: _onDaySelected,
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2030, 1, 1),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: _buildNotesForSelectedDay(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showNoteInputSheet,
        backgroundColor: const Color(0xFFADA49A), // Floating button color
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Note {
  final String title;
  final String content;
  final DateTime date;

  Note({
    required this.title,
    required this.content,
    required this.date,
  });
}
