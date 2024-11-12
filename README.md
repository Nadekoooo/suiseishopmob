<h1>Flutter PBP</h1>
<h2>Tugas 7</h2>

<h3>1. Apa yang Dimaksud dengan Stateless Widget dan Stateful Widget, dan Apa Perbedaan dari Keduanya?</h3>

Stateless Widget adalah widget yang tidak memiliki state yang dapat berubah selama siklus hidupnya. Jadi setelah dirender dia tidak akan berubah kecuali ada perubahan pada parent widget yang mempengaruhinya.

Stateful Widget adalah widget yang memiliki state dan dapat berubah-ubah selama siklus hidupnya. Widget ini menggunakan objek State untuk menyimpan data yang bisa diperbarui, dan saat data tersebut berubah, widget akan melakukan render ulang. 

Perbedaan utama:

Stateless Widget: Tidak berubah setelah dirender. Contoh: Text, Icon.
Stateful Widget: Dapat berubah selama siklus hidupnya. Contoh: Checkbox, Slider, TextField.

<h3>2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.</h3>
Widget yang digunakan adalah:

- Scaffold: Menyediakan struktur dasar aplikasi Flutter dengan AppBar, Drawer, dan Body. Ini berfungsi sebagai kerangka utama halaman.
- AppBar: Digunakan sebagai bilah aplikasi di bagian atas halaman untuk menampilkan judul aplikasi.
- Padding: Memberikan jarak pada widget anaknya. Digunakan untuk mengatur tata letak agar tampilan lebih rapi.
- Column: Menyusun widget secara vertikal.
- Row: Menyusun widget secara horizontal.
- Card: Membuat tampilan kotak yang memiliki bayangan (elevation), sering digunakan untuk menampilkan informasi yang terpisah dari konten utama.
- Text: Menampilkan teks pada layar.
- Icon: Menampilkan ikon untuk elemen visual.
- GridView.count: Membuat tampilan grid dengan jumlah kolom yang telah ditentukan, cocok untuk menampilkan item-item dalam bentuk grid seperti menu.
- InkWell: Menambahkan efek klik (ripple effect) pada widget dan mendeteksi aksi pengguna.
- SnackBar: Menampilkan pesan sementara di bagian bawah layar ketika terjadi suatu aksi.

<h3>3. Apa fungsi dari setState() ? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.</h3>

`setState()` merupakan metode yang digunakan untuk memberi tahu Flutter bahwa ada perubahan pada state dari suatu `StatefulWidget`. Ketika `setState()` dipanggil, Flutter akan menjalankan ulang metode `build()` pada widget tersebut sehingga tampilan dapat diperbarui dengan nilai yang sudah disesuaikan.

Contoh variabel yang terdampak `setState()`: Jika kita memiliki variabel counter yang menghitung jumlah klik, memanggil `setState()` setelah mengubah nilai counter akan memperbarui tampilan untuk mencerminkan nilai terbaru dari counter.

Semua variabel yang disimpan dalam State dari `StatefulWidget` dan diakses di dalam `setState()` akan terdampak dari penggunaan `setState` ini, dan memungkinkan UI untuk selalu menyikronkan diri dengan data aplikasi yang selalu berubah (dinamis), jadi tampilan akan menjadi responsif dan menyesuaikan input pengguna.

<h3>4. Jelaskan perbedaan antara `const` dengan `final`</h3>

- const: Digunakan untuk nilai konstan yang ditetapkan pada waktu kompilasi. Objek yang dideklarasikan sebagai `const` tidak akan pernah berubah selama runtime.

- final: Digunakan untuk nilai yang hanya dapat diinisialisasi sekali, namun nilainya bisa ditentukan saat runtime. `final` tidak harus diketahui saat waktu kompilasi seperti const, tetapi setelah nilai diberikan, variabel tersebut tidak dapat diubah lagi.

<h3>5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.</h3>

- Step pertama ialah tahap instalasi. Instalasi ini mencakup instalasi `Flutter` dan `Android Studio`. Tentunya instalasi ini krusial sebagai langkah pertama dalam pengembangan aplikasi pada flutter ini.

- Setelah instalasi selesai, yang perlu dilakukan ialah membuat projek flutter baru. Dengan menggunakan command :

