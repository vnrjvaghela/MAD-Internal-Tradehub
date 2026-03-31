import 'package:flutter/material.dart';
import 'package:tradehub/theme/app_theme.dart';

class ChatScreen extends StatefulWidget {
  final String sellerName;

  const ChatScreen({super.key, required this.sellerName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [
    Message(text: "Hi, is this still available?", isMe: true, time: "10:00 AM"),
    Message(text: "Yes, it is! Are you interested?", isMe: false, time: "10:05 AM"),
  ];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _messages.add(Message(text: _controller.text, isMe: true, time: "Now"));
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(widget.sellerName[0], style: const TextStyle(color: AppTheme.saffron)),
            ),
            const SizedBox(width: 12),
            Text(widget.sellerName),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return Align(
                  alignment: msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: msg.isMe ? AppTheme.saffron : Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: msg.isMe ? const Radius.circular(16) : const Radius.circular(0),
                        bottomRight: msg.isMe ? const Radius.circular(0) : const Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          msg.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Text(
                          msg.text,
                          style: TextStyle(
                            color: msg.isMe ? Colors.white : Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          msg.time,
                          style: TextStyle(
                            color: msg.isMe ? Colors.white70 : Colors.black54,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(icon: const Icon(Icons.attach_file), onPressed: () {}),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: AppTheme.saffron),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;
  final String time;

  Message({required this.text, required this.isMe, required this.time});
}
