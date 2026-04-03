import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/app_theme.dart';
import 'theme/app_colors.dart';
import 'screens/home_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/profile_screen.dart';
import 'widgets/panah_app_bar.dart';
import 'widgets/bottom_nav_bar.dart';

void main() {
  runApp(const PanahApp());
}

class PanahApp extends StatelessWidget {
  const PanahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panah',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    WalletScreen(),
    _PlaceholderScreen(title: 'Services', icon: Icons.room_service_outlined),
    _PlaceholderScreen(title: 'Access', icon: Icons.qr_code_2_outlined),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Column(
        children: [
          const PanahAppBar(),
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: _screens,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  final String title;
  final IconData icon;

  const _PlaceholderScreen({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, size: 36, color: AppColors.primary),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Coming Soon',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              color: AppColors.outline,
            ),
          ),
        ],
      ),
    );
  }
}
