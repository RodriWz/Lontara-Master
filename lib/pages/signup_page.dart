part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController usernameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

  @override
  void dispose() {
    usernameC.dispose();
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
  if (usernameC.text.trim().isEmpty ||
      emailC.text.trim().isEmpty ||
      passwordC.text.trim().isEmpty) {
    _showError("Semua field wajib diisi");
    return;
  }

  if (!emailC.text.contains('@')) {
    _showError("Email tidak valid");
    return;
  }

  if (passwordC.text.length < 6) {
    _showError("Password minimal 6 karakter");
    return;
  }

  setState(() => isLoading = true);

  try {
    final cred = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailC.text.trim(),
      password: passwordC.text.trim(),
    );

    final user = cred.user;
    if (user == null) throw Exception("User null");

    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .set({
      "uid": user.uid,
      "username": usernameC.text.trim(),
      "email": emailC.text.trim(),
      "createdAt": FieldValue.serverTimestamp(),
    });

    if (!mounted) return;

    setState(() => isLoading = false);

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text("Berhasil"),
        content: const Text("Akun berhasil dibuat, silakan login"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // tutup dialog
              Navigator.pop(context); // kembali ke SignInPage
            },
            child: const Text("OK"),
          )
        ],
      ),
    );

    return; // ⬅️ PENTING: STOP, JANGAN LANJUT KE FINALLY
  } on FirebaseAuthException catch (e) {
    _showError(e.message ?? "Gagal membuat akun");
  } catch (e) {
    _showError(e.toString());
  } finally {
    if (mounted) {
      setState(() => isLoading = false);
    }
  }
}

  void _showError(String message) {
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Gagal"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Tutup"),
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
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text.rich(
                TextSpan(
                  text: "Buat Akun ",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                  children: [
                    TextSpan(
                      text: "Yuk !",
                      style: TextStyle(color: Color(0xFFFFEB3B)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: usernameC,
                decoration: _box("Enter Your Username", Icons.person_outline),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: emailC,
                keyboardType: TextInputType.emailAddress,
                decoration: _box("Enter Your Email", Icons.email_outlined),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: passwordC,
                obscureText: obscurePassword,
                decoration: _boxPassword(),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFEB3B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.black,
                          ),
                        )
                      : const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 18),

              Center(
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, size: 34),
                ),
              ),

              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      children: [
                        TextSpan(
                          text: "Sign In",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
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

  InputDecoration _box(String hint, IconData icon) => InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFD3AA87),
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      );

  InputDecoration _boxPassword() => InputDecoration(
        hintText: "Password",
        filled: true,
        fillColor: const Color(0xFFD3AA87),
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(
            obscurePassword ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() => obscurePassword = !obscurePassword);
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      );
}
