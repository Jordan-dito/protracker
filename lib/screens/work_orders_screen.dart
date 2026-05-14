import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';
import '../widgets/app_bar_actions.dart';
import '../widgets/app_drawer.dart';
import '../widgets/empty_state.dart';

class WorkOrdersScreen extends StatefulWidget {
  const WorkOrdersScreen({super.key});

  @override
  State<WorkOrdersScreen> createState() => _WorkOrdersScreenState();
}

class _WorkOrdersScreenState extends State<WorkOrdersScreen> {
  int _viewMode = 3; // clipboard selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: Builder(
          builder: (ctx) => IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () => Scaffold.of(ctx).openDrawer(),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tareas',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              'Órdenes de Trabajo',
              style: GoogleFonts.inter(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded, color: AppColors.textSecondary),
          ),
          const AppBarActions(),
        ],
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          _buildViewModeBar(),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.cardBorder),
                      ),
                      child: Stack(
                        children: [
                          const Center(child: EmptyState()),
                          Positioned(
                            top: 12,
                            right: 12,
                            child: Icon(
                              Icons.tune_rounded,
                              color: AppColors.textSecondary,
                              size: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                _buildBottomCount(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewModeBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.iconBg,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ViewModeBtn(
            icon: Icons.view_week_outlined,
            active: _viewMode == 0,
            onTap: () => setState(() => _viewMode = 0),
          ),
          _ViewModeBtn(
            icon: Icons.calendar_month_rounded,
            active: _viewMode == 1,
            onTap: () => setState(() => _viewMode = 1),
          ),
          _ViewModeBtn(
            icon: Icons.format_list_bulleted_rounded,
            active: _viewMode == 2,
            onTap: () => setState(() => _viewMode = 2),
          ),
          _ViewModeBtn(
            icon: Icons.assignment_outlined,
            active: _viewMode == 3,
            onTap: () => setState(() => _viewMode = 3),
          ),
          const Spacer(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_alt_outlined, size: 20),
                color: AppColors.primary,
              ),
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded, size: 20),
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomCount() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      color: Colors.white,
      child: Text(
        'Mostrando 0 de 0',
        style: GoogleFonts.inter(
          fontSize: 13,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _ViewModeBtn extends StatelessWidget {
  final IconData icon;
  final bool active;
  final VoidCallback onTap;

  const _ViewModeBtn({
    required this.icon,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: active ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Icon(
          icon,
          size: 20,
          color: active ? Colors.white : AppColors.textSecondary,
        ),
      ),
    );
  }
}