```
    flutter create suiseishop
```

Maka akan terbentuk project baru dengan nama suiseishop, lalu apabila project ini sudah jadi dan ada kita bisa mengecek built awalnya dengan menggunakan `flutter run` yang akan menjalankan project ini di web ataupun platform lainnya sesuai dengan pilihan pada menu.

Berikut salah satu langkah untuk melihat pengemabangan project awal ini

```
    flutter config --enable-web
    flutter run -d chrome
```
-  Membuat Widget Sederhana pada Flutter

Langkah - langkah utamanya ialah sebagai berikut:

<h4>1. Mengatur Tema Warna Aplikasi</h4>

Buka file `main.dart`.
Sesuaikan skema warna aplikasi dengan tema yang diinginkan. Berikut contoh penggunaan warna ungu tua sebagai tema utama:

```dart
theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepPurple,
    ).copyWith(secondary: Colors.deepPurple[400]),
),
```

<h4>2. Mengubah Halaman Utama Menjadi StatelessWidget</h4>
Ubah `MyHomePage` menjadi `StatelessWidget` agar tidak tergantung pada perubahan state.
Hapus elemen yang tidak diperlukan untuk `stateless widget`, seperti `createState()`.
Ubah konstruktor menjadi sederhana tanpa atribut tambahan,

```dart
class MyHomePage extends StatelessWidget {
    MyHomePage({super.key});
```

<h4>3. Membuat `InfoCard` untuk Menampilkan Informasi Pengguna (opsional, pada tugas ini saya tambahkan)</h4>

Tambahkan tiga variabel String pada MyHomePage untuk menyimpan data pengguna seperti NPM, nama, dan kelas:

```dart
final String npm = '2306241676';
final String name = 'Christian Yudistira Hermawan';
final String className = 'PBP F';
```

Buat widget `InfoCard` untuk menampilkan informasi pengguna dengan gaya card. Berikut cuplikan kode `InfoCard`:

```dart
class InfoCard extends StatelessWidget {
    final String title;
    final String content;

    const InfoCard({super.key, required this.title, required this.content});

    @override
    Widget build(BuildContext context) {
        return Card(
            elevation: 2.0,
            child: Container(
                width: MediaQuery.of(context).size.width / 3.5,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    children: [
                        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8.0),
                        Text(content),
                    ],
                ),
            ),
        );
    }
}
```

<h4>4. Membuat Button Card untuk Fitur Utama dengan Ikon</h4>

Menambahkan model `ItemHomepage` untuk mendefinisikan setiap fitur dalam bentuk button card:

```dart
class ItemHomepage {
    final String name;
    final IconData icon;

    ItemHomepage(this.name, this.icon);
}
```
Buat daftar ItemHomepage pada MyHomePage untuk setiap fitur yang ingin ditampilkan:

```dart

final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.mood),
    ItemHomepage("Tambah Produk", Icons.add),
    ItemHomepage("Logout", Icons.logout),
  ];
```

Buat widget ItemCard untuk menampilkan setiap tombol. Saat ditekan, tombol akan menampilkan Snackbar yang memberi pesan:

```dart
Widget build(BuildContext context) {
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color : getColor(item.name), // Set unique color for each button
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
```

Mengintegrasikan `InfoCard` dan `ItemCard` di Halaman Utama
Tambahkan `InfoCard` untuk menampilkan data pengguna dalam Row.
Tambahkan daftar `ItemCard` menggunakan GridView dengan tiga kolom.
Sesuaikan bagian `build()` dari `MyHomePage` untuk menampilkan komponen-komponen ini:

```dart
    ...
class MyHomePage extends StatelessWidget {
  ...  

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
    return Scaffold(
      // AppBar adalah bagian atas halaman yang menampilkan judul.
      appBar: AppBar(
        // Judul aplikasi "Mental Health Tracker" dengan teks putih dan tebal.
        title: const Text(
          'Mental Health Tracker',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      // Body halaman dengan padding di sekelilingnya.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Menyusun widget secara vertikal dalam sebuah kolom.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row untuk menampilkan 3 InfoCard secara horizontal.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),

            // Memberikan jarak vertikal 16 unit.
            const SizedBox(height: 16.0),

            // Menempatkan widget berikutnya di tengah halaman.
            Center(
              child: Column(
                // Menyusun teks dan grid item secara vertikal.

                children: [
                  // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to Mental Health Tracker',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // Agar grid menyesuaikan tinggi kontennya.
                    shrinkWrap: true,

                    // Menampilkan ItemCard untuk setiap item dalam list items.
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

```

