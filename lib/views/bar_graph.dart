import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:psl_foundation/services/OverallAnalyticsFunctions.dart';

class BarChartSample7 extends StatefulWidget {
  BarChartSample7({super.key});

  final shadowColor = const Color(0xFF3BC279);
  final dataList = [
    const _BarData(Colors.blue, 12, 18, 1),
    const _BarData(Colors.blue, 7, 10, 2),
    const _BarData(Colors.blue, 1, 1, 3),
    const _BarData(Colors.blue, 5, 7, 5),
    const _BarData(Colors.blue, 5, 6, 7),
    const _BarData(Colors.blue, 1, 0, 9),
    const _BarData(Colors.blue, 3, 3, 11),
    const _BarData(Colors.blue, 1, 1, 13),
  ];

  @override
  State<BarChartSample7> createState() => _BarChartSample7State();
}

class _BarChartSample7State extends State<BarChartSample7> {

  OverallAnalyticsFunctions overallAnalyticsFunctions = OverallAnalyticsFunctions();

  Map<String, Map<dynamic, dynamic>> grdViseEmp = {};

  getGradeWiseEmpData() async {
  grdViseEmp = await overallAnalyticsFunctions.totalEmployeeCountGradeWise();
  if (this.mounted) {
    setState(() {});
  }
  }

  @override
  void initState() {
    super.initState();
    getGradeWiseEmpData();
  }

  BarChartGroupData generateBarGroup(
      int x,
      // Color color,
      double value,
      double shadowValue,
      ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: Colors.yellow,
          width: 6,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: widget.shadowColor,
          width: 6,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(24),
        child: AspectRatio(
          aspectRatio: 1.4,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceBetween,
              borderData: FlBorderData(
                show: true,
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                leftTitles: AxisTitles(
                  drawBehindEverything: true,
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        textAlign: TextAlign.left,
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 36,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      return Text(
                        value.toInt().toString(),
                      );
                    },
                  ),
                ),
                rightTitles: AxisTitles(),
                topTitles: AxisTitles(),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.grey.withOpacity(0.2),
                  strokeWidth: 1,
                ),
              ),
              barGroups: widget.dataList.asMap().entries.map((e) {
                final index = e.value.grade.toInt();
                final data = e.value;
                return generateBarGroup(
                  index,
                  // data.color,
                  data.value,
                  data.shadowValue,
                );
              }).toList(),
              maxY: 20,
              // barTouchData: BarTouchData(
              //   enabled: true,
              //   handleBuiltInTouches: false,
              //   touchTooltipData: BarTouchTooltipData(
              //     tooltipBgColor: Colors.transparent,
              //     tooltipMargin: 0,
              //     getTooltipItem: (
              //         BarChartGroupData group,
              //         int groupIndex,
              //         BarChartRodData rod,
              //         int rodIndex,
              //         ) {
              //       return BarTooltipItem(
              //         rod.toY.toString(),
              //         TextStyle(
              //           fontWeight: FontWeight.bold,
              //           color: rod.color,
              //           fontSize: 18,
              //           shadows: const [
              //             Shadow(
              //               color: Colors.black26,
              //               blurRadius: 12,
              //             )
              //           ],
              //         ),
              //       );
              //     },
              //   ),
              //   touchCallback: (event, response) {
              //     if (event.isInterestedForInteractions &&
              //         response != null &&
              //         response.spot != null) {
              //       setState(() {
              //         touchedGroupIndex = response.spot!.touchedBarGroupIndex;
              //       });
              //     } else {
              //       setState(() {
              //         touchedGroupIndex = -1;
              //       });
              //     }
              //   },
              // ),
            ),
          ),
        ),
      );
  }
}

class _BarData {
  const _BarData(this.color, this.value, this.shadowValue, this.grade);
  final Color color;
  final double value;
  final double shadowValue;
  final double grade;
}

// class _IconWidget extends ImplicitlyAnimatedWidget {
//   const _IconWidget({
//     required this.color,
//     required this.isSelected,
//   }) : super(duration: const Duration(milliseconds: 300));
//   final Color color;
//   final bool isSelected;
//
//   @override
//   ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
//       _IconWidgetState();
// }
//
// class _IconWidgetState extends AnimatedWidgetBaseState<_IconWidget> {
//   Tween<double>? _rotationTween;
//
//   @override
//   Widget build(BuildContext context) {
//     final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
//     final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
//     return Transform(
//       transform: Matrix4.rotationZ(rotation).scaled(scale, scale),
//       origin: const Offset(14, 14),
//       child: Icon(
//         widget.isSelected ? Icons.face_retouching_natural : Icons.face,
//         color: widget.color,
//         size: 28,
//       ),
//     );
//   }
//
//   @override
//   void forEachTween(TweenVisitor<dynamic> visitor) {
//     _rotationTween = visitor(
//       _rotationTween,
//       widget.isSelected ? 1.0 : 0.0,
//           (dynamic value) => Tween<double>(
//         begin: value as double,
//         end: widget.isSelected ? 1.0 : 0.0,
//       ),
//     ) as Tween<double>?;
//   }
// }