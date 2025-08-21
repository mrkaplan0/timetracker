import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:timetracker/models/time_entry/time_entry.dart';
import 'package:timetracker/pages/time_entries/add_time_entry.dart';
import 'package:timetracker/pages/time_entries/time_entries_detail.dart';
import 'package:timetracker/providers/auth_provider.dart';
import 'package:timetracker/providers/entry_provider.dart';
import 'package:timetracker/utils/consts.dart';

class UserDashboard extends ConsumerWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var timeEntries = ref.watch(entryListProvider).value;
    var timeEntriesLimited = timeEntries?.reversed.toList().getRange(
      timeEntries.length > 5 ? timeEntries.length - 5 : 0,
      timeEntries.length,
    );
    print(timeEntriesLimited);
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        title: Text(
          'Home',
          style: MyConsts.myBigTitleTextStyle.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              _logout(context, ref);
            },
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: GlassContainer.clearGlass(
          borderColor: Colors.white.withAlpha(50),
          shape: BoxShape.circle,

          elevation: 4,
          child: FloatingActionButton(
            backgroundColor: Colors.white.withAlpha(50),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddTimeEntryPage(),
                ),
              );
            },
            child: Icon(Icons.add, color: Colors.blueGrey.shade700, size: 40),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              SizedBox(height: 20),

              /*  CustomButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddTimeEntryPage(),
                    ),
                  );
                },
                imagePath: 'assets/images/add.jpg',
                height: 250,
                label: 'Fehlzeit Eintrag',
                icon: Icons.add,
              ), */
              myChart(timeEntriesLimited, context),
              SizedBox(
                height: 100,
                child: GlassContainer.clearGlass(
                  borderColor: Colors.white.withAlpha(50),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(40),
                  elevation: 10,
                  child: Center(child: getExtraTimes(timeEntries)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myChart(
    Iterable<TimeEntry>? timeEntriesLimited,
    BuildContext context,
  ) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(80),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        spacing: 10,
        children: [
          Text(
            'Letzte 5 Einträge',
            style: MyConsts.myBigTitleTextStyle.copyWith(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: BarChart(
                BarChartData(
                  baselineY: 8,
                  maxY: 12.0,
                  backgroundColor: Colors.blueGrey[300],
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      bottom: BorderSide(color: Colors.white, width: 1),
                      left: BorderSide(color: Colors.blueGrey, width: 1),
                    ),
                  ),
                  extraLinesData: ExtraLinesData(
                    horizontalLines: [
                      HorizontalLine(
                        y: 8,
                        color: Colors.blueGrey,
                        strokeWidth: 2,
                        dashArray: [5, 5],
                      ),
                    ],
                  ),
                  titlesData: FlTitlesData(
                    rightTitles: const AxisTitles(),
                    topTitles: const AxisTitles(),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              value.toInt().toString(),
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${rod.toY} ',
                          const TextStyle(color: Colors.white, fontSize: 14),
                        );
                      },
                    ),
                  ),
                  barGroups:
                      timeEntriesLimited?.map((entry) {
                        return BarChartGroupData(
                          groupVertically: true,
                          x: entry.startTime.day,
                          barRods: [
                            BarChartRodData(
                              toY: entry.totalHours,
                              color: Colors.blueGrey.shade700,
                              width: 20,
                              backDrawRodData: BackgroundBarChartRodData(
                                show: true,
                                fromY: 0,
                                toY: 8,
                                color: Colors.redAccent.shade100,
                              ),
                            ),
                          ],
                        );
                      }).toList() ??
                      [],
                ),
                duration: const Duration(milliseconds: 150),
                curve: Curves.linear,
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TimeEntriesDetailPage(),
                  ),
                );
              },
              child: Text(
                "Alle Einträge anzeigen",
                style: TextStyle(color: Colors.blueGrey.shade700),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getExtraTimes(Iterable<TimeEntry>? timeEntries) {
    if (timeEntries == null || timeEntries.isEmpty) return Text("0.0");
    double totalHours = timeEntries.length * 8.0;
    double totalWorkHours = timeEntries.fold(
      0.0,
      (sum, entry) => sum + entry.totalHours,
    );

    double extraHours = totalWorkHours - totalHours;
    if (extraHours > 0) {
      return Text(
        "Überstunden: ${extraHours.toStringAsFixed(1)}",
        style: MyConsts.myLittleTitleTextStyle,
      );
    } else if (extraHours < 0) {
      return Text(
        "Fehlstunden: ${extraHours.abs().toStringAsFixed(1)}",
        style: MyConsts.myLittleTitleTextStyle,
      );
    } else {
      return Text("Keine Überstunden", style: MyConsts.myLittleTitleTextStyle);
    }
  }

  void _logout(BuildContext context, WidgetRef ref) {
    ref.read(logoutProvider);
    ref.invalidate(currentUserProvider);
    ref.invalidate(tokenProvider);
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil('/landing', (Route<dynamic> route) => false);
  }
}
