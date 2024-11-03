import 'package:flutter/material.dart';

class SohbetScreen extends StatefulWidget {
  final String title;

  SohbetScreen({required this.title, required String communityName});

  @override
  _SohbetScreenState createState() => _SohbetScreenState();
}

class _SohbetScreenState extends State<SohbetScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {"text": "Merhaba! Bu konuda yardıma ihtiyacım var.", "isUserMessage": false, "name": "Barış Y."},
    {"text": "Tabii, nasıl yardımcı olabilirim?", "isUserMessage": true, "name": "Ebru A."},
    {"text": "Siber zorbalıkla başa çıkmak çok zor oluyor bazen.", "isUserMessage": false, "name": "Barış Y."},
    {"text": "Anlıyorum, böyle bir durum gerçekten zorlayıcı olabilir.", "isUserMessage": true, "name": "Ebru A."},
    {"text": "Başka ne yapabileceğim konusunda önerileriniz var mı?", "isUserMessage": false, "name": "Barış Y."},
    {"text": "Destek gruplarına katılmak iyi bir başlangıç olabilir.", "isUserMessage": true, "name": "Ebru A."},
  ];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({
          "text": _controller.text,
          "isUserMessage": true,
          "name": "Ebru A.", // Assuming this is the user's name
        });
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.grey[300],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          centerTitle: true,
          title: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageBubble(
                  message["text"],
                  isUserMessage: message["isUserMessage"],
                  name: message["name"],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Mesaj gönder",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  backgroundColor: Colors.grey[700],
                  onPressed: _sendMessage,
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[300],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildMessageBubble(String message, {required bool isUserMessage, required String name}) {
    return Column(
      crossAxisAlignment: isUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isUserMessage)
              const CircleAvatar(
                backgroundImage: AssetImage("assets/baris_avatar.jpg"),
                backgroundColor: Colors.grey,
              ),
            if (!isUserMessage) const SizedBox(width: 8),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            if (isUserMessage) const SizedBox(width: 8),
            if (isUserMessage)
              const CircleAvatar(
                backgroundImage: AssetImage("assets/ebru_avatar.jpg"),
                backgroundColor: Colors.grey,
              ),
          ],
        ),
      ],
    );
  }
}
