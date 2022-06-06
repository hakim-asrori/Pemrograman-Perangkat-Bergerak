import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var cardTextStyle = const TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.36,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.center,
                    image: AssetImage('assets/images/top_header.png'))),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 64,
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const CircleAvatar(
                              radius: 32,
                              backgroundImage: NetworkImage(
                                  'https://avatars.githubusercontent.com/u/77718626?v=4'),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                Text(
                                  'Hakim Asrori',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat Medium',
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                                Text(
                                  '2003071',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: "Montserrat Regular",
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        InkWell(
                          onTap: () => print("Data Diri"),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/widget/student.png',
                                  height: 100,
                                ),
                                Text(
                                  'Data Diri',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => print("Jadwal Kursus"),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/widget/calendar.png',
                                  height: 100,
                                ),
                                Text(
                                  'Jadwal Kursus',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => print("Hasil Belajar"),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/widget/prize.png',
                                  height: 100,
                                ),
                                Text(
                                  'Hasil Belajar',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => print("Rekap Absensi"),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/widget/recap.png',
                                  height: 100,
                                ),
                                Text(
                                  'Rekap Absensi',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => print("Kursus Lainnya"),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/widget/books.png',
                                  height: 100,
                                ),
                                Text(
                                  'Kursus Lainnya',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => print("Alur Kursus"),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/widget/library.png',
                                  height: 100,
                                ),
                                Text(
                                  'Alur Kursus',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
