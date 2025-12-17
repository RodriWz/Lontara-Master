part of 'pages.dart';
class WellcomePage extends StatefulWidget {
  const WellcomePage({Key? key}) : super(key: key);

  @override
  _WellcomePageState createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  bool _isHiddenPassword = true;
  bool _isHiddenConfrirmPassword = true;
  bool _isChecked = false;

  // === FUNGSI MODAL REGISTER ===
  void _showRegisterSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Buat Akun ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Yuk!',
                                  style: whiteTextStyle.copyWith(
                                    color: Color.fromARGB(200, 134, 42, 2),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.cancel, color: primaryColor),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),

                    // EMAIL
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Masukan Email",
                        labelText: "example@gmail.com",
                      ),
                    ),
                    SizedBox(height: 20),

                    // USERNAME
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Username",
                      ),
                    ),
                    SizedBox(height: 20),

                    // PASSWORD
                    TextField(
                      obscureText: _isHiddenPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Password",
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _isHiddenPassword = !_isHiddenPassword;
                            });
                          },
                          child: Icon(
                            _isHiddenPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // REPEAT PASSWORD
                    TextField(
                      obscureText: _isHiddenConfrirmPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Repeat Password",
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _isHiddenConfrirmPassword =
                                  !_isHiddenConfrirmPassword;
                            });
                          },
                          child: Icon(
                            _isHiddenConfrirmPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // TOMBOL REGISTER
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Registrasi',
                          style: whiteTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: secondaryColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sudah Punya Akun?",
                          style: whiteTextStyle.copyWith(
                            color: primaryColor,
                            fontSize: 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // tutup register
                            _showLoginSheet(); // buka login
                          },
                          child: Text(
                            " Login",
                            style: whiteTextStyle.copyWith(
                              color: dangerColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: defaultMargin),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // === FUNGSI MODAL LOGIN ===
  void _showLoginSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Masuk lagi ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Yuk!',
                                  style: whiteTextStyle.copyWith(
                                    color: Color.fromARGB(200, 134, 42, 2),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.cancel, color: primaryColor),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),

                    // EMAIL
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Masukan Email",
                        labelText: "example@gmail.com",
                      ),
                    ),
                    SizedBox(height: 20),

                    // USERNAME
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Username",
                      ),
                    ),
                    SizedBox(height: 20),

                    // PASSWORD
                    TextField(
                      obscureText: _isHiddenPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Password",
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _isHiddenPassword = !_isHiddenPassword;
                            });
                          },
                          child: Icon(
                            _isHiddenPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                        ),
                        Text("Ingat saya",
                            style: whiteTextStyle.copyWith(
                                color: primaryColor, fontSize: 12)),
                        Spacer(),
                        Text("Lupa Password?",
                            style: whiteTextStyle.copyWith(
                                color: primaryColor, fontSize: 12)),
                      ],
                    ),
                    SizedBox(height: 20),

                    // TOMBOL LOGIN
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Masuk',
                          style: whiteTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: secondaryColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Belum Punya Akun?",
                          style: whiteTextStyle.copyWith(
                            color: primaryColor,
                            fontSize: 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // tutup login
                            _showRegisterSheet(); // buka register
                          },
                          child: Text(
                            " Buat Akun",
                            style: whiteTextStyle.copyWith(
                              color: dangerColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: defaultMargin),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            Image.asset('assets/images/logo.png', height: 333, fit: BoxFit.fill),
            SizedBox(height: 15),
            Text("ᨕᨁᨘᨑᨘᨀᨗ ᨒᨚᨈᨑ – Ayo Belajar Lontara!",
                style: dangerTextStyle, textAlign: TextAlign.center),
            SizedBox(height: 15),
            Text(
              "Lontara adalah aksara tradisional masyarakat Bugis-Makassar yang sarat akan sejarah dan budaya.",
              style: dangerTextStyle.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 51),

            // TOMBOL REGISTER
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 2 * defaultMargin,
              child: ElevatedButton(
                onPressed: _showRegisterSheet,
                child: Text(
                  'Buat Akun',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),

            // TOMBOL LOGIN
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 2 * defaultMargin,
              child: ElevatedButton(
                onPressed: _showLoginSheet,
                child: Text(
                  'Masuk',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: secondaryColor,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: secondaryColor, width: 3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),
            Text('By Kelompok 1 @2025',
                textAlign: TextAlign.center,
                style: whiteTextStyle.copyWith(color: dangerColor, fontSize: 11)),
            SizedBox(height: defaultMargin),
          ],
        ),
      ),
    );
  }
}