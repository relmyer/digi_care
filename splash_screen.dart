import 'package:flutter/material.dart';
import 'main_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2423),
      body: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: const Color(0xFFE4DFD5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 40.0,
                  horizontal: 20.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF4F4848),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Digi Care',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE4DFD5),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Siber zorbalıkla başa çıkmak zorlayıcı olabilir, ancak Digi Care, yalnız hissetmeden destek bulmanızı sağlar. Deneyimlerinizi paylaşabilir, topluluklara katılarak dayanışma içinde olabilirsiniz. Ayrıca kendi iyileşme serüveninizi de kaydedebilirsiniz.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFE4DFD5),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F4848),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 60,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Başla',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFE4DFD5),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
