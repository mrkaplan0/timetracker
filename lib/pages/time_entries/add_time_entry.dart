import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTimeEntryPage extends ConsumerStatefulWidget {
  const AddTimeEntryPage({super.key});

  @override
  ConsumerState<AddTimeEntryPage> createState() => _AddTimeEntryPageState();
}

class _AddTimeEntryPageState extends ConsumerState<AddTimeEntryPage> {
  DateTime? _startDate;
  DateTime? _endDate;
  final _noteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _selectDateTime(bool isStartDate) async {
    // First show date picker
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      // Then show time picker
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        // Combine date and time
        final DateTime combinedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          if (isStartDate) {
            _startDate = combinedDateTime;
          } else {
            _endDate = combinedDateTime;
          }
        });
      }
    }
  }

  void _saveTimeEntry() {
    if (_formKey.currentState!.validate()) {
      if (_startDate == null || _endDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Bitte wählen Sie Start- und Enddatum aus'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (_endDate!.isBefore(_startDate!)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Enddatum darf nicht vor Startdatum liegen'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Here the time entry saving operation will be performed
      // For example: using provider or service

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Zeiteintrag erfolgreich gespeichert'),
          backgroundColor: Colors.green,
        ),
      );

      // Close the page
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zeiteintrag hinzufügen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Start Date and Time
              Card(
                child: ListTile(
                  leading: const Icon(Icons.access_time),
                  title: const Text('Startdatum & Zeit'),
                  subtitle: Text(
                    _startDate != null
                        ? '${_startDate!.day}/${_startDate!.month}/${_startDate!.year} ${_startDate!.hour.toString().padLeft(2, '0')}:${_startDate!.minute.toString().padLeft(2, '0')}'
                        : 'Datum und Zeit auswählen',
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => _selectDateTime(true),
                ),
              ),

              const SizedBox(height: 16),

              // End Date and Time
              Card(
                child: ListTile(
                  leading: const Icon(Icons.access_time),
                  title: const Text('Enddatum & Zeit'),
                  subtitle: Text(
                    _endDate != null
                        ? '${_endDate!.day}/${_endDate!.month}/${_endDate!.year} ${_endDate!.hour.toString().padLeft(2, '0')}:${_endDate!.minute.toString().padLeft(2, '0')}'
                        : 'Datum und Zeit auswählen',
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => _selectDateTime(false),
                ),
              ),

              const SizedBox(height: 16),

              // Note Field
              TextFormField(
                controller: _noteController,
                decoration: const InputDecoration(
                  labelText: 'Notiz',
                  hintText: 'Optional Notiz hinzufügen...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.note),
                ),
                maxLines: 3,
                validator: (value) {
                  // Note field is optional, no validation
                  return null;
                },
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
    );
  }
}
