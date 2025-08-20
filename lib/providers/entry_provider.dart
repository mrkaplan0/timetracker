import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetracker/services/entry_service.dart';

final entryServiceProvider = Provider<EntryService>((ref) => EntryService());
