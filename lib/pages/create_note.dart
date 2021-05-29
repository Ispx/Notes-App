import 'package:flutter/material.dart';

class CreateNote extends StatefulWidget {
  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  var _editingController = TextEditingController();
  bool _hasArgument = false;
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _hasArgument =
          ModalRoute.of(context)?.settings.arguments != null ? true : false;
      _editingController = TextEditingController(
          text: ModalRoute.of(context)?.settings.arguments as String);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Visibility(
          visible: !_hasArgument,
          child: Text('Criar Nota'),
          replacement: Text('Editar Nota'),
        ),
      ),
      body: Container(
        height: media.size.height * .4,
        width: media.size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _editingController,
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
              cursorColor: Theme.of(context).primaryColor,
              onChanged: (value) {
                setState(() {});
              },
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Nota',
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                enabled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 3,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 3,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 3,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              color: Theme.of(context).primaryColor,
              splashColor: Colors.green,
              disabledColor: Colors.grey.shade600,
              onPressed: _editingController.text.isNotEmpty
                  ? () {
                      Navigator.pop(context, _editingController.text);
                    }
                  : null,
              child: Text(
                'Salvar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
