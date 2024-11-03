import 'package:flutter/material.dart';

class ProfilScreen extends StatefulWidget {
  final String savedIntroduction;

  ProfilScreen({required this.savedIntroduction});

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  final TextEditingController _introductionController = TextEditingController();
  String introduction = "";

  // URL ile tanımlı avatar resimleri
  final List<String> _avatarImages = [
    'https://your-url-path/avatar1.jpg',
    'https://your-url-path/avatar2.jpg',
    'https://your-url-path/avatar3.jpg',
    'https://your-url-path/avatar4.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _introductionController.text = widget.savedIntroduction;
  }

  // Tanıtım metnini kaydetme fonksiyonu
  void _saveIntroduction() {
    setState(() {
      introduction = _introductionController.text;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Kayıt Edildi")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF393536), 
      appBar: AppBar(
        backgroundColor: const Color(0xFF393536), 
        title: const Text("Profil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            CircleAvatar(
              radius: 50,
              backgroundColor: const Color(0xFFE4DFD5), 
              child: const Icon(Icons.person, size: 50, color: Colors.black), 
            ),
            const SizedBox(height: 16),
            const Text(
              "Ebru Altıner",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFE4DFD5)),
            ),
            const SizedBox(height: 16),
            // Tanıtım metni girişi
            TextField(
              controller: _introductionController,
              decoration: InputDecoration(
                hintText: "Kendinizi Tanıtın",
                filled: true,
                fillColor: const Color(0xFFE4DFD5), 
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            
            ElevatedButton(
              onPressed: _saveIntroduction,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE4DFD5), 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text("Kaydet", style: TextStyle(color: Colors.black)), 
            ),
            if (introduction.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  "Kaydedilmiş Tanıtım: $introduction",
                  style: const TextStyle(color: Color(0xFFE4DFD5)),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 16),
            const Text(
              "Profil Fotoğrafları",
              style: TextStyle(fontSize: 16, color: Color(0xFFE4DFD5)),
            ),
            const SizedBox(height: 8),
            // Küçük avatar resimleri (seçim özelliği olmadan)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _avatarImages.map((image) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(image),
                    backgroundColor: Colors.transparent,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
