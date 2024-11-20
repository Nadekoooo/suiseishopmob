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

<h3>1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?</h3>
const dalam Flutter dipakai untuk meng-state variable konstan pada objek yang tidak berubah. Ketika sebuah widget atau objek dideklarasikan dengan `const`, Flutter dapat mengoptimalkan performa aplikasi dengan menyimpan dan menggunakan kembali objek tersebut, karena tidak akan pernah berubah (sesuai dengan namanya constant).

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

Seperti pada tutorial, Flutter memiliki sebuah sistim navigasi yang mampu memindahkan halaman. Untuk mengimplementasikan navigasi pada Flutter, sebenarnya sudah disediakan sistem yang cukup lengkap untuk melakukan navigasi antar halaman. Salah satu cara yang dapat kita gunakan untuk berpindah-pindah halaman adalah dengan menggunakan widget Navigator. Widget Navigator menampilkan halaman-halaman yang ada kepada layar seakan sebagai sebuah tumpukan (stack). Untuk menavigasi sebuah halaman baru, kita dapat mengakses Navigator melalui BuildContext dan memanggil fungsi yang ada, seperti misalnya `push(), pop(), serta pushReplacement()`.

Berikut merupakan implementasinya 

<h5>Push</h5>

```
if (item.name == "Tambah Mood") {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MoodEntryFormPage()));
}
```

Method `push()` menambahkan suatu route ke dalam stack route yang dikelola oleh Navigator. Method ini menyebabkan route yang ditambahkan berada pada paling atas stack, sehingga route yang baru saja ditambahkan tersebut akan muncul dan ditampilkan kepada pengguna.

<h5>Pop</h5>

```
onPressed: () {
        Navigator.pop(context);
},
```

Method `pop()` menghapus route yang sedang ditampilkan kepada pengguna (atau dalam kata lain, route yang berada pada paling atas stack) dari stack route yang dikelola oleh Navigator. Method ini menyebabkan aplikasi untuk berpindah dari route yang sedang ditampilkan kepada pengguna ke route yang berada di bawahnya pada stack yang dikelola Navigator.


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

Method `pushReplacement()` menghapus route yang sedang ditampilkan kepada pengguna dan menggantinya dengan suatu route. Method ini menyebabkan aplikasi untuk berpindah dari route yang sedang ditampilkan kepada pengguna ke suatu route yang diberikan. Pada stack route yang dikelola Navigator, route lama pada atas stack akan digantikan secara langsung oleh route baru yang diberikan tanpa mengubah kondisi elemen stack yang berada di bawahnya.


Di samping ketiga method ini, terdapat juga beberapa method lain yang dapat memudahkan routing dalam pengembangan aplikasi, seperti `popUntil()`, `canPop()`, dan `maybePop()`.


<h2>Tugas 9</h2>
<h4>Mengapa Kita Perlu Membuat Model untuk Mengambil atau Mengirimkan Data JSON? Apakah Akan Terjadi Error Jika Tidak Membuat Model Terlebih Dahulu?</h4>

Model pada Django berfungsi untuk merepresentasikan struktur data yang akan digunakan dalam aplikasi, seperti tabel dalam basis data. Dengan membuat model:

- Struktur data yang lebih terdefinisi, hal ini dapat memastikan bahwa data yang diterima atau dikirim sesuai dengan struktur yang diharapkan.
- Selain poin pertama data juga akan divalidasi dan akan dipastikan jika data memiliki atribut dan tipe yang sesuai dengan datanya. Misal :  `price` sebagai `int`, `name` sebagai `String`.
- Dengan mendefinisikan struktur ini, efisiensi juga pasti meningkat ketika mengakses atribut (dibandingkan dengan pemanggilan JSOn key secara manual)
- Model seperti `ProductEntry` pada tugas ini mempermudah konversi JSON ke objek Dart dan sebaliknya.

Apabila tidak ada model mungkin:
- Data yang diterima ataupun dikirimkan harus dikelola secara manual yang sangat prone terhadap kesalahan.
- Tidak adanya validasi juga membuat data tipe rawan dengan kesalahan. Kesalahan tipe data, seperti `price `dikirim sebagai `String` padahal aplikasi mengharapkan `int`.
- Skalabilitasnya juga berkurang. Perubahan struktur JSON membutuhkan modifikasi besar pada logika aplikasi.

Secara garis besar penerapannya seperti ini

```
class ProductEntry {
  String pk; // Primary key
  Fields fields;

  ProductEntry({
    required this.pk,
    required this.fields,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "fields": fields.toJson(),
      };
}
```

dengan `fields` berisikan tipe data definisi datanya.

