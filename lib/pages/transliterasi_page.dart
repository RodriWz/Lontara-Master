part of 'pages.dart';

class TransliterasiPage extends StatelessWidget {
  const TransliterasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// ===== APP BAR =====
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: const Color(0xFF3B1F0F),
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Transliterasi',
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15), // atur jarak ke bawah
                child: Image.asset(
                  'assets/images/kapal.png',
                  height: 80, 
                ),
              ),
            ],
          ),
          centerTitle: false,
        ),
      ),

      /// ===== BODY =====
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// ===== CATATAN =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '*Catatan: "é" menghasilkan taling, "e" menghasilkan pepet.',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(height: 30),

            /// ===== CARD INPUT & OUTPUT =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  /// INPUT
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD2AC8B),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.mic, size: 24, color: Colors.black),
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// OUTPUT
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD2AC8B),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      /// ===== BOTTOM NAVIGATION =====
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Color(0xFF3B1F0F),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navIcon(Icons.home, false),
            _navIcon(Icons.translate, true),
            _navIcon(Icons.menu_book, false),
            _navIcon(Icons.person, false),
          ],
        ),
      ),
    );
  }

  /// ===== ICON NAV =====
  Widget _navIcon(IconData icon, bool active) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: active ? Colors.amber : Colors.transparent,
      child: Icon(icon, color: active ? Colors.white : Colors.white70),
    );
  }
}
