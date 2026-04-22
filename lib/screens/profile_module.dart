import 'package:flutter/material.dart';
import 'dart:ui';

// 玻璃容器组件
class GlassContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget child;
  final double borderRadius;

  const GlassContainer({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.padding,
    required this.child,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.white.withOpacity(0.20),
        border: Border.all(
          color: Colors.white.withOpacity(0.35),
          width: 0.8,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1F2687).withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: child,
        ),
      ),
    );
  }
}

// ==================== 个人中心模块 ====================
class ProfileModule extends StatelessWidget {
  const ProfileModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE0F7FA),
            Color(0xFFF3E5F5),
            Color(0xFFE8F5E9),
          ],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // 顶部标题
              _buildHeader(),
              const SizedBox(height: 24),
              // 用户信息卡片
              _buildUserCard(),
              const SizedBox(height: 20),
              // 统计卡片
              _buildStatsRow(),
              const SizedBox(height: 20),
              // 功能菜单
              _buildMenuSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const Text(
          '我的',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Color(0xFF2D3436),
          ),
        ),
        const Spacer(),
        _buildIconButton(Icons.edit_outlined, () {}),
      ],
    );
  }

  Widget _buildUserCard() {
    return GlassContainer(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // 头像
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF7C4DFF), Color(0xFF69F0AE)],
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF7C4DFF).withOpacity(0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'A',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Alisa',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2D3436),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'alisa@example.com',
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xFF636E72).withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF7C4DFF), Color(0xFF69F0AE)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.verified_rounded,
                  color: Colors.white,
                  size: 14,
                ),
                SizedBox(width: 6),
                Text(
                  'VIP 会员',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard('1284', '消息', Icons.message_rounded, const Color(0xFF7C4DFF)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard('42', 'AI对话', Icons.auto_awesome_rounded, const Color(0xFF69F0AE)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard('18', '好友', Icons.people_rounded, const Color(0xFFFFD740)),
        ),
      ],
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon, Color color) {
    return GlassContainer(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2D3436),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: const Color(0xFF636E72).withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection() {
    return Column(
      children: [
        _buildMenuItem('我的收藏', Icons.bookmark_rounded, const Color(0xFFFF5252)),
        _buildMenuItem('文件管理', Icons.folder_rounded, const Color(0xFF448AFF)),
        _buildMenuItem('通知设置', Icons.notifications_rounded, const Color(0xFFFFD740)),
        _buildMenuItem('隐私安全', Icons.shield_rounded, const Color(0xFF69F0AE)),
        _buildMenuItem('帮助反馈', Icons.help_rounded, const Color(0xFF7C4DFF)),
        _buildMenuItem('关于我们', Icons.info_rounded, const Color(0xFF636E72)),
      ],
    );
  }

  Widget _buildMenuItem(String title, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.35),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2D3436),
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: const Color(0xFF636E72).withOpacity(0.5),
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.white.withOpacity(0.4),
          ),
        ),
        child: Icon(
          icon,
          color: const Color(0xFF636E72),
          size: 20,
        ),
      ),
    );
  }
}
