import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'pie_info.dart';
import 'widgets/chart_indecators.dart';
import 'widgets/chart_sections.dart';
import '../../models/pie_model.dart';

class PieChartPage extends StatefulWidget {
  const PieChartPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartPageState();
}

class PieChartPageState extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PieInfo(
                                title: PieModel.pies[touchedIndex].name,
                                symbol: PieModel.pies[touchedIndex].symbol,
                              )),
                    );
                  },
                ),
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: getSections(touchedIndex),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                IndicatorsWidget(),
              ],
            ),
          ),
        ],
      );
}
