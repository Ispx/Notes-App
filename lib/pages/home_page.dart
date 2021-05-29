import 'package:flutter/material.dart';
import 'package:notes_app/widgets/list_title_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage(this.title);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> notes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.white),
            ),
            child: Text(
              notes.isNotEmpty ? notes.length.toString() : '0',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.brown.shade300,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Notes',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(
                        BorderSide(
                          width: 5,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Scrollbar(
                      child: ListView.builder(
                        itemCount: notes.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTitleWidget(
                              title: notes[index],
                              onTap: () async {
                                var noteEdited = await Navigator.pushNamed(
                                  context,
                                  '/create-note/',
                                  arguments: notes[index],
                                );

                                if (noteEdited != null) {
                                  notes[index] = noteEdited as String;
                                  setState(() {});
                                }
                              },
                              trailing: IconButton(
                                onPressed: () {
                                  notes.removeAt(index);
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red.shade900,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var newNote = await Navigator.pushNamed(context, '/create-note/');
          if (newNote != null) notes.add(newNote as String);
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
