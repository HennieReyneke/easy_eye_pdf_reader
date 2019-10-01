import 'package:flutter/material.dart';
import 'dart:convert';

class AnalyticsSection extends StatefulWidget {
  @override
  _AnalyticsSectionState createState() => _AnalyticsSectionState();
}

class _AnalyticsSectionState extends State<AnalyticsSection> {
  Map<String, Map<String, String>> analytics = {};

  void setAnalytics(Map<String, Map<int, Duration>> value) {
    setState(() {
      analytics = Map<String, Map<String, String>>.from(
        value.map((k, v) {
          return MapEntry(
            k.toString(),
            Map<String, String>.from(
              v.map((k1, v1) {
                return MapEntry(k1.toString(), v1.toString());
              }),
            ),
          );
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

String prettyJson(map) {
  return JsonEncoder.withIndent(' ' * 2).convert(map);
}
