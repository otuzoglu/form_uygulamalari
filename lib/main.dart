// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'modals/gorevmodeli.dart';
import 'widgets/gorevlistesi.dart';
import 'widgets/yenigorev.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      title: 'Material App',
      home: Gorevler(),
    );
  }
}

class Gorevler extends StatefulWidget {
  const Gorevler({super.key});

  @override
  State<Gorevler> createState() => _GorevlerState();
}

class _GorevlerState extends State<Gorevler> {
  List<GorevModeli> _gorevler = [];
  var _gorevSayisi = 0;

  void _gorevEkle({
    required String baslik,
    required DateTime tarih,
    required String simge,
  }) {
    setState(() {
      _gorevler.add(
        GorevModeli(
          id: _gorevSayisi,
          baslik: baslik,
          tarih: tarih,
          simge: simge,
        ),
      );
    });
    _gorevSayisi++;
  }

  void _gorevSil(int gorevId) {
    setState(() {
      //_gorevler.remove(2);
      _gorevler.removeWhere((gorev) => gorev.id == gorevId);
    });
  }

  void _yeniGorevPenceresi(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (BuildContext ctx) {
        return Container(
          height: 250,
          child: YeniGorev(_gorevEkle),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Görev Listem"),
      ),
      body: GorevListesi(_gorevler, _gorevSil),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _yeniGorevPenceresi(context),
      ),
    );
  }
}
