part of 'pages.dart';

class AksaraPage extends StatelessWidget {
  const AksaraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// ===== APP BAR =====
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Aksara',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset(
              'assets/icon.png', // ganti sesuai aset kamu
              height: 32,
            ),
          )
        ],
      ),

      /// ===== BODY =====
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// ===== SEARCH =====
            Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF3B1F0F),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.white70),
                  SizedBox(width: 8),
                  Text(
                    'Makan',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ===== LIST AKSARA =====
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: AksaraItem(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ===== ITEM AKSARA =====
class AksaraItem extends StatelessWidget {
  const AksaraItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        /// CARD UTAMA
        Container(
          height: 56,
          padding: const EdgeInsets.only(left: 72, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: const Color(0xFF3B1F0F)),
            color: Colors.white,
          ),
          child: Row(
            children: [
              const Text(
                'KA',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B1F0F),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.volume_up,
                color: Color(0xFF3B1F0F),
              ),
              const SizedBox(width: 12),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF3B1F0F),
              ),
            ],
          ),
        ),

        /// TOMBOL AKSARA (KIRI)
        Container(
          width: 64,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 6,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: const Center(
            child: Text(
              '//',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
