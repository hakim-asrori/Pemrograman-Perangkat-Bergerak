import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_upload_file/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cloud Storage'),
      ),
      body: Column(
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: () async {
                    final results = await FilePicker.platform.pickFiles(
                        allowCompression: false,
                        type: FileType.custom,
                        allowedExtensions: ['png', 'jpg']);

                    if (results == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('No file selected.')));

                      return null;
                    }

                    final path = results.files.single.path!;
                    final fileName = results.files.single.name;

                    storage
                        .uploadFile(path, fileName)
                        .then((value) => print('Done'));
                  },
                  child: Text('Upload File'))),
          FutureBuilder(
              future: storage.listFiles(),
              builder: (BuildContext context,
                  AsyncSnapshot<firebase_storage.ListResult?> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Container(
                    child: ListView.builder(
                        itemCount: snapshot.data!.items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ElevatedButton(
                              onPressed: () {},
                              child: Text(snapshot.data!.items[index].name));
                        }),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Container();
              })
        ],
      ),
    );
  }
}
