import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final String label;
  final String? badgeText;
  final int index;
  final IconData icon;
  final Function()? onNavTap;

  const BottomNavItem({
    Key? key,
    required this.index,
    required this.icon,
    required this.onNavTap,
    required this.label,
    this.badgeText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    final currentIndex = tabsRouter.activeIndex;
    final Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onNavTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn,
            height: index == currentIndex ? 55 : 50,
            transform: Matrix4.translationValues(
                0.0, index == currentIndex ? -20 : -5, 0.0),
            width: size.width / 4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == currentIndex
                  ? const Color(0xFFf172ac)
                  : const Color(0x00f172ac),
              border: Border.all(
                  width: 4,
                  color: index == currentIndex
                      ? const Color(0xFFF5F3FA)
                      : const Color(0x00F5F3FA)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                badgeText != null && badgeText != '0'
                    ? Badge(
                        badgeStyle:
                            const BadgeStyle(badgeColor: Color(0xFFDB2777)),
                        badgeContent: Text(
                          badgeText!,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                        child: Icon(
                          icon,
                          size: 30,
                          color: const Color(0xFF2C2B7A),
                        ),
                      )
                    : Icon(
                        icon,
                        size: 30,
                        color: const Color(0xFF2C2B7A),
                      ),
              ],
            ),
          ),
          Container(
            transform: Matrix4.translationValues(
                0.0, index == currentIndex ? -15 : -10, 0.0),
            child: Text(
              label.toUpperCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: Color(0xFF2C2B7A)),
            ),
          )
        ],
      ),
    );
  }
}
