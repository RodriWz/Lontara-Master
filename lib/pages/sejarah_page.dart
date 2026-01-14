part of 'pages.dart';

class SejarahPage extends StatelessWidget {
  const SejarahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          /// ===== HEADER MELENGKUNG =====
          Stack(
            children: [
              Container(
                height: 180,
                decoration: const BoxDecoration(
                  color: Color(0xFFD2AC8B),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(120),
                  ),
                ),
              ),

              /// APP BAR CONTENT
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.arrow_back),
                          const SizedBox(width: 8),
                          const Text(
                            'Sejarah',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/kapal.png', // ganti sesuai aset kamu
                        height: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          /// ===== KONTEN =====
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 16),

                  /// GAMBAR BUKU
                  Image.asset(
                    'assets/book.png', // ganti sesuai aset kamu
                    height: 140,
                  ),

                  const SizedBox(height: 20),

                  /// PARAGRAF 1
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sed euismod, nisi a commodo efficitur, lorem felis dignissim '
                    'mauris, nec efficitur nibh odio id lacus. Vivamus finibus '
                    'sem vitae magna dapibus, a tincidunt risus mattis. Nulla '
                    'facilisi. Morbi facilisis nisl non dui facilisis.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.5,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// GAMBAR KOIN
                  Image.asset(
                    'assets/coin.png', // ganti sesuai aset kamu
                    height: 60,
                  ),

                  const SizedBox(height: 16),

                  /// PARAGRAF 2
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sed euismod, nisi a commodo efficitur, lorem felis',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.5,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// PARAGRAF 3
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sed euismod, nisi a commodo efficitur, lorem felis dignissim '
                    'mauris, nec efficitur nibh odio id lacus. Vivamus finibus '
                    'sem vitae magna dapibus, a tincidunt risus mattis. Nulla '
                    'facilisi.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.5,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
