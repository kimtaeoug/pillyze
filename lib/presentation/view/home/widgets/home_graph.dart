import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillyze/app/config/colors.dart';
import 'package:pillyze/app/config/text_style.dart';
import 'package:pillyze/app/util/widget_util.dart';

class HomeGraph extends StatefulWidget {
  final double minTarget;
  final double maxTarget;
  final double minValueY;
  final double maxValueY;
  final List<FlSpot> data;

  const HomeGraph(
      {Key? key,
      required this.minTarget,
      required this.maxTarget,
      required this.minValueY,
      required this.maxValueY,
      required this.data})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeGraph();
}

class _HomeGraph extends State<HomeGraph> {
  final GlobalKey _chartKey = GlobalKey();
  Size? chartSize;
  double stop1 = 0.0;
  double stop2 = 0.0;

  @override
  void initState() {
    stop1 = _calStop(widget.minTarget);
    stop2 = _calStop(widget.maxTarget);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Size? size = WidgetUtil.size(_chartKey);
      setState(() {
        chartSize = size;
      });
    });
  }

  final AxisTitles _noAxis =
      const AxisTitles(sideTitles: SideTitles(showTitles: false));

  final double _minX = 0;
  final double _maxX = 1406;
  final double _minY = 0;
  final double _maxY = 250;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (chartSize != null)
          Positioned(
              top: _yCoordinate(widget.maxTarget),
              left: 0,
              child: Container(
                width: Get.width - 50,
                color: PColors.acua.withOpacity(0.8),
                height: _containerHeight(),
              )),
        LineChart(
            key: _chartKey,
            LineChartData(
                backgroundColor: PColors.transperant,
                lineBarsData: [
                  LineChartBarData(
                      spots: widget.data,
                      barWidth: 4,
                      isCurved: true,
                      curveSmoothness: 1,
                      dotData: const FlDotData(show: false),
                      gradient: _gradient())
                ],
                minX: _minX,
                maxX: _maxX,
                minY: _minY,
                maxY: _maxY,
                gridData: const FlGridData(
                  show: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                titlesData: FlTitlesData(
                    show: true,
                    topTitles: _noAxis,
                    bottomTitles: _noAxis,
                    leftTitles: _noAxis,
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 50,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: Styler.style(),
                            textAlign: TextAlign.end,
                          );
                        },
                      ),
                    )),
                extraLinesData: ExtraLinesData(
                    extraLinesOnTop: false,
                    horizontalLines: List.generate(_verticalLine.length,
                        (index) => _horizontalLine(_verticalLine[index]))))),
      ],
    );
  }

  //y축 그리기
  final List<double> _verticalLine = [0, 50, 100, 150, 200, 250];

  HorizontalLine _horizontalLine(double y) {
    return HorizontalLine(
      y: y,
      color: PColors.gray2,
    );
  }

  //y 좌표 계산
  double _yCoordinate(double y) {
    double yPercent = (y - _minY) / (_maxY - _minY);
    return (1 - yPercent) * chartSize!.height;
  }

  //y값들 위치 계산 -> 해당 값들로 컨테이너 height 설정
  double _containerHeight() {
    return (_yCoordinate(widget.maxTarget) - _yCoordinate(widget.minTarget))
        .abs();
  }

  ///
  /// stop 계산 이유
  /// fl_chart내 그래프는 0부터 250이 아니라 그래프의 최솟값 82부터 175로 gradient가 되어서 90과 140을 이에 맞게 바꿔야됨.
  /// stop 계산식
  /// vyMin - value 내 y 최솟값, gyMin - grpah 내 y 최솟값
  /// vyMax - value 내 y 최댓값, gyMax - graph 내 y 최댓값
  /// 인자 값 : p
  /// 찾고자 하는 값 : target
  /// (p - gyMin) / (gyMax - gyMin) = (target - vyMin) / (vyMax - vyMin)
  /// target값을 구한 후, 비율로 치환하기 위한 식
  /// (target  - (vyMax - vyMin))/(vyMax - vyMin)
  ///
  LinearGradient _gradient() {
    return LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: const [PColors.skin, PColors.sky, PColors.sky, PColors.yellow],
        stops: [0, stop1, stop2, 1]);
  }

  double _calStop(double input) {
    return ((((input - _minY) *
                    (widget.maxValueY - widget.minValueY) /
                    (_maxY - _minY)) +
                widget.minValueY) -
            (widget.maxValueY - widget.minValueY)) /
        (widget.maxValueY - widget.minValueY);
  }
}
