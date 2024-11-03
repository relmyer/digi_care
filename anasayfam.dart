import 'package:flutter/material.dart';

class ToplulukAnaSayfa extends StatelessWidget {
  const ToplulukAnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB0A89F),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
            ),
            const SizedBox(width: 10),
            const Text(
              "Topluluklar",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Ara",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Topluluklarım",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  toplulukKart("Stres Yönetimi", "assets/stress_management.jpg", "3+"),
                  toplulukKart("Kaygı Yönetimi", "assets/anxiety_management.jpg", "5+"),
                  toplulukKart("Dijital Güvenlik", "assets/digital_safety.jpg", "8+"),
                  // Daha fazla topluluk ekleyebilirsiniz
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Topluluk oluşturma işlevi
                },
                icon: const Icon(Icons.add),
                label: const Text("Topluluk Oluştur"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  backgroundColor: const Color(0xFFB0A89F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget toplulukKart(String title, String imagePath, String memberCount) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: const Color(0xFF6D6A69),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                const Icon(Icons.people, color: Colors.white, size: 20),
                const SizedBox(width: 4),
                Text(
                  memberCount,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
