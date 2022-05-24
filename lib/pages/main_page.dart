import 'package:flutter/material.dart';

import 'pie_chart/pie_chart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Задание для Blackwall'),
          centerTitle: true,
        ),
        body: PageView(
          children: const [
            PieChartPage(),
          ],
        ),
      );
}