<h4>2. Fungsi Library http yang Diimplementasikan pada Tugas
Library http di Flutter digunakan untuk berbagai hal yaitu:

- Mengirim Request HTTP: Seperti GET, POST, PUT, DELETE, untuk berinteraksi dengan server.
- Menerima Response: Data yang dikirim oleh server, biasanya dalam format JSON.
- Mendekodekan Data JSON: Fungsi seperti `json.decode()` memungkinkan kita mengubah data JSON menjadi struktur data Dart.

Dengan adanya library ini, koneksi antara flutter dan django dipermudah sehingga mampu menjalankan aplikasi dengan baik

Berikut contoh penerapan pada kode saya:
```
  final response = await request.get('http://localhost:8000/json/');

  var data = response;
```

<h4>3. Fungsi CookieRequest dan Mengapa Perlu Dibagikan ke Semua Komponen Flutter</h4>

`CookieRequest` adalah bagian dari library `pbp_django_auth `yang digunakan untuk menangani autentikasi berbasis cookie antara Flutter dan Django.

Fungsinya cukup penting dan ada di beberapa bagian kode ini:

- Mengelola Cookie: Menyimpan cookie yang dikirim oleh server saat login, sehingga session pengguna dapat dipertahankan.
- Request Terautentikasi: Menyisipkan cookie pada setiap request untuk mengakses data yang membutuhkan autentikasi.
- Logout Otomatis: Memungkinkan pengguna untuk logout dengan cara menghapus cookie.

Hal ini berkaitan erat dengan alsannya mengapa cookie harus tersebar dai dibagikan di aplikasi karena:

- Cookie menyimpan informasi session pengguna yang diperlukan untuk setiap permintaan (request) ke server.
- Instance `CookieRequest` perlu dibagikan ke seluruh aplikasi agar setiap halaman dapat melakukan permintaan terautentikasi (biar user validated).

<h4>4. Mekanisme Pengiriman Data dari Input Hingga Ditampilkan pada Flutter</h4>

Secara garis besar prosesnya seperti ini:

- <h5> Input Data di Flutter: </h5>
Pengguna mengisi form pada Flutter menggunakan widget seperti `TextField`.
Data dari form dikirim ke server menggunakan `http` atau `CookieRequest.`

- <h5> Proses di Django: </h5>
Data diterima oleh Django pada fungsi view yang sesuai (biasanya melalui metode POST).
Django memvalidasi data menggunakan model atau form. Jika validasi sukses, data disimpan di database.

- <h5> Mengirim Data ke Flutter: </h5>
Django merespons request GET dari Flutter dengan data dalam format JSON.
Data JSON ini kemudian diterjemahkan kembali oleh Flutter menggunakan `jsonDecode` atau model.

- <h5> Menampilkan Data di Flutter: </h5>
Data yang diterjemahkan ditampilkan menggunakan widget seperti `ListView` atau `Text`.

<h4>5. Mekanisme Autentikasi (Login, Register, Logout)</h4>
Pada aplikasi ini, prosesnya adalah sebagai berikut:

- <h5>Input Data Akun di Flutter:</h5>

Pengguna mengisi form login/register pada Flutter.
Data dikirim ke Django melalui CookieRequest dengan metode POST.

- <h5>Register:</h5>

Data register diterima Django dan diproses untuk membuat pengguna baru.
Jika berhasil, server mengirimkan respons sukses.

- <h5>Login:</h5>

Data login diterima Django dan diverifikasi menggunakan authenticate().
Jika valid, Django mengirimkan cookie session kepada Flutter.

- <h5> Logout: </h5>

Saat logout, Flutter mengirimkan request ke endpoint logout di Django.
Django menghapus session dan mengembalikan respons berhasil.

- <h5>Menampilkan Menu di Flutter:</h5>

Setelah login berhasil, Flutter menyimpan session (cookie) dan menggunakan session ini untuk mendapatkan data pengguna dari server.


<h4> 6. Cara implementasi Checklist stepbystep</h4>

<h5> 1. Membuat Model untuk Data JSON </h5>

- Tujuan: Agar data dari web service (JSON) dapat diolah dan ditampilkan dengan baik di aplikasi Flutter.
- Langkah:
1. Membuat model menggunakan class di Flutter.
2. Menambahkan `fromJson` dan `toJson` untuk konversi data antara JSON dan objek.
3. Jika respons berupa daftar data, menambahkan fungsi untuk menangani list JSON.

```
import 'dart:convert';

// Function to deserialize JSON into a list of ProductEntry
List<ProductEntry> productEntryFromJson(String str) =>
    List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

// Function to serialize a list of ProductEntry into JSON
String productEntryToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String pk; // Primary key
  Fields fields;

  ProductEntry({
    required this.pk,
    required this.fields,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  int price;
  int stock;
  String description;
  String category;

  Fields({
    required this.user,
    required this.name,
    required this.price,
    required this.stock,
    required this.description,
    required this.category,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        stock: json["stock"],
        description: json["description"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "stock": stock,
        "description": description,
        "category": category,
      };
}

```

