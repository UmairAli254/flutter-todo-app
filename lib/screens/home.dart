import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "../model/all_notes.dart";
import "../constants/colors.dart";
import "package:shared_preferences/shared_preferences.dart";

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  var all_notes = AllNotes().getAllNotes();
  var pref;
  sharedPref() async {
    pref = await SharedPreferences.getInstance();
    await pref.setString("notes", "all_notes");
    print(pref.getString("notes"));
  }

  @override
  initState() {
    super.initState();
    sharedPref();
  }

  @override
  build(BuildContext context) {
    // print();
    return SafeArea(
      child: Column(
        children: [
          // SearchBar
          Container(
            color: tdBGColor,
            child: Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 3, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.symmetric(vertical: 20),
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(color: tdGrey),
                  prefixIcon: Icon(Icons.search, color: tdGrey),
                ),
              ),
            ),
          ),

          // Notes start form here
          Expanded(
            child: ListView(
              children: [
                // Container(
                //   margin: const EdgeInsets.only(
                //     top: 10,
                //     bottom: 10,
                //     left: 20,
                //   ),
                //   child: const Text(
                //     "I Have To Do",
                //     style: TextStyle(
                //       fontSize: 30,
                //       fontWeight: FontWeight.w500,
                //     ),
                //     textAlign: TextAlign.left,
                //   ),
                // ),
                // Notes

                // for (var i = 0; i < 2; i++) ...[
                FutureBuilder(
                    future: SharedPreferences.getInstance(),
                    builder: (context, snapshot) {
                     print(snapshot.get);
                      return Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        // color: Colors.white,
                        child: ListTile(
                          // Shape of ListTile
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // Padding
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 10,
                          ),
                          // Functin upon clicking on the ListTile
                          onTap: () {
                            all_notes[i].isDone = !all_notes[i].isDone;
                            setState(() {});
                          },

                          // Items Starts here
                          // leading: const Icon(
                          //   Icons.task_alt,
                          //   color: tdBlue,
                          // ),
                          leading: Icon(
                            all_notes[i].isDone
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: tdBlue,
                          ),
                          title: Text(
                            all_notes[i].todo,
                            style: TextStyle(
                              fontSize: 18,
                              decoration: all_notes[i].isDone
                                  ? TextDecoration.lineThrough
                                  : null,
                              color: tdBlack,
                            ),
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              print("Dlete");
                              setState(() {
                                // all_notes.removeWhere((item) => item.id == id);
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: tdRed,
                              ),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 21,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                // ],
              ],
            ),
          ),

          // Add New Note
          Container(
            height: 70,
            // color: tdBGColor,
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Card(
                      elevation: 10,
                      color: Colors.white,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Add new item",
                          hintStyle: TextStyle(fontSize: 18),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 18),
                          // border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tdBlue,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 0),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Search Bar
// class SearchBar extends Stateful{
//   const SearchBar({super.key});

//   @override
//   State<SearchBar> createState() => _SearchBarState();
// }

// class _SearchBarState extends State<SearchBar> {
//   @override
//   build(BuildContext context) {
//     return Placeholder();
//   }
// }

// Notes
// class Notes extends Stateful{
//   var id;
//   var todo;
//   var isDone;
//   Notes({this.id, this.todo, this.isDone});

//   @override
//   State<Notes> createState() => _NotesState();
// }

// class _NotesState extends State<Notes> {
//   // var isDone = false;
//   @override
//   build(BuildContext context) {
//     return Placeholder();
//   }
// }

// Add New Note
// class AddNote extends Stateful{
//   @override
//   State<AddNote> createState() => _AddNoteState();
// }

// class _AddNoteState extends State<AddNote> {
//   @override
//   build(BuildContext context) {
//     return Placeholder();
//   }
// }
