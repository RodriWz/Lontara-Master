part of 'pages.dart';

class WellcomePage extends StatefulWidget {
  const WellcomePage({super.key});

  @override
  State<WellcomePage> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  bool obscure = true;
  bool isLoading = false;

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (emailC.text.trim().isEmpty || passwordC.text.trim().isEmpty) {
      _showError("Email dan password wajib diisi");
      return;
    }

    try {
      setState(() => isLoading = true);

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailC.text.trim(),
        password: passwordC.text.trim(),
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LontaraHomePage()),
      );
    } on FirebaseAuthException catch (e) {
      _showError(e.message ?? "Login gagal");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  void _showError(String msg) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Gagal"),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              Center(
                child: Image.asset(
                  'assets/images/logdep.png',
                  height: 180,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Selamat Datang\nKembali !',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A1F0F),
                ),
              ),

              const SizedBox(height: 30),

              _input(
                controller: emailC,
                hint: 'Enter Your Email',
                icon: Icons.email_outlined,
                obscure: false,
              ),

              const SizedBox(height: 16),

              _input(
                controller: passwordC,
                hint: 'Password',
                icon: obscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                obscure: obscure,
                onIconTap: () {
                  setState(() => obscure = !obscure);
                },
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD600),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.black)
                      : const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 24),

              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignUpPage(),
                      ),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _input({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required bool obscure,
    VoidCallback? onIconTap,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: IconButton(
          icon: Icon(icon),
          onPressed: onIconTap,
        ),
        filled: true,
        fillColor: const Color(0xFFD3A781),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
