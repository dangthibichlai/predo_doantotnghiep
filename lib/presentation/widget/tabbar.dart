import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_intern/core/hepler/common_helper.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/presentation/widget/indicator_tab_bar_painter.dart';
import 'package:test_intern/resources/app_color.dart';

class ExpertsTabBar extends StatefulWidget {
  const ExpertsTabBar({super.key, required this.onTap});
  final Function(int index) onTap;

  @override
  State<ExpertsTabBar> createState() => _ExpertsTabBarState();
}

class _ExpertsTabBarState extends State<ExpertsTabBar> {
  int _currentIndex = 0;
  List<String> _tabBar = [
    'Board',
    'Backlog',
    'Timeline',
    'Settings',
  ];

  ///
  /// On change tab bar.
  ///
  void _onChangeTabBar(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        //  margin: SizeApp.setEdgeInsetsOnly(top: kToolbarHeight),
        width: SizeApp.getMaxWidth(),
        height: 70,
        child: TabBar(
          // bỏ bottom line của tabbar
          dividerColor: Colors.transparent,

          indicatorColor: Colors.transparent,

          onTap: (value) {
            CommonHelper.onTapHandler(callback: () {
              _onChangeTabBar(value);
            });

            widget.onTap(value);
          },
          tabs: [
            ...List.generate(
              4,
              (index) {
                return Tab(
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          _tabBar[index],
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: _currentIndex == index
                                    ? ColorResources.MAIN_APP
                                    : ColorResources.BLACK.withOpacity(1),
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                        ),
                      ),
                      if (_currentIndex == index)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: CustomPaint(
                            size: Size(SizeApp.setSizeWithWidth(percent: .5),
                                (SizeApp.setSizeWithWidth(percent: .5) * 0.008064516129032258).toDouble()),
                            painter: IndicatorExpertTabBarPainter(),
                          ),
                        )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
