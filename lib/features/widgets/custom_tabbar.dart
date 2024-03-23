import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            5.0,
          ),
          border: Border.all(color: Colors.white)),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
          color: const Color(0xFF2B69A8),
        ),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        indicatorPadding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: Colors.white,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        tabs: const [
          Tab(
            text: 'John',
          ),
          Tab(
            text: 'Steve',
          ),
          Tab(
            text: 'Mike',
          ),
          Tab(
            text: 'Gori',
          ),
          Tab(
            text: 'Anna',
          ),
          Tab(
            text: '...',
          ),
        ],
      ),
    );
  }
}
