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
          // Thanh điều hướng nổi dưới màn hình (Floating Bottom Bar)
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

// 1. HOME SCREEN
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.between,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.star, color: Colors.purpleAccent, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Shinn Cheat', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                      SizedBox(height: 2),
                      Text('v2.0', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1B1B25),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white.withOpacity(0.06)),
                ),
                child: IconButton(
                  icon: const Icon(Icons.settings, color: Colors.blueAccent, size: 20),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF5B16D0), Color(0xFF1B6CE3)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.25),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(Icons.phone_iphone_rounded, color: Colors.white70, size: 28),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(color: Colors.greenAccent, shape: BoxShape.circle),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Welcome,\nShinn', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, height: 1.2)),
                      SizedBox(height: 8),
                      Text('Device Status:', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      SizedBox(height: 2),
                      Text('Connected', style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                ),
                const Text('Better Tools\nFor Your\nGame', textAlign: TextAlign.right, style: TextStyle(color: Colors.white70, fontSize: 11, height: 1.4)),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const Text('Chọn vai trò đăng nhập', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: _buildRoleCard('Owner', 'Quyền cao nhất', Icons.star, Colors.purpleAccent)),
              const SizedBox(width: 14),
              Expanded(child: _buildRoleCard('Admin', 'Quản lý hệ thống', Icons.verified_user, Colors.blueAccent)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoleCard(String title, String subtitle, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF181822),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 14),
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: Colors.grey[500], fontSize: 11)),
        ],
      ),
    );
  }
}

// 2. SOURCES SCREEN
class SourcesScreen extends StatelessWidget {
  const SourcesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'title': 'Tất cả gói', 'count': '27 gói', 'icon': Icons.grid_view_rounded},
      {'title': 'AIM', 'count': '7 gói', 'icon': Icons.gps_fixed_rounded},
      {'title': 'ESP', 'count': '4 gói', 'icon': Icons.visibility_rounded},
      {'title': 'Free Fire', 'count': '3 gói', 'icon': Icons.local_fire_department_rounded},
      {'title': 'Free Fire Max', 'count': '3 gói', 'icon': Icons.auto_awesome_rounded},
      {'title': 'MOD SKIN', 'count': '5 gói', 'icon': Icons.checkroom_rounded},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('SHINN CHEAT', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.1)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.send_rounded, color: Colors.white70), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 110),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF181822),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.white.withOpacity(0.06)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.star, color: Colors.purpleAccent, size: 18),
                    SizedBox(width: 6),
                    Text('APP', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text('SHINN CHEAT', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 1.5, color: Colors.white)),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    color: Colors.black26,
                    child: const Center(child: Icon(Icons.image, size: 50, color: Colors.white24)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.between,
            children: [
              const Text('DANH MỤC GÓI', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70, fontSize: 13, letterSpacing: 0.8)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(color: const Color(0xFF181822), borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: const [
                    Icon(Icons.person, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text('Member', style: TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...categories.map((cat) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFF181822),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white.withOpacity(0.04)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.circular(12)),
                  child: Icon(cat['icon'] as IconData, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cat['title'] as String, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                      const SizedBox(height: 2),
                      Text(cat['count'] as String, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[600], size: 14),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

// 3. INSTALLED SCREEN
class InstalledScreen extends StatelessWidget {
  const InstalledScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Đã cài đặt (Installed Packages)', style: TextStyle(color: Colors.grey, fontSize: 16))),
    );
  }
}

// 4. FILES SCREEN
class FilesScreen extends StatelessWidget {
  const FilesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Quản lý File hệ thống', style: TextStyle(color: Colors.grey, fontSize: 16))),
    );
  }
}

// 5. MORE / ABOUT SCREEN
class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          onPressed: () {},
        ),
        title: const Text('Giới Thiệu', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 110),
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF181822),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withOpacity(0.06)),
                  ),
                  child: const Icon(Icons.star, color: Colors.white, size: 36),
                ),
                const SizedBox(height: 16),
                const Text('SHINN CHEAT', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 1.2)),
                const SizedBox(height: 4),
                Text('Play Smart • Stay Ahead', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(color: const Color(0xFF1E1E2C), borderRadius: BorderRadius.circular(20)),
                  child: const Text('App được make bởi Shinn', style: TextStyle(color: Colors.purpleAccent, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Shinn Cheat là ứng dụng quản lý và phân phối các package được cấu hình thông qua repository của Shinn.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[400], fontSize: 13, height: 1.4),
          ),
          const SizedBox(height: 24),
          const Text('Liên hệ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70, fontSize: 13)),
          const SizedBox(height: 12),
          _buildActionItem(Icons.send_rounded, 'Telegram', '@ShinnThieuu', Icons.north_east_rounded),
          _buildActionItem(Icons.favorite_rounded, 'Donate • MB Bank', '104877777', Icons.copy_rounded),
          _buildActionItem(Icons.sync_rounded, 'Remote JSON', 'Cập nhật dữ liệu từ repository', Icons.settings_accessibility_rounded),
          _buildActionItem(Icons.verified_rounded, 'SHA256', 'Kiểm tra tính toàn vẹn của file', null),
        ],
      ),
    );
  }

  Widget _buildActionItem(IconData icon, String title, String subtitle, IconData? trailingIcon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF181822),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.04)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 2),
                Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
              ],
            ),
          ),
          if (trailingIcon != null) Icon(trailingIcon, color: Colors.grey[500], size: 16),
        ],
      ),
    );
  }
}
