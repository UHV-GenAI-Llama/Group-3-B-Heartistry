import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:journal_app/classes/database.dart';

class EditEntry extends StatefulWidget {
  final bool add;
  final int? index;
  final JournalEdit journalEdit;

  const EditEntry({Key? key, required this.add, this.index, required this.journalEdit}) : super(key: key);

  @override
  _EditEntryState createState() => _EditEntryState();
}

class _EditEntryState extends State<EditEntry> {
  late JournalEdit _journalEdit;
  late String _title;
  late DateTime _selectedDate;

  final TextEditingController _moodController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  final FocusNode _moodFocus = FocusNode();
  final FocusNode _noteFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _journalEdit = JournalEdit(widget.journalEdit.action, widget.journalEdit.journal);
    _title = widget.add ? 'Add' : 'Edit';
    _journalEdit.journal = widget.journalEdit.journal;

    if (widget.add) {
      _selectedDate = DateTime.now();
      _moodController.text = '';
      _noteController.text = '';
    } else {
      _selectedDate = DateTime.parse(_journalEdit.journal.date);
      _moodController.text = _journalEdit.journal.mood;
      _noteController.text = _journalEdit.journal.note;
    }
  }

  @override
  void dispose() {
    _moodController.dispose();
    _noteController.dispose();
    _moodFocus.dispose();
    _noteFocus.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime _initialDate = _selectedDate;
    final DateTime? _pickedDate = await showDatePicker(
      context: context,
      initialDate: _initialDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (_pickedDate != null) {
      setState(() {
        _selectedDate = DateTime(
          _pickedDate.year,
          _pickedDate.month,
          _pickedDate.day,
          _pickedDate.hour,
          _pickedDate.minute,
          _pickedDate.second,
          _pickedDate.millisecond,
          _pickedDate.microsecond,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title), automaticallyImplyLeading: false),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextButton(
                onPressed: () => _selectDate(context),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today, size: 22.0, color: Colors.black54),
                    SizedBox(width: 16.0),
                    Text(
                      DateFormat.yMMMEd().format(_selectedDate),
                      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.black54),
                  ],
                ),
              ),
              TextField(
                controller: _moodController,
                focusNode: _moodFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Mood'),
                onSubmitted: (value) {
                  _moodFocus.unfocus();
                  FocusScope.of(context).requestFocus(_noteFocus);
                },
              ),
              TextField(
                controller: _noteController,
                focusNode: _noteFocus,
                textInputAction: TextInputAction.newline,
                maxLines: null,
                decoration: InputDecoration(labelText: 'Note'),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, _journalEdit);
                    },
                    child: Text('Cancel'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _journalEdit.action = 'Save';
                      _journalEdit.journal.date = _selectedDate.toIso8601String();
                      _journalEdit.journal.mood = _moodController.text;
                      _journalEdit.journal.note = _noteController.text;
                      Navigator.pop(context, _journalEdit);
                    },
                    child: Text('Save'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
