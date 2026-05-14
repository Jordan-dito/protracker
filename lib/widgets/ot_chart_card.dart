import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../core/app_colors.dart';

class OtChartCard extends StatefulWidget {
  const OtChartCard({super.key});

  @override
  State<OtChartCard> createState() => _OtChartCardState();
}

class _OtChartCardState extends State<OtChartCard> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildChartTypeSelector(),
        const SizedBox(height: 8),
        SizedBox(
          height: 180,
          child: _selected == 0
              ? _buildBarChart()
              : _selected == 1
                  ? _buildPieChart()
                  : _buildLineChart(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildChartTypeSelector() {
    const icons = [
      Icons.bar_chart_rounded,
      Icons.pie_chart_outline_rounded,
      Icons.show_chart_rounded,
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(3, (i) {
          final active = _selected == i;
          return GestureDetector(
            onTap: () => setState(() => _selected = i),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: active ? AppColors.primary : AppColors.iconBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icons[i],
                size: 18,
                color: active ? Colors.white : AppColors.textSecondary,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildBarChart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 10,
          barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (v, _) {
                  const labels = ['Ene', 'Feb', 'Mar', 'Abr', 'May'];
                  final i = v.toInt();
                  if (i < 0 || i >= labels.length) return const SizedBox();
                  return Text(
                    labels[i],
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.textSecondary,
                    ),
                  );
                },
              ),
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (_) => const FlLine(
              color: AppColors.divider,
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: [
            _bar(0, 3),
            _bar(1, 5),
            _bar(2, 7),
            _bar(3, 4),
            _bar(4, 6),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _bar(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: AppColors.primary.withValues(alpha: 0.7),
          width: 18,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
        ),
      ],
    );
  }

  Widget _buildPieChart() {
    return PieChart(
      PieChartData(
        sectionsSpace: 2,
        centerSpaceRadius: 40,
        sections: [
          PieChartSectionData(
            value: 40,
            color: AppColors.primary,
            radius: 50,
            title: '40%',
            titleStyle: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          PieChartSectionData(
            value: 30,
            color: AppColors.primaryLight,
            radius: 50,
            title: '30%',
            titleStyle: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          PieChartSectionData(
            value: 20,
            color: AppColors.iconBg,
            radius: 50,
            title: '20%',
            titleStyle: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          PieChartSectionData(
            value: 10,
            color: Color(0xFF90CAF9),
            radius: 50,
            title: '10%',
            titleStyle: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLineChart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (_) => const FlLine(
              color: AppColors.divider,
              strokeWidth: 1,
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (v, _) {
                  const labels = ['Ene', 'Feb', 'Mar', 'Abr', 'May'];
                  final i = v.toInt();
                  if (i < 0 || i >= labels.length) return const SizedBox();
                  return Text(
                    labels[i],
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.textSecondary,
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          minY: 0,
          maxY: 10,
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 2),
                FlSpot(1, 5),
                FlSpot(2, 3),
                FlSpot(3, 7),
                FlSpot(4, 4),
              ],
              isCurved: true,
              color: AppColors.primary,
              barWidth: 2.5,
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.primary.withValues(alpha: 0.1),
              ),
              dotData: FlDotData(
                show: true,
                getDotPainter: (p0, p1, p2, p3) => FlDotCirclePainter(
                  radius: 4,
                  color: Colors.white,
                  strokeWidth: 2,
                  strokeColor: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