<h2>Tugas 8</h2>

<h3>1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?</h3>
`const` dalam Flutter dipakai untuk meng-state variable konstan pada objek yang tidak berubah. Ketika sebuah widget atau objek dideklarasikan dengan `const`, Flutter dapat mengoptimalkan performa aplikasi dengan menyimpan dan menggunakan kembali objek tersebut, karena tidak akan pernah berubah (sesuai dengan namanya constant).

`const` mampu memberikan efektivitas lebih karena deklarasinya hanya sekali dalam memori flutter (pada aplikasi), penggunaan `const` juga bisa membuat keterbacaan yang lebih baik karena memberitahu bahwa sebuah variabel hanya akan di state sekali dan bersifat tetap.

`const` sebaiknya digunakan untuk variabel yang tidak akan berubah nilainya di seluruh pembuatan/penggunaan aplikasi, biasanya dapat digunakan pada deklarasi sebuah teks ataupun static element lainnya. Sementara itu `const` juga sebaiknya tidak digunakan pada variabel yang akan selalu berubah nilainya selama jalannya aplikasi, seperti variabel yang menyesuaikan input user ataupun sebuah state.

<h3>2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!</h3>

`Column` dan `Row` adalah widget layout dasar pada Flutter yang digunakan untuk menyusun widget secara vertikal (Column) atau horizontal (Row).

`Column` menyusun `child` secara vertikal dengan layout yang terbentang dari atas ke bawah

`Row` menyusun `child` secara horizontal dengan layout dari kiri ke kanan

Contoh pengaplikasian `Column`
```
  child: Column(
              // Menyusun ikon dan teks di tengah kartu.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            )
```

Contoh pengaplikasian `Row`

```
  children: [
            // Row untuk menampilkan 3 InfoCard secara horizontal.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
  )
```

<h3>3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!</h3>

Pada halaman form yang saya buat, elemen input yang digunakan adalah:

`TextFormField` untuk `name, price, stock, description, dan category`. 

Di sini input type yang digunakan hanyalah `TextFormField`, ad atipe input lain pada flutter seperti:

- Checkbox : Untuk binary input
- Radio Button : Untuk memilih satu opsi
- Switch : Untuk menge-set status
- Slider : Untuk slider angka

<h3>4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat</h3>

Flutter memilikiw widget bawaan `ThemeData` untuk mengatur konsitensi warna, font dan style aplikasi keseluruhan. Menggunakan `ThemeData` ini, palet bisa ditentukan dan dapat menjadi konsistensi style pada aplikasi.

Implementasi tema ini terdapat pada `main.dart` yang memberikan konsistensi dengan :

```
  theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
          ).copyWith(secondary: Colors.deepPurple[400]),
          useMaterial3: true,
        )
```

Tema diatur pada kode ini dengan memberikan value pada `colorScheme` dengan memberikan primary color dan beberapa penyesuaian lainnya sesuai dengan kebutuhan aplikasi ini (pada tugas ini SuiseiShop).

<h3>5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?</h3>

Seperti pada tutorial, Flutter memiliki sebuah sistim navigasi yang mampu memindahkan halaman. Widget Navigator menampilkan halaman-halaman yang ada kepada layar seakan sebagai sebuah tumpukan (stack). Untuk menavigasi sebuah halaman baru, kita dapat mengakses Navigator melalui `BuildContext `dan memanggil fungsi yang ada, seperti misalnya `push(), pop(), serta pushReplacement()`. Navigator tersebut dapat diaplikasikan seperti berikut:

<h5>Push</h5>
```
if (item.name == "Tambah Mood") {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MoodEntryFormPage()));
  }
```

<h5>Pop</h5>

```
onPressed: () {
        Navigator.pop(context);
},
```


<h5>Push Replacement</h5>

```
onTap: () {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(),
        ));
  },
```



