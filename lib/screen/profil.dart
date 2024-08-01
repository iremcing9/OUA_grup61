import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Yemek Tarifi Uygulaması';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anasayfa'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
          child: const Text('Profil'),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _showProfileImage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EnlargedImagePage(),
      ),
    );
  }

  void _navigateToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingsPage(),
      ),
    );
  }

  void _navigateToLogout(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LogoutPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => _showProfileImage(context),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                backgroundImage:
                NetworkImage('https://example.com/profile.jpg'),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ali Veli',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'ali.veli@ornek.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),
            const Divider(thickness: 1.5, color: Colors.grey),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.green),
              title: const Text(
                'Favori Tarifler',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                // Favori tarifler sayfasına yönlendirme
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.green),
              title: const Text(
                'Ayarlar',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () => _navigateToSettings(context),
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Çıkış Yap',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () => _navigateToLogout(context),
            ),
          ],
        ),
      ),
    );
  }
}

class EnlargedImagePage extends StatelessWidget {
  const EnlargedImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Resminiz'),
      ),
      body: Center(
        child: Image.network(
          'https://example.com/profile.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? _selectedLanguage;
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Dil Seçimi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              items: <String>['Türkçe', 'İngilizce', 'Almanca', 'Rusça']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue;
                });
              },
              hint: const Text('Bir dil seçin'),
              value: _selectedLanguage,
            ),
            const SizedBox(height: 40),
            const Text(
              'Uygulama Ayarları',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text('Bildirimler'),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Karanlık Mod'),
              value: _darkModeEnabled,
              onChanged: (bool value) {
                setState(() {
                  _darkModeEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Çıkış Yap'), // Sayfanın başlığı
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0), // Kenar boşlukları
            child: Column(
              children: [
                const Text(
                  'E-posta Adresi', // E-posta girişi için başlık
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'E-posta adresinizi girin',
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Şifre', // Şifre girişi için başlık
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 8),
                TextField(
                  obscureText: true, // Şifre gizleme
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Şifrenizi girin',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Çıkış işlemi burada gerçekleştirilecek
                  },
                  child: const Text('Çıkış Yap'), // Çıkış yap butonu
                ),
              ],
            ),
            ),
        );
  }
}