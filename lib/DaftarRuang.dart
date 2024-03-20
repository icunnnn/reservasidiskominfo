import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'Agenda.dart'; // Import halaman Agenda.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Ruang',
      theme: ThemeData(
        primaryColor: Colors.white, // Atur primaryColor secara langsung
      ),
      home: DaftarRuang(),
    );
  }
}

class DaftarRuang extends StatefulWidget {
  const DaftarRuang({Key? key}) : super(key: key);

  @override
  State<DaftarRuang> createState() => _DaftarRuangState();
}

class _DaftarRuangState extends State<DaftarRuang> {
  int _selectedIndex = 0; // Indeks untuk menentukan tab yang aktif

  final List<Widget> _pages = [
    Center(child: Text('Halaman Ruang')),
    Agenda(), // Halaman Agenda.dart
    Center(child: Text('Halaman Ketersediaan')),
    Center(child: Text('Halaman Login')),
  ];

  String _selectedItem =
      'Semua Lokasi'; // Menyimpan item yang dipilih dari dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Menggunakan primaryColor dari tema
        title: Container(
          height: 50, // Atur tinggi kotak judul di sini
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  'assets/logosplash.png', // Ganti dengan path gambar Anda
                  width: 40, // Sesuaikan lebar gambar
                  height: 40, // Sesuaikan tinggi gambar
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'LAYANAN RESERVASI LOKASI KEGIATAN\nPERANGKAT DAERAH',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black, // Warna teks judul
                        fontSize: 18.0, // Ukuran teks judul
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          child: Divider(
            color: Colors.black, // Warna garis pemisah
            thickness: 2, // Ketebalan garis pemisah
          ),
          preferredSize: Size.fromHeight(1), // Tinggi garis pemisah
        ),
      ),
      backgroundColor: Colors.white, // Background color for the main body
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  style: TextStyle(
                      color:
                          Colors.white), // Ubah warna teks input menjadi putih
                  decoration: InputDecoration(
                    hintText: 'Cari Ruang',
                    hintStyle: TextStyle(
                        color: Colors.black), // Ubah warna hint menjadi putih
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black, // Ubah warna ikon menjadi putih
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    // Implementasi pencarian di sini
                  },
                ),
                SizedBox(height: 10),
                Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: <String>[
                        'Semua Lokasi',
                        'DISKOMINFO',
                        'Bagian Umum Setda'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        );
                      }).toList(),
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue!;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: 200,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8.0),
              children: [
                Card(
                  elevation: 4.0,
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset('assets/room_image.jpg'),
                      ListTile(
                        title: Text('Nama Tempat'),
                        subtitle: Text('Luas Kapasitas, Fasilitas, Sesi'),
                      ),
                      ButtonBar(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Aksi ketika tombol ditekan
                            },
                            child: Text('Cek Ketersediaan'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Color(0xff0F515B),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: const Color(0xff0F515B),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color(0xff5699AA),
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(icon: Icons.home, text: 'Ruang'),
              GButton(icon: Icons.event, text: 'Agenda'),
              GButton(
                icon: Icons.settings,
                text: 'Ketersediaan',
              ),
              GButton(
                icon: Icons.face,
                text: 'Login',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
