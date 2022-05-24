import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../models/pie_model.dart';

List<PieChartSectionData> getSections(int touchedIndex) => PieModel.pies
    .asMap()
    .map<int, PieChartSectionData>((index, data) {
      final value = PieChartSectionData(
        color: data.color,
        value: data.percent,
        title: '${data.percent}%',
        radius: 80,
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xffffffff),
        ),
      );

      return MapEntry(index, value);
    })
    .values
    .toList();
