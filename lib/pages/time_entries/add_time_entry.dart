import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:timetracker/models/time_entry/time_entry.dart';
import 'package:timetracker/models/user/user.dart';
import 'package:timetracker/providers/auth_provider.dart';
import 'package:timetracker/providers/entry_provider.dart';

class AddTimeEntryPage extends ConsumerStatefulWidget {
  const AddTimeEntryPage({super.key});

  @override
  ConsumerState<AddTimeEntryPage> createState() => _AddTimeEntryPageState();
}

class _AddTimeEntryPageState extends ConsumerState<AddTimeEntryPage> {
  DateTime? _selectedDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  final _noteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(bool isStartTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          _startTime = pickedTime;
        } else {
          _endTime = pickedTime;
        }
      });
    }
  }

  void _saveTimeEntry() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedDate == null || _startTime == null || _endTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Bitte wählen Sie Datum, Start- und Endzeit aus'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Combine date with start and end times
      final DateTime startDateTime = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _startTime!.hour,
        _startTime!.minute,
      );

      final DateTime endDateTime = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _endTime!.hour,
        _endTime!.minute,
      );

      if (endDateTime.isBefore(startDateTime)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Endzeit darf nicht vor Startzeit liegen'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      User? user = await ref.read(currentUserProvider.future);
      // Here the time entry saving operation will be performed
      final timeEntry = TimeEntry(
        startTime: startDateTime,
        endTime: endDateTime,
        userId: user!.id,
        totalHours: endDateTime.difference(startDateTime).inHours.toDouble(),
        note: _noteController.text,
      );

      ref
          .read(entryServiceProvider)
          .createEntry(timeEntry)
          .then((createdEntry) {
            ref.invalidate(entryListProvider);

            // Successfully created entry
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Zeiteintrag erfolgreich gespeichert'),
                backgroundColor: Colors.green,
              ),
            );
          })
          .catchError((error) {
            // Handle error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Fehler beim Speichern des Zeiteintrags: $error'),
                backgroundColor: Colors.red,
              ),
            );
          });

      // Close the page
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      appBar: AppBar(
        title: const Text('Zeiteintrag hinzufügen'),
        backgroundColor: Colors.blueGrey.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Date Selection
                GlassContainer.frostedGlass(
                  borderColor: Colors.white,
                  borderWidth: 1,
                  height: 80,
                  borderRadius: BorderRadius.circular(12),
                  child: ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: const Text('Datum'),
                    subtitle: Text(
                      _selectedDate != null
                          ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                          : 'Datum auswählen',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: _selectDate,
                  ),
                ),

                const SizedBox(height: 16),

                // Start Time
                GlassContainer.frostedGlass(
                  height: 80,
                  borderColor: Colors.white,
                  borderWidth: 1,
                  borderRadius: BorderRadius.circular(12),
                  child: ListTile(
                    leading: const Icon(Icons.access_time),
                    title: const Text('Startzeit'),
                    subtitle: Text(
                      _startTime != null
                          ? '${_startTime!.hour.toString().padLeft(2, '0')}:${_startTime!.minute.toString().padLeft(2, '0')}'
                          : 'Startzeit auswählen',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () => _selectTime(true),
                  ),
                ),

                const SizedBox(height: 16),

                // End Time
                GlassContainer.frostedGlass(
                  height: 80,
                  borderColor: Colors.white,
                  borderWidth: 1,
                  borderRadius: BorderRadius.circular(12),
                  child: ListTile(
                    leading: const Icon(Icons.access_time),
                    title: const Text('Endzeit'),
                    subtitle: Text(
                      _endTime != null
                          ? '${_endTime!.hour.toString().padLeft(2, '0')}:${_endTime!.minute.toString().padLeft(2, '0')}'
                          : 'Endzeit auswählen',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () => _selectTime(false),
                  ),
                ),

                const SizedBox(height: 16),

                // Note Field
                GlassContainer.frostedGlass(
                  height: 100,
                  borderColor: Colors.white,
                  borderWidth: 1,
                  borderRadius: BorderRadius.circular(12),
                  child: TextFormField(
                    controller: _noteController,
                    decoration: const InputDecoration(
                      labelText: 'Notiz',
                      hintText: 'Optional Notiz hinzufügen...',
                      prefixIcon: Icon(Icons.note),
                      border: InputBorder.none,
                    ),
                    maxLines: 3,
                    validator: (value) {
                      // Note field is optional, no validation
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // Save Button
                ElevatedButton(
                  onPressed: _saveTimeEntry,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.save),
                      SizedBox(width: 8),
                      Text('Speichern', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
