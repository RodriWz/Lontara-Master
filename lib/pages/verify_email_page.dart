part of 'pages.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // IMAGE
              Image.asset(
                "assets/images/Email icon.jpg",
                width: 240,
              ),
              const SizedBox(height: 20),

              // SUBTITLE TEXT
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: Text(
                  "Please use the link below to verify your\nemail & start your journey",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
              ),

              const SizedBox(height: 40),

             // VERIFY BUTTON
Container(
  width: 260,
  height: 55,
  decoration: BoxDecoration(
    color: const Color(0xfff2e7dd),
    borderRadius: BorderRadius.circular(40),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0, 2),
        blurRadius: 8,
      )
    ],
  ),
  child: TextButton(
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    },
    child: const Text(
      "VERIFY EMAIL",
      style: TextStyle(
        color: Color(0xffc7a388),
        fontWeight: FontWeight.w600,
        fontSize: 18,
        letterSpacing: 1,
      ),
    ),
  ),
),


              const SizedBox(height: 60),

              // FOOTER TEXT
              const Text(
                "Do you have any Question?",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),

              GestureDetector(
                onTap: () {}, // bisa buka email atau page lain
                child: const Text(
                  "contact@mail.com",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xffc7a388),
                    decoration: TextDecoration.none,
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
