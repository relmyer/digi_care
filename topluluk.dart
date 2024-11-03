import 'package:flutter/material.dart';
import 'ToplulukSearchDelegate.dart';
import 'login.dart'; 
import 'sohbet.dart';

class Topluluk {
  final String name;
  final String description;

  Topluluk({required this.name, required this.description});
}

class ToplulukScreen extends StatefulWidget {
  const ToplulukScreen({Key? key}) : super(key: key);

  @override
  _ToplulukScreenState createState() => _ToplulukScreenState();
}

class _ToplulukScreenState extends State<ToplulukScreen> {
  int _selectedIndex = 0;
  List<Topluluk> topluluklar = [
    Topluluk(name: "Siber zorbalıkla başa çıkma", description: "Sohbete katıl"),
    Topluluk(name: "Dijital güvenlik ve gizlilik", description: "Sohbete katıl"),
  ];

  void _onItemTapped(int index) {
    if (index == 1) {
     
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      ).then((_) {
       
        setState(() {
          _selectedIndex = 0;
        });
      });
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _createNewCommunity() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTitle = "";
        return AlertDialog(
          title: const Text("Yeni Topluluk Oluştur"),
          content: TextField(
            onChanged: (value) {
              newTitle = value;
            },
            decoration: const InputDecoration(hintText: "Topluluk Başlığı"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("İptal"),
            ),
            TextButton(
              onPressed: () {
                if (newTitle.isNotEmpty) {
                  setState(() {
                    topluluklar.add(
                      Topluluk(name: newTitle, description: "Sohbete katıl"),
                    );
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Oluştur"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF393536), 
      appBar: AppBar(
        backgroundColor: const Color(0xFFB0A89F), 
          "Topluluklarım",
          style: TextStyle(color: Colors.black), 
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black), 
            onPressed: () {
              showSearch(
                context: context,
                delegate: ToplulukSearchDelegate(topluluklar),
              ).then((query) {
                if (query != null) {
                  setState(() {
                   
                  });
                }
              });
            },
          ),
        ],
      ),
      body: _getBodyContent(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[800],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Topluluklarım',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewCommunity,
        backgroundColor: Colors.grey[700],
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _getBodyContent() {
    switch (_selectedIndex) {
      case 0:
        return topluluklarListesi();
      case 2:
        return const Center(child: Text('Home'));
      default:
        return const Center(child: Text('Topluluklarım'));
    }
  }

  Widget topluluklarListesi() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: topluluklar.length,
      itemBuilder: (context, index) {
        final topluluk = topluluklar[index];
        return Card(
          color: const Color(0xFFE4DFD5), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.black54,
              child: Icon(Icons.group, color: Colors.white),
            ),
            title: Text(topluluk.name),
            subtitle: Text(topluluk.description),
            onTap: () {
         
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SohbetScreen(
                    title: topluluk.name,
                    communityName: '',
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
