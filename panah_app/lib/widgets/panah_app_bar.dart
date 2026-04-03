import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class PanahAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final String? title;
  final List<Widget>? actions;

  const PanahAppBar({
    super.key,
    this.showBackButton = false,
    this.title,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              if (showBackButton) ...[
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.onSurface,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                if (title != null)
                  Text(
                    title!,
                    style: GoogleFonts.manrope(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onSurface,
                    ),
                  ),
              ] else ...[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.outlineVariant.withOpacity(0.1),
                    ),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuCgR6LO4d7_-5FqfE3ttdWFvHA16jLDgQDiRLqS7MbrsO3ayUhS6uR4HcVP_uQ4y66tQVsQ-nv8aavtUCV70H7wogIuTkVCKeDxPex7yzzLtTX0s2lRu5nWIzXjlQ2zGyEL-OmFdex34JGH7-rFKJb8g4XF3ngSwxs4YR8n7nUW9xDfSp_F9M9cwaDQUKiorsoVj6l_ueFbwmbMNxaPojbK_s7Sfi0l14N_g4ENtzdIYEWOfktVj606lfZ_TLHuV18j1BoG7rJgUbU',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: AppColors.surfaceContainerHigh,
                        child: const Icon(Icons.person, size: 20, color: AppColors.outline),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Panah',
                  style: GoogleFonts.manrope(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryContainer,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
              const Spacer(),
              if (actions != null)
                ...actions!
              else
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLowest,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.onSurface.withOpacity(0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: AppColors.primaryContainer,
                      size: 22,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
