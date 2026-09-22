import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFF0F0F13),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const ShinnCheatApp());
}

class ShinnCheatApp extends StatelessWidget {
  const ShinnCheatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shinn Cheat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0F13),
        primaryColor: Colors.purpleAccent,
        fontFamily: 'sans-serif',
      ),
      home: const MainContainerScreen(),
    );
  }
}

class MainContainerScreen extends StatefulWidget {
  const MainContainerScreen({Key? key}) : super(key: key);

  @override
  State<MainContainerScreen> createState() => _MainContainerScreenState();
}

class _MainContainerScreenState extends State<MainContainerScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SourcesScreen(),
    const InstalledScreen(),
    const FilesScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
          // Floating Bottom Navigation Bar chuẩn không bị lẹm viền
          Positioned(
            left: 20,
            right: 20,
            bottom: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF161622).withOpacity(0.92),
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
                border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home_rounded, 'Home', 0),
                  _buildNavItem(Icons.layers_rounded, 'Sources', 1),
                  _buildNavItem(Icons.inventory_2_rounded, 'Installed', 2),
                  _buildNavItem(Icons.folder_rounded, 'Files', 3),
                  _buildNavItem(Icons.more_horiz_rounded, 'More', 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(horizontal: isSelected ? 12 : 8, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purpleAccent.withOpacity(0.18) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.purpleAccent : Colors.grey[500],
              size: 22,
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.purpleAccent,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ================= 1. HOME SCREEN =================
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentRole = 'Owner';

  void _showRoleSelector() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF161622),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Chọn vai trò để kích hoạt', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 16),
              _roleOptionItem('Owner', 'Quyền cao nhất', Icons.star, Colors.purpleAccent),
              _roleOptionItem('Admin', 'Quản lý hệ thống', Icons.verified_user, Colors.blueAccent),
              _roleOptionItem('Member', 'Thành viên sử dụng', Icons.person, Colors.grey),
            ],
          ),
        );
      },
    );
  }

  Widget _roleOptionItem(String role, String desc, IconData icon, Color color) {
    bool isSelected = currentRole == role;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(role, style: TextStyle(fontWeight: F
