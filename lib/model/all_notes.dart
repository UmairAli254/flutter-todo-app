import 'dart:ffi';

class AllNotes {
  final id;
  final todo;
  final isDone;

  AllNotes({this.id, this.todo, this.isDone});

  getAllNotes() {
    return [
      AllNotes(
        id: 1,
        todo: "Take my breakfast",
        isDone: false,
      ),
      AllNotes(
        id: 2,
        todo: "Take a bath",
        isDone: true,
      ),
      AllNotes(
        id: 3,
        todo: "Start the bike",
        isDone: false,
      ),
      AllNotes(
        id: 4,
        todo: "Get out of the hosue",
        isDone: true,
      ),
    ];
  }
}
