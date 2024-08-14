import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/components/drawer.dart';
import 'package:crud/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popover/popover.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // firestor element
  final FirestoreService firestoreService = FirestoreService();

  // text controller
  final TextEditingController textController = TextEditingController();

  // open a dialog box to add a note
  void openNoteBox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        content: TextField(
          controller: textController,
        ),
        actions: [
          // button to save
          ElevatedButton(
            onPressed: () {
              // add a new note
              if (docID == null) {
                firestoreService.addNote(textController.text);
              }
              // update an existing note
              else {
                firestoreService.updateNote(docID, textController.text);
              }
              // clear the text controller
              textController.clear();

              // close the box
              Navigator.pop(context);
            },
            child: Text(
              "Add",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP BAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      //       M A I N    B O D Y
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),

      // DRAWER
      drawer: const MyDrawer(),

      // BODY
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "Notes",
              style: GoogleFonts.dmSerifText(
                fontSize: 48,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: firestoreService.getNoteStream(),
              builder: (context, snapshot) {
                // if we have data, get all the docs
                if (snapshot.hasData) {
                  List notesList = snapshot.data!.docs;

                  // display as a list
                  return ListView.builder(
                    itemCount: notesList.length,
                    itemBuilder: (context, index) {
                      // get each individual doc
                      DocumentSnapshot document = notesList[index];
                      String docID = document.id;

                      // get note from each doc
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      String noteText = data['note'];

                      // display as a list tile

                      return Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        margin: const EdgeInsets.only(
                          top: 10,
                          left: 20,
                          right: 20,
                        ),
                        child: ListTile(
                          title: Text(noteText),
                          trailing: Builder(
                            builder: (context) => IconButton(
                              icon: const Icon(Icons.more_vert),
                              onPressed: () => showPopover(
                                width: 100,
                                height: 100,
                                backgroundColor:
                                    Theme.of(context).colorScheme.surface,
                                context: context,
                                bodyBuilder: (context) {
                                  return Column(
                                    children: [
                                      // edit option
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          openNoteBox(docID: docID);
                                        },
                                        child: Container(
                                          height: 50,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "Edit",
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .inversePrimary,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Icon(Icons.edit),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                      // delete option
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          firestoreService.deleteNote(docID);
                                        },
                                        child: Container(
                                          height: 50,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          child: Center(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Delete",
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .inversePrimary,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const Icon(Icons.delete),
                                            ],
                                          )),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }

                // if there is no data return nothing
                else {
                  return const Text("NO Notes...");
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
