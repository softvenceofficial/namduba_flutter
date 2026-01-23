import 'package:nanduba/export.dart';

import 'package:nanduba/views/inbox/chat_list/chat_list.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/screen/new_profile_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key, this.selected});
  final int? selected;
  @override
  BottomNavbarState createState() => BottomNavbarState();
}

class BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const CarSales(),
    const ServicesScreen(),
    ChatList(),
    const NewProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _selectedIndex = widget.selected ?? _selectedIndex;
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final itemWidth = width / 5;
      final indicatorWidth = 4.w;

      return Stack(
        children: [
          BottomNavigationBar(
            backgroundColor: AppColors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: onTap,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.bottomNav,
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppSvgs.home),
                activeIcon: SvgPicture.asset(
                  AppSvgs.home,
                  color: AppColors.primary,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppSvgs.shop),
                activeIcon: SvgPicture.asset(
                  AppSvgs.shop,
                  color: AppColors.primary,
                ),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppSvgs.request),
                activeIcon: SvgPicture.asset(
                  AppSvgs.request,
                  color: AppColors.primary,
                ),
                label: 'Request',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppSvgs.inbox),
                activeIcon: SvgPicture.asset(
                  AppSvgs.inbox,
                  color: AppColors.primary,
                ),
                label: 'Message',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppSvgs.menu),
                activeIcon: SvgPicture.asset(
                  AppSvgs.menu,
                  color: AppColors.primary,
                ),
                label: 'More',
              ),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: itemWidth * currentIndex + (itemWidth - indicatorWidth) / 2,
            top: 0,
            child: Container(
              width: indicatorWidth,
              height: 0.3.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(2.sp),
              ),
            ),
          ),
        ],
      );
    });
  }
}
