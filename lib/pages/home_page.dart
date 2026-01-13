part of 'pages.dart';

class LontaraHomePage extends StatefulWidget {
  const LontaraHomePage({Key? key}) : super(key: key);

  @override
  State<LontaraHomePage> createState() => _LontaraHomePageState();
}

class _LontaraHomePageState extends State<LontaraHomePage> {
  final TextEditingController _searchController = TextEditingController();
  bool _showSearchClear = false;

  final List<Map<String, String>> _aksaraList = [
    {'symbol': 'ᨀ', 'label': 'KA'},
    {'symbol': 'ᨁ', 'label': 'GA'},
    {'symbol': 'ᨂ', 'label': 'NGA'},
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _showSearchClear = _searchController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    _buildSejarahSection(),
                    const SizedBox(height: 24),
                    _buildAksaraSection(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // ================= HEADER =================
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF5D3A1A), Color(0xFF4A2B11)],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "lontara,\nAgo Belajar Lontara!",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFD700),
                ),
              ),
              Icon(Icons.person, color: Colors.white, size: 40),
            ],
          ),
          const SizedBox(height: 20),
          _buildSearchBar(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          const Icon(Icons.search),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: "Cari kata...",
                border: InputBorder.none,
              ),
            ),
          ),
          if (_showSearchClear)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => _searchController.clear(),
            ),
        ],
      ),
    );
  }

  // ================= SEJARAH =================
  Widget _buildSejarahSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFD4A574),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          "Sejarah singkat aksara lontara...",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // ================= AKSARA =================
  Widget _buildAksaraSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _aksaraList
          .map((e) => _buildAksaraItem(e['symbol']!, e['label']!))
          .toList(),
    );
  }

  Widget _buildAksaraItem(String symbol, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          child: Text(
            symbol,
            style: const TextStyle(fontSize: 32),
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  // ================= BOTTOM NAV =================
  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF3D2516),
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.translate), label: "Translate"),
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Belajar"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
      ],
    );
  }
}
