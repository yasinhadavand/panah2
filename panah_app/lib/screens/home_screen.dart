import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Section
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back, Julian',
                  style: GoogleFonts.manrope(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: AppColors.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 14, color: AppColors.slate500),
                    const SizedBox(width: 4),
                    Text(
                      'Villa 402 – The Gardens',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13,
                        color: AppColors.slate500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Balance Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: _buildBalanceCard(),
          ),
          const SizedBox(height: 28),

          // Unit Consumption
          _buildSectionHeader('Unit Consumption', 'ANALYTICS'),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(child: _buildConsumptionCard(
                  icon: Icons.bolt,
                  iconColor: AppColors.amber500,
                  label: 'ELECTRICITY',
                  value: '452',
                  unit: 'kWh',
                  change: '-4%',
                  changeColor: AppColors.green600,
                  changeBg: AppColors.green50,
                  borderColor: AppColors.primary,
                )),
                const SizedBox(width: 12),
                Expanded(child: _buildConsumptionCard(
                  icon: Icons.water_drop_outlined,
                  iconColor: AppColors.blue400,
                  label: 'WATER',
                  value: '12.4',
                  unit: 'm³',
                  change: '+2%',
                  changeColor: AppColors.red600,
                  changeBg: AppColors.red50,
                  borderColor: AppColors.amber800.withOpacity(0.6),
                )),
              ],
            ),
          ),
          const SizedBox(height: 28),

          // Access
          _buildSectionHeader('Access', 'MANAGE'),
          const SizedBox(height: 12),
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                _buildAccessCard(
                  icon: Icons.fitness_center,
                  title: 'Health Club Elite',
                  badge: 'Active Sub',
                  subtitle: 'Expires Oct 24, 2024',
                  codeLabel: 'ENTRY CODE',
                  codeValue: 'GH-9921',
                  opacity: 1.0,
                ),
                const SizedBox(width: 12),
                _buildAccessCard(
                  icon: Icons.restaurant,
                  title: 'The Grand Dining',
                  subtitle: 'Table Reservation',
                  codeLabel: 'GUESTS',
                  codeValue: '4 PERSONS',
                  opacity: 0.6,
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),

          // Recent Updates
          _buildSectionHeader('Recent Updates', 'HISTORY'),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                _buildUpdateItem(
                  icon: Icons.inventory_2_outlined,
                  iconBg: AppColors.orange50,
                  iconColor: AppColors.orange600,
                  title: 'Package Delivered',
                  subtitle: 'Your Amazon package has been placed in...',
                  time: '10:45 AM',
                ),
                const SizedBox(height: 10),
                _buildUpdateItem(
                  icon: Icons.directions_car_outlined,
                  iconBg: AppColors.red50,
                  iconColor: AppColors.red600,
                  title: 'Valet Request',
                  subtitle: 'Your vehicle is now waiting for you at the...',
                  time: '09:15 AM',
                ),
                const SizedBox(height: 10),
                _buildUpdateItem(
                  icon: Icons.cleaning_services_outlined,
                  iconBg: AppColors.slate50,
                  iconColor: AppColors.slate600,
                  title: 'Housekeeping Ready',
                  subtitle: 'The scheduled cleaning for Villa 402 is...',
                  time: 'YESTERDAY',
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),

          // Concierge Services
          _buildSectionHeader('Concierge Services', 'EXPLORE'),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(child: _buildServiceCard(
                  icon: Icons.fitness_center,
                  title: 'Health Club',
                  subtitle: 'Open until 11 PM',
                  buttonText: 'BOOK NOW',
                )),
                const SizedBox(width: 12),
                Expanded(child: _buildServiceCard(
                  icon: Icons.spa_outlined,
                  title: 'Serenity Spa',
                  subtitle: '2 slots available',
                  buttonText: 'SCHEDULE',
                )),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.onSurface,
            ),
          ),
          Text(
            action,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: AppColors.amber800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryContainer, AppColors.primary],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -16,
            bottom: -16,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TOTAL BALANCE',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 3,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  Icon(Icons.account_balance_wallet_outlined,
                    color: Colors.white.withOpacity(0.8), size: 24),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                '\$12,450.00',
                style: GoogleFonts.manrope(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.stars, size: 12, color: Colors.amber[400]),
                        const SizedBox(width: 4),
                        Text(
                          'PREMIUM TIER',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      'TOP UP',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildConsumptionCard({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required String unit,
    required String change,
    required Color changeColor,
    required Color changeBg,
    required Color borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border(left: BorderSide(color: borderColor, width: 4)),
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.slate50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 16, color: iconColor),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: changeBg,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  change,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: changeColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: AppColors.slate400,
            ),
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: GoogleFonts.manrope(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.onSurface,
                  ),
                ),
                TextSpan(
                  text: ' $unit',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    color: AppColors.slate400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccessCard({
    required IconData icon,
    required String title,
    String? badge,
    required String subtitle,
    required String codeLabel,
    required String codeValue,
    required double opacity,
  }) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.surfaceContainerLow),
          boxShadow: [
            BoxShadow(
              color: AppColors.onSurface.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.slate50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: AppColors.primary, size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              title,
                              style: GoogleFonts.manrope(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.onSurface,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (badge != null) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF8E1),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Text(
                                badge.toUpperCase(),
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.amber700,
                                  letterSpacing: -0.2,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 11,
                          color: AppColors.slate400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.slate50),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    codeLabel,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                      color: AppColors.slate400,
                    ),
                  ),
                  Text(
                    codeValue,
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdateItem({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.onSurface,
                      ),
                    ),
                    Text(
                      time,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: AppColors.slate400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    color: AppColors.slate500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String buttonText,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF8E1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: AppColors.amber700, size: 24),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              color: AppColors.slate400,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                buttonText,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                  color: AppColors.onSurface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
