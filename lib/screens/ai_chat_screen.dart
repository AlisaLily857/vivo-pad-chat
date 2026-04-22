import 'package:flutter/material.dart';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({super.key});

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      'role': 'ai',
      'content': '你好！我是你的 AI 助手。有什么我可以帮你的吗？',
      'timestamp': DateTime.now(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              radius: 16,
              child: Icon(Icons.smart_toy, size: 20),
            ),
            SizedBox(width: 8),
            Text('AI 助手'),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'gpt4', child: Text('GPT-4o')),
              const PopupMenuItem(value: 'claude', child: Text('Claude 3.5')),
              const PopupMenuItem(value: 'kimi', child: Text('Kimi')),
            ],
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text('GPT-4o'),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isAI = msg['role'] == 'ai';
                
                return Align(
                  alignment: isAI ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    decoration: BoxDecoration(
                      color: isAI
                          ? Theme.of(context).colorScheme.surfaceVariant
                          : Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: Radius.circular(isAI ? 4 : 16),
                        bottomRight: Radius.circular(isAI ? 16 : 4),
                      ),
                    ),
                    child: Text(msg['content']),
                  ),
                );
              },
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: '输入消息...',
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceVariant,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              maxLines: null,
              textInputAction: TextInputAction.send,
              onSubmitted: _sendMessage,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _sendMessage(_controller.text),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    
    setState(() {
      _messages.add({
        'role': 'user',
        'content': text,
        'timestamp': DateTime.now(),
      });
      _controller.clear();
    });

    // TODO: 调用 AI API
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.add({
          'role': 'ai',
          'content': '收到你的消息：$text\n\n这是一个模拟回复。实际使用时需要接入 AI API。',
          'timestamp': DateTime.now(),
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
