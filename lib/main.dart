import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF673AB7)),
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   int _angka = 0;

  void kurangAngka() {
    setState(() {
      if (_angka>0){
      _angka--;
      }
    });
  }
   void aturUlangAngka() {
    setState(() {
      _angka=0;
    });
  }

   void tambahAngka() {
    setState(() {
      _angka++;
    });
  }

    late DateTime _waktuSekarang;
    Timer? _timer;

@override
  void initState() {
    super.initState();
    _waktuSekarang = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _waktuSekarang = DateTime.now();
      });
    });
  }

   String formatJam(DateTime waktu) {
    return "${waktu.hour.toString().padLeft(2, '0')}:"
           "${waktu.minute.toString().padLeft(2, '0')}:"
           "${waktu.second.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              formatJam(_waktuSekarang),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            const Text('Hari ini kamu dzikir sebanyak:'),
            Text(
              '$_angka',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: tambahAngka,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: aturUlangAngka,
                  child: const Icon(Icons.restart_alt),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: kurangAngka,
                  child: const Icon(Icons.remove),
                ),
                
              ],
            ),
          ],
          
        ),
      ),
    );
    
  }
  
}