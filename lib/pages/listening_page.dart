part of 'pages.dart';

class ListeningPage extends StatelessWidget {
  const ListeningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ===== CLOSE BUTTON =====
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, size: 28),
              ),

              const SizedBox(height: 16),

              /// ===== TITLE =====
              const Text(
                'Mendengarkan...',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF3B1F0F),
                ),
              ),

              const SizedBox(height: 16),

              /// ===== RIWAYAT LIST =====
              _historyItem(),
              const SizedBox(height: 12),
              _historyItem(),
              const SizedBox(height: 12),
              _historyItem(),

              const Spacer(),

              /// ===== MIC BUTTON =====
              Center(
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Icon(
                    Icons.mic,
                    size: 40,
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  /// ===== RIWAYAT ITEM =====
  Widget _historyItem() {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(Icons.access_time, size: 18, color: Colors.black54),
          SizedBox(width: 8),
          Text(
            'Riwayat voice/Pencarian',
            style: TextStyle(
              color: Colors.black38,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
