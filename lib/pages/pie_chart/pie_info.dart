import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../styles/styles.dart';

Map<String, dynamic> data = {};

class PieInfo extends StatelessWidget {
  final String title;
  final String symbol;
  const PieInfo({Key? key, required this.title, required this.symbol})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: FutureBuilder(
          future: getList(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.none:
                return const Center(
                    child: Text('Проверьте своё соединение с интернетом!'));
              default:
                return PageView(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text('Аббревиатура: ', style: parameter),
                              Text(data['Symbol'], style: textDescription)
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text('Название компании: ',
                                  style: parameter),
                              Text(data['Name'], style: textDescription)
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     //
                          //     Flexible(
                          //         child: Text(
                          //             'Описание: ${data['Description']}',
                          //             style: textDescription))
                          //   ],
                          // ),
                          RichText(
                            text: TextSpan(text: '', children: [
                              const TextSpan(
                                  text: 'Описание: ', style: parameter),
                              TextSpan(
                                  text: '${data['Description']}',
                                  style: textDescription),
                            ]),
                          ),
                        ],
                      ),
                    )
                  ],
                );
            }
          }),
    );
  }

  Future<void> getList() async {
    const String apikey = 'E746DPMTHOC3QGYC';
    final url =
        'https://www.alphavantage.co/query?function=OVERVIEW&symbol=$symbol&apikey=$apikey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      data = body;
      return;
    }
  }
}
