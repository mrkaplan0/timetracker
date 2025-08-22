import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:timetracker/models/admin_report/admin_report.dart';
import 'package:timetracker/models/time_entry/time_entry.dart';
import 'package:timetracker/models/user_report/user_report.dart';
import 'package:timetracker/pages/time_entries/time_entries_detail.dart';
import 'package:timetracker/providers/auth_provider.dart';
import 'package:timetracker/providers/entry_provider.dart';
import 'package:timetracker/utils/consts.dart';

class AdminDashboard extends ConsumerStatefulWidget {
  const AdminDashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends ConsumerState<AdminDashboard>
    with TickerProviderStateMixin {
  List<TimeEntry> timeEntriesLimited = [];
  List<TimeEntry> entriesByUser = [];
  String? selectedUserName;
  bool isAnimate = true;
  @override
  Widget build(BuildContext context) {
    var adminReport = ref.watch(adminReportProvider);

    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Admin Dashboard',
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

      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            spacing: 40,
            children: [
              sideBar(constraints, adminReport),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    runAlignment: WrapAlignment.end,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 40,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Berichtszeitraum für ${adminReport.value?.reportPeriod ?? ""}',
                            style: MyConsts.myLittleTitleTextStyle.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          myAllUsersChart(adminReport.value?.users, context)
                              .animate(delay: const Duration(milliseconds: 400))
                              .fadeIn(
                                duration: const Duration(milliseconds: 400),
                              ),
                        ],
                      ),
                      if (timeEntriesLimited.isNotEmpty) ...[
                        myChart(timeEntriesLimited, context)
                            .animate(
                              delay: const Duration(milliseconds: 200),
                              controller: (isAnimate
                                  ? null
                                  : AnimationController(
                                      vsync: this,
                                      duration: const Duration(
                                        milliseconds: 600,
                                      ),
                                    )),
                              onComplete: (controller) => isAnimate = false,
                            )
                            .fadeIn(
                              duration: const Duration(milliseconds: 800),
                            ),
                      ] else ...[
                        placeHolderBox()
                            .animate(delay: const Duration(milliseconds: 600))
                            .fadeIn(
                              duration: const Duration(milliseconds: 400),
                            ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  SizedBox placeHolderBox() {
    return SizedBox(
      height: 350,
      width: 400,
      child: Column(
        children: [
          SizedBox(height: 40),
          Container(
            height: 300,
            width: 400,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(80),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                'Bitte wählen Sie einen Mitarbeiter aus der linken Liste aus.',
                textAlign: TextAlign.center,
                style: MyConsts.myLittleTitleTextStyle.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sideBar(
    BoxConstraints constraints,
    AsyncValue<AdminReport> adminReport,
  ) {
    return GlassContainer.clearGlass(
      width: constraints.maxWidth * 0.25,
      height: constraints.maxHeight,
      borderColor: Colors.white54,
      borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(Icons.people, color: Colors.white),
            title: Text(
              'Mitarbeiter',
              style: MyConsts.myBigTitleTextStyle.copyWith(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: adminReport.value?.users.length ?? 0,
              itemBuilder: (context, index) {
                UserReport userReport = adminReport.value!.users[index];
                return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                      ),
                      leading: const Icon(Icons.person, color: Colors.white),
                      title: Text(
                        userReport.name,
                        style: const TextStyle(color: Colors.white),
                      ),

                      onTap: () async {
                        try {
                          // Fetch user-specific entries and update chart
                          entriesByUser = await ref.read(
                            getOneUserEntriesProvider(
                              userReport.userId.toString(),
                            ).future,
                          );
                          setState(() {
                            timeEntriesLimited = entriesByUser.reversed
                                .toList()
                                .getRange(
                                  entriesByUser.length > 5
                                      ? entriesByUser.length - 5
                                      : 0,
                                  entriesByUser.length,
                                )
                                .toList();
                          });
                          selectedUserName = userReport.name;
                        } catch (e) {
                          // Show error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Fehler: ${e.toString()}'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                      },
                    )
                    .animate(delay: const Duration(milliseconds: 400))
                    .fadeIn(duration: const Duration(milliseconds: 2000));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget myAllUsersChart(List<UserReport>? users, BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(80),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        spacing: 10,
        children: [
          Text(
            'Alle Mitarbeiter',
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
                  backgroundColor: Colors.blueGrey[300],
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      bottom: BorderSide(color: Colors.white, width: 1),
                      left: BorderSide(color: Colors.blueGrey, width: 1),
                    ),
                  ),

                  titlesData: FlTitlesData(
                    rightTitles: const AxisTitles(),
                    topTitles: const AxisTitles(),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 45,
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
                          '${rod.toY} \n ${users?[groupIndex].name} ',
                          const TextStyle(color: Colors.white, fontSize: 14),
                        );
                      },
                    ),
                  ),
                  barGroups:
                      users?.map((user) {
                        return BarChartGroupData(
                          groupVertically: true,
                          x: user.userId,
                          barRods: [
                            BarChartRodData(
                              toY: (user.expectedHours + user.difference),
                              color: Colors.blueGrey.shade700,
                              width: 20,
                              backDrawRodData: BackgroundBarChartRodData(
                                show: true,
                                fromY: 0,
                                toY: user.expectedHours,
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
        ],
      ),
    );
  }

  Widget myChart(
    Iterable<TimeEntry>? timeEntriesLimited,
    BuildContext context,
  ) {
    return SizedBox(
      height: 350,
      width: 400,
      child: Column(
        children: [
          Text(
            '$selectedUserName',
            style: MyConsts.myLittleTitleTextStyle.copyWith(
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          Container(
            height: 300,
            width: 400,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(80),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              children: [
                Text(
                  'Letzte 5 Einträge',
                  style: MyConsts.myBigTitleTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                getExtraTimes(timeEntriesLimited),
                SizedBox(
                  height: 165,
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
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              getTitlesWidget: (value, meta) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    '${value.toInt()}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
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
                              final entries = timeEntriesLimited?.toList();
                              if (entries != null &&
                                  groupIndex < entries.length) {
                                final entry = entries[groupIndex];
                                return BarTooltipItem(
                                  '${rod.toY.toStringAsFixed(1)} Std\nDatum: ${entry.startTime.day}/${entry.startTime.month}',
                                  const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                );
                              }
                              return null;
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
                          builder: (context) =>
                              TimeEntriesDetailPage(entries: entriesByUser),
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
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.green.withAlpha(50),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.green, width: 1),
        ),
        child: Text(
          "Überstunden: ${extraHours.toStringAsFixed(1)} Stunden",
          style: MyConsts.myLittleTitleTextStyle.copyWith(
            color: Colors.green.shade700,
            fontSize: 14,
          ),
        ),
      );
    } else if (extraHours < 0) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.red.withAlpha(50),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.red, width: 1),
        ),
        child: Text(
          "Fehlstunden: ${extraHours.abs().toStringAsFixed(1)} Stunden",
          style: MyConsts.myLittleTitleTextStyle.copyWith(
            color: Colors.red.shade700,
            fontSize: 14,
          ),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.blue.withAlpha(50),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue, width: 1),
        ),
        child: Text(
          "Normal Arbeitzeit",
          style: MyConsts.myLittleTitleTextStyle.copyWith(
            color: Colors.blue.shade700,
            fontSize: 14,
          ),
        ),
      );
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
