// import 'package:flutter/material.dart';
//
// class GraphScreen extends StatefulWidget {
//   const GraphScreen({Key? key}) : super(key: key);
//
//   @override
//   State<GraphScreen> createState() => _GraphScreenState();
// }
//
// class _GraphScreenState extends State<GraphScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//     );
//   }
// }

import 'package:flutter/material.dart';
// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:psl_foundation/services/OverallAnalyticsFunctions.dart';
import 'package:psl_foundation/views/widgets/graph/indicator.dart';

import '../constant.dart';



class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {

  OverallAnalyticsFunctions overallAnalyticsFunctions = OverallAnalyticsFunctions();

  Map<String, double> empCntForBoth = {};

  getEmpCountForBoth() async {
    empCntForBoth = await overallAnalyticsFunctions.totalEmployeeCount();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getEmpCountForBoth();
  }

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 15,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: kColorPrimary,
                text: 'Volunteering',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: kColorPrimary.withOpacity(0.5),
                text: 'Donations',
                isSquare: true,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: kColorPrimary,
            value: empCntForBoth['Volunteering'],
            title: empCntForBoth['Volunteering'].toString(),
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: kColorPrimary.withOpacity(0.5),
            value: empCntForBoth['Donations'],
            title: empCntForBoth['Donations'].toString(),
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}


// Lives touched graph

class PieChartSample3 extends StatefulWidget {
  const PieChartSample3({super.key});

  @override
  State<StatefulWidget> createState() => PieChart3State();
}

class PieChart3State extends State {

  OverallAnalyticsFunctions overallAnalyticsFunctions = OverallAnalyticsFunctions();

  Map<String, int> livesTouchPerActivity = {};

  liveTouchPerActivity() async {
    livesTouchPerActivity = await overallAnalyticsFunctions.getLivesTouchedPerActivity();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    liveTouchPerActivity();
  }

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 15,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: kColorPrimary,
                text: 'Activity 1',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xFFA2D683),
                text: 'Activity 2',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xFFC8DF88),
                text: 'Activity 3',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Colors.green,
                text: 'Activity 4',
                isSquare: true,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: kColorPrimary,
            value: livesTouchPerActivity["Donation Drive For Drinking Water"]?.toDouble(),
            title: livesTouchPerActivity["Donation Drive For Drinking Water"]?.toString(),
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Color(0xFFA2D683),
            value: livesTouchPerActivity["Donation Drive For School supplies donation drive"]?.toDouble(),
            title: livesTouchPerActivity["Donation Drive For School supplies donation drive"]?.toString(),
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Color(0xFFC8DF88),
            value: livesTouchPerActivity["Donation Drive For Blood Donation"]?.toDouble(),
            title: livesTouchPerActivity["Donation Drive For Blood Donation"]?.toString(),
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: livesTouchPerActivity["Donation Drive For Cancer Patients"]?.toDouble(),
            title: livesTouchPerActivity["Donation Drive For Cancer Patients"]?.toString(),
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}