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

// ==================== 聊天模块 ====================
class ChatModule extends StatefulWidget {
  const ChatModule({super.key});

  @override
  State<ChatModule> createState() => _ChatModuleState();
}

class _ChatModuleState extends State<ChatModule> {
  final List<Map<String, dynamic>> _chats = [
    {
      'name': '设计团队',
      'avatar': '设',
      'lastMessage': '新UI方案已经上传了，大家看一下',
      'time': '09:30',
      'unread': 3,
      'online': true,
    },
    {
      'name': '产品经理',
      'avatar': '产',
      'lastMessage': '明天下午3点开会讨论需求',
      'time': '08:45',
      'unread': 1,
      'online': false,
    },
    {
      'name': 'Sarah Chen',
      'avatar': 'S',
      'lastMessage': '收到，我尽快处理',
      'time': '昨天',
      'unread': 0,
      'online': true,
    },
    {
      'name': '开发小组',
      'avatar': '开',
      'lastMessage': 'API接口已经联调完成',
      'time': '昨天',
      'unread': 0,
      'online': false,
    },
    {
      'name': '李明',
      'avatar': '李',
      'lastMessage': '周末一起吃饭吗？',
      'time': '周一',
      'unread': 0,
      'online': true,
    },
  ];

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
        child: Column(
          children: [
            // 顶部栏
            _buildHeader(),
            // 搜索框
            _buildSearchBar(),
            // 聊天列表
            Expanded(
              child: _buildChatList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const Text(
            '消息',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2D3436),
            ),
          ),
          const Spacer(),
          _buildIconButton(Icons.edit_square, () {}),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return GlassContainer(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(
            Icons.search_rounded,
            color: const Color(0xFF636E72).withOpacity(0.6),
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(
            '搜索聊天记录',
            style: TextStyle(
              color: const Color(0xFF636E72).withOpacity(0.5),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      itemCount: _chats.length,
      itemBuilder: (context, index) {
        final chat = _chats[index];
        return _buildChatItem(chat);
      },
    );
  }

  Widget _buildChatItem(Map<String, dynamic> chat) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatRoomScreen(
              name: chat['name'],
              avatar: chat['avatar'],
              online: chat['online'],
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.35),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1F2687).withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // 头像
            Stack(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7C4DFF), Color(0xFF69F0AE)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF7C4DFF).withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      chat['avatar'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                if (chat['online'])
                  Positioned(
                    right: 2,
                    bottom: 2,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF69F0AE),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            // 内容
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        chat['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2D3436),
                        ),
                      ),
                      Text(
                        chat['time'],
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color(0xFF636E72).withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat['lastMessage'],
                          style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xFF636E72).withOpacity(0.7),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (chat['unread'] > 0) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF7C4DFF), Color(0xFF69F0AE)],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            chat['unread'].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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

// ==================== 聊天室页面 ====================
class ChatRoomScreen extends StatefulWidget {
  final String name;
  final String avatar;
  final bool online;

  const ChatRoomScreen({
    super.key,
    required this.name,
    required this.avatar,
    required this.online,
  });

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      'isMe': false,
      'text': '你好！最近项目进展如何？',
      'time': '09:30',
    },
    {
      'isMe': true,
      'text': '挺顺利的，UI设计已经完成初稿了',
      'time': '09:31',
    },
    {
      'isMe': false,
      'text': '太好了！能发给我看看吗？',
      'time': '09:32',
    },
    {
      'isMe': true,
      'text': '已经上传到共享文件夹了，你可以直接查看',
      'time': '09:33',
    },
  ];

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
        child: Column(
          children: [
            // 顶部栏
            _buildHeader(),
            // 消息列表
            Expanded(
              child: _buildMessageList(),
            ),
            // 输入框
            _buildInputArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return GlassContainer(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Color(0xFF636E72),
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF7C4DFF), Color(0xFF69F0AE)],
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                widget.avatar,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D3436),
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: widget.online
                          ? const Color(0xFF69F0AE)
                          : const Color(0xFF636E72),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    widget.online ? '在线' : '离线',
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xFF636E72).withOpacity(0.7),
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

  Widget _buildMessageList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final msg = _messages[index];
        return _buildMessageBubble(
          msg['text'],
          msg['isMe'],
          msg['time'],
        );
      },
    );
  }

  Widget _buildMessageBubble(String text, bool isMe, String time) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              decoration: BoxDecoration(
                gradient: isMe
                    ? const LinearGradient(
                        colors: [Color(0xFF7C4DFF), Color(0xFF69F0AE)],
                      )
                    : null,
                color: isMe ? null : Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(18),
                  topRight: const Radius.circular(18),
                  bottomLeft: Radius.circular(isMe ? 18 : 4),
                  bottomRight: Radius.circular(isMe ? 4 : 18),
                ),
                border: isMe
                    ? null
                    : Border.all(
                        color: Colors.white.withOpacity(0.5),
                      ),
                boxShadow: [
                  BoxShadow(
                    color: isMe
                        ? const Color(0xFF7C4DFF).withOpacity(0.2)
                        : const Color(0xFF1F2687).withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : const Color(0xFF2D3436),
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(
                fontSize: 11,
                color: const Color(0xFF636E72).withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return GlassContainer(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          _buildIconButton(Icons.add_rounded, () {}),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: '输入消息...',
                  hintStyle: TextStyle(
                    color: const Color(0xFF636E72).withOpacity(0.5),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
                style: const TextStyle(
                  color: Color(0xFF2D3436),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          _buildIconButton(Icons.mic_rounded, () {}),
          const SizedBox(width: 8),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF7C4DFF), Color(0xFF69F0AE)],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF7C4DFF).withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.send_rounded,
              color: Colors.white,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
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
