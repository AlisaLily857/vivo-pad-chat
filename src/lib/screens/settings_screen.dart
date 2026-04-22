import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: ListView(
        children: [
          _buildSectionHeader('账号'),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: const Icon(Icons.person),
            ),
            title: const Text('用户名'),
            subtitle: const Text('138****8888'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          
          _buildSectionHeader('外观'),
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('主题'),
            subtitle: const Text('跟随系统'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.format_size),
            title: const Text('字体大小'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          
          _buildSectionHeader('通知'),
          SwitchListTile(
            secondary: const Icon(Icons.notifications),
            title: const Text('消息通知'),
            subtitle: const Text('接收新消息提醒'),
            value: true,
            onChanged: (value) {},
          ),
          SwitchListTile(
            secondary: const Icon(Icons.volume_up),
            title: const Text('声音'),
            subtitle: const Text('播放提示音'),
            value: true,
            onChanged: (value) {},
          ),
          const Divider(),
          
          _buildSectionHeader('存储'),
          ListTile(
            leading: const Icon(Icons.storage),
            title: const Text('清理缓存'),
            subtitle: const Text('256 MB'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          
          _buildSectionHeader('关于'),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('版本'),
            subtitle: const Text('v0.1.0'),
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('隐私政策'),
            trailing: const Icon(Icons.open_in_new),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('帮助与反馈'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const SizedBox(height: 32),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FilledButton.tonal(
              onPressed: () {},
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('退出登录'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
      ),
    );
  }
}
