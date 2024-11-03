import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;
  late YoutubePlayerController _controller3;

  @override
  void initState() {
    super.initState();
    _controller1 = YoutubePlayerController(
      initialVideoId: 'S-e8ptwdXRE',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    _controller2 = YoutubePlayerController(
      initialVideoId: 'rAs3ZKXmGII',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    _controller3 = YoutubePlayerController(
      initialVideoId: 'HiyUQPq0Ocg',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bilgilenelim'),
        backgroundColor: const Color(0xFFB0A89F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: const Color(0xFF352F30), // Arka plan rengi
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoBox(
                  title: 'Siber zorbalık ile karşılaşıldığında:',
                  content: '''
. Sizi rahatsız eden kişiyle iletişiminize son verin.
. Hesaplarınızı korunaklı hale getirin, herkesin erişimine açmayın.
. Zorbalık ısrarla devam ediyorsa güvendiğiniz kişilere/ebeveynlerinize durumu anlatın.
. Zorbalığa maruz kaldığınız platformlara gerekli şikayetleri yapın.
. Zorbalığa maruz kaldığınız platformlardaki hesaplarınızı silin ya da dondurun.
. Tehlike altında olduğunuzu hissediyorsanız resmi makamlara şikayet edin.
. Ebeveynseniz çocuklarınıza güvenli internet kullanımı hakkında bilgi verin.
. Haklarınızı iyi bilin, sosyal mecraların zorbalıkla mücadele politikalarını inceleyin.
                  ''',
                ),
                const SizedBox(height: 16),
                _buildInfoBox(
                  title: 'Dijital Şiddet ve Çocuklarının Güvenliği:',
                  content: '''
Dijital şiddet, dünya genelinde kız çocuklarını ciddi şekilde etkileyen bir sorundur. UNICEF’in 2019 raporuna göre, dünya genelinde 10–19 yaş arasındaki kız çocuklarının %22’si çevrimiçi zorbalık veya dijital istismara maruz kalmaktadır. Türkiye’de BTK’nın 2023 verilerine göre, 13–19 yaş arasındaki kız çocuklarının %48’i dijital şiddetle karşı karşıya kalmaktadır.
                  ''',
                ),
                const SizedBox(height: 16),
                _buildVideoBox(
                  title: 'Dijital Atölye',
                  controller: _controller1,
                ),
                const SizedBox(height: 16),
                _buildVideoBox(
                  title: 'Online Güvenlik Rehberi',
                  controller: _controller2,
                ),
                const SizedBox(height: 16),
                _buildVideoBox(
                  title: 'Dijital Şiddet Farkındalığı',
                  controller: _controller3,
                ),
                const SizedBox(height: 16),
                _buildInfoBox(
                  title: 'Çevrimiçi Gizliliği Korumak İçin İpuçları:',
                  content: '''
. Güçlü, benzersiz şifreler kullanın.
. Sosyal medyada kişisel bilgilerinizi paylaşmaktan kaçının.
. İki faktörlü kimlik doğrulamayı etkinleştirin.
. Güvenmediğiniz bağlantılara tıklamayın.
. Güncellemeleri düzenli olarak yaparak cihazlarınızı koruyun.
                  ''',
                ),
                const SizedBox(height: 16),
                _buildInfoBox(
                  title: 'Çocukları Dijital Güvenlik Konusunda Eğitmek:',
                  content: '''
. İnternet kullanımı konusunda çocuklara rehberlik edin.
. Kendi sınırlarını belirlemeyi ve zorbalığa karşı hayır demeyi öğretin.
. Çevrimiçi tanımadığı kişilerle kişisel bilgilerini paylaşmamaları gerektiğini anlatın.
. Teknoloji kullanım sürelerini düzenleyin.
                  ''',
                ),
                const SizedBox(height: 16),
                _buildInfoBox(
                  title: 'Sosyal Medyada Güvenliği Artırmak:',
                  content: '''
. Gizlilik ayarlarını gözden geçirin ve yalnızca tanıdığınız kişilerle iletişim kurun.
. Paylaşımlarınızı sınırlı bir izleyici kitlesiyle paylaşın.
. Sosyal medya platformlarının güvenlik politikalarını okuyun.
                  ''',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox({required String title, required String content}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE5DED0),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.brown),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(content),
        ],
      ),
    );
  }

  Widget _buildVideoBox(
      {required String title, required YoutubePlayerController controller}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE5DED0),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.brown),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
          ),
        ],
      ),
    );
  }
}