<h5> 2. Melakukan Fetch Data dari Web Service</h5> 

- Tujuan: Mengambil data eksternal (dari Django) untuk ditampilkan di aplikasi Flutter.
- Langkah:
1. Menambahkan dependensi `http` untuk pengambilan data.
2. Menambahkan izin internet di file `AndroidManifest.xml.`
3. Membuat fungsi `fetchProduct` menggunakan request HTTP `GET`.
4. Menggunakan `FutureBuilder` untuk menampilkan data ke UI.

```
Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
  final response = await request.get('http://localhost:8000/json/');
  var data = response;

  // Convert JSON response to a list of ProductEntry objects
  List<ProductEntry> listProduct = [];
  for (var d in data) {
    if (d != null) {
      listProduct.add(ProductEntry.fromJson(d));
    }
  }
  return listProduct;
}

```

<h5> 3. Membuat Sistem Login, Register, dan Logout</h5> 

- Tujuan: Mengintegrasikan autentikasi pengguna antara Django dan Flutter.
- Langkah:
Membuat endpoint login, register, dan logout di Django.
Menggunakan `pbp_django_auth` dan `Provider` untuk autentikasi di Flutter.
Implementasi:
  1.  Login: Mengirim username dan password ke endpoint Django, lalu menyimpan sesi jika berhasil.
  2. Register: Mengirim data akun baru ke Django untuk dibuatkan pengguna baru.
  3.  Logout: Menghapus sesi pengguna dengan memanggil endpoint Django.

```
final response = await request.login("http://localhost:8000/auth/login/", {
  'username': username,
  'password': password,
});

if (request.loggedIn) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => MyHomePage()),
  );
} else {
  // Show error
}

```

```
final response = await request.logout("http://localhost:8000/auth/logout/");

if (response['status']) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const LoginPage()),
  );
}

```

<h5> 4. Menampilkan Data ke UI</h5> 

- Tujuan: Menampilkan daftar produk yang diambil dari Django ke dalam aplikasi Flutter.
- Langkah:
  1. Membuat `ListView` untuk menampilkan daftar produk.
  2. Menambahkan dekorasi UI menggunakan widget seperti `Card`, `Column`, dan `Text`.

```
FutureBuilder<List<ProductEntry>>(
  future: fetchProduct(request),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const Center(
        child: Text('No products available in SuiseiShop.'),
      );
    }

    final products = snapshot.data!;
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (_, index) {
        final product = products[index];
        final fields = product.fields;
        return ListTile(
          title: Text(fields.name),
          subtitle: Text("Price: \$${fields.price}"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(product: product),
              ),
            );
          },
        );
      },
    );
  },
);

```

<h5> 5. Menambahkan Detail Produk</h5> 

-  Tujuan: Memberikan informasi lebih detail tentang suatu produk dan memungkinkan pengguna untuk kembali ke daftar produk.
- Langkah:
  1. Membuat halaman `ProductDetailPage` yang menampilkan informasi detail produk.
  2. Menambahkan navigasi ke halaman detail saat pengguna menekan salah satu produk di daftar.
  3. Menambahkan tombol "Back" di halaman detail untuk kembali ke daftar produk.

```
class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final fields = product.fields;
    return Scaffold(
      appBar: AppBar(
        title: Text(fields.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fields.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text("Price: \$${fields.price}"),
            Text("Stock: ${fields.stock}"),
            Text("Description: ${fields.description}"),
            Text("Category: ${fields.category}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

```

<h5> 6. Menggunakan State Management dengan Provider</h5> 

- Tujuan: Mengelola state aplikasi dengan efisien.
- Langkah:
  1. Membungkus root widget aplikasi dengan Provider.
  2. Membuat instance CookieRequest agar sesi dapat dibagikan ke seluruh komponen aplikasi.
  3. Menggunakan Provider untuk memantau status login dan logout pengguna.
Tambahan

```
void main() {
  runApp(
    Provider(
      create: (_) => CookieRequest(),
      child: const MyApp(),
    ),
  );
}

```

<h5> Terakhir setelah semua terintegrasi, saya menambahkan screens baru utuk menghandle detail product:</h5> 

- Halaman Detail Produk: Dapat diakses dengan menekan salah satu produk di daftar.
Tombol Back: Untuk kembali dari halaman detail ke daftar produk.

- Tombol Back: Untuk kembali dari halaman detail ke daftar produk.
