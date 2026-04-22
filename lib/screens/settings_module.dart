import 'package:flutter/material.dart';
import 'dart:ui';

// ==================== 设置模块 ====================
class SettingsModule extends StatefulWidget {
  const SettingsModule({super.key});

  @override
  State<SettingsModule> createState() => _SettingsModuleState();
}

class _SettingsModuleState extends State<SettingsModule> {
  bool _darkMode = false;
  bool _notifications = true;
  bool _soundEnabled = true;
  bool _autoDownload = false;
  String _selectedLanguage = '简体中文';
  String _selectedModel = 'GPT-4o';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 顶部标题
              _buildHeader(),
              const SizedBox(height: 24),
              // 账号设置
              _buildSectionTitle('账号设置'),
              _buildMenuItem('修改密码', Icons.lock_rounded, const Color(0xFF7C4DFF)),
              _buildMenuItem('绑定手机', Icons.phone_rounded, const Color(0xFF69F0AE)),
              _buildMenuItem('账号安全', Icons.security_rounded, const Color(0xFFFF5252)),
              const SizedBox(height: 20),
              // 通用设置
              _buildSectionTitle('通用设置'),
              _buildToggleItem('深色模式', Icons.dark_mode_rounded, const Color(0xFF636E72), _darkMode, (v) => setState(() => _darkMode = v)),
              _buildToggleItem('消息通知', Icons.notifications_rounded, const Color(0xFFFFD740), _notifications, (v) => setState(() => _notifications = v)),
              _buildToggleItem('声音提醒', Icons.volume_up_rounded, const Color(0xFF448AFF), _soundEnabled, (v) => setState(() => _soundEnabled = v)),
              _buildToggleItem('自动下载', Icons.download_rounded, const Color(0xFF69F0AE), _autoDownload, (v) => setState(() => _autoDownload = v)),
              const SizedBox(height: 20),
              // AI设置
              _buildSectionTitle('AI 设置'),
              _buildSelectItem('AI模型', Icons.smart_toy_rounded, const Color(0xFF7C4DFF), _selectedModel, ['GPT-4o', 'Claude 3.5', 'Kimi', 'Gemini']),
              _buildSelectItem('语言', Icons.language_rounded, const Color(0xFF69F0AE), _selectedLanguage, ['简体中文', '繁體中文', 'English', '日本語']),
              const SizedBox(height: 20),
              // 其他
              _buildSectionTitle('其他'),
              _buildMenuItem('清除缓存', Icons.cleaning_services_rounded, const Color(0xFFFF9800)),
              _buildMenuItem('检查更新', Icons.update_rounded, const Color(0xFF448AFF)),
              _buildMenuItem('隐私政策', Icons.policy_rounded, const Color(0xFF636E72)),
              const SizedBox(height: 20),
              // 退出登录
              _buildLogoutButton(),
              const SizedBox(height: 20),
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
          '设置',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Color(0xFF2D3436),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF7C4DFF).withOpacity(0.8),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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

  Widget _buildToggleItem(String title, IconData icon, Color color, bool value, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF7C4DFF),
            activeTrackColor: const Color(0xFF7C4DFF).withOpacity(0.3),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xFF636E72).withOpacity(0.2),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectItem(String title, IconData icon, Color color, String value, List<String> options) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
          GestureDetector(
            onTap: () => _showSelectDialog(title, options, value),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF7C4DFF).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF7C4DFF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Color(0xFF7C4DFF),
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSelectDialog(String title, List<String> options, String current) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFE0F7FA),
                Color(0xFFF3E5F5),
              ],
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D3436),
                ),
              ),
              const SizedBox(height: 20),
              ...options.map((option) => GestureDetector(
                onTap: () {
                  setState(() {
                    if (title == 'AI模型') {
                      _selectedModel = option;
                    } else {
                      _selectedLanguage = option;
                    }
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: option == current
                        ? const Color(0xFF7C4DFF).withOpacity(0.15)
                        : Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: option == current
                          ? const Color(0xFF7C4DFF).withOpacity(0.3)
                          : Colors.white.withOpacity(0.4),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          option,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: option == current ? FontWeight.w600 : FontWeight.w500,
                            color: option == current
                                ? const Color(0xFF7C4DFF)
                                : const Color(0xFF2D3436),
                          ),
                        ),
                      ),
                      if (option == current)
                        const Icon(
                          Icons.check_rounded,
                          color: Color(0xFF7C4DFF),
                          size: 20,
                        ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFF5252).withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFFF5252).withOpacity(0.2),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.logout_rounded,
              color: Color(0xFFFF5252),
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              '退出登录',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFF5252),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== 玻璃容器组件 ====================
class GlassContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget child;

  const GlassContainer({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white.withOpacity(0.25),
        border: Border.all(
          color: Colors.white.withOpacity(0.4),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1F2687).withOpacity(0.1),
            blurRadius: 32,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: child,
        ),
      ),
    );
  }
}
