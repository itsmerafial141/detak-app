class CustomStrings {
  /// Navigation
  static List<List<String>> listSVGnavigationBar = [
    ["assets/icons/homeIcon.svg", "Home"],
    ["assets/icons/testIcon.svg", "Test"],
    ["assets/icons/riwayatIcon.svg", "Riwayat"],
    ["assets/icons/profileIcon.svg", "Profile"],
  ];

  /// Profile
  static List listBottomNavigation = [
    ["assets/icons/home.png", "Home"],
    // ["assets/icons/video.png", "Video"],
    ["assets/icons/test.png", "Test"],
    ["assets/icons/hasilTest.png", "Hasil Test"],
    ["assets/icons/profile.png", "Profile"],
  ];

  static List listProfileListTile = [
    // ["assets/icons/hasilTest.png", "Hasil Test"],
    // ["assets/icons/pengaturan.png", "Pengaturan"],
    ["assets/icons/keluar.png", "Keluar"],
  ];

  /// Home
  static const String logoApp = "assets/images/loginLogo.png";

  // Daftar
  static const List<Map<String, String>> listTextField = [
    {
      "hint": "Nama",
      "error": "* Nama harus lebih dari 2 karakter.",
    },
    {
      "hint": "Email",
      "error": "* Email tidak sesuai. contoh : user@gmail.com",
    },
    {
      "hint": "No. Handphone",
      "error": "* No. Handphone tidak sesuai",
    },
    {
      "hint": "Password",
      "error":
          "* Password harus lebih dari 7 karakter.\n* Password harus terdapat minimal satu digit.",
    },
    {
      "hint": "Konfirm Password",
      "error": "* Password tidak sesuai.",
    },
  ];
}

class MyError {
  static const String errorMessage =
      "Terjadi kesalahan pada server. Silahkan coba beberapa saat lagi!";
  static const String loginSuccess = "Berhasil Login!";
}
