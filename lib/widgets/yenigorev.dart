// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YeniGorev extends StatefulWidget {
  final Function _gorevEkleyici;
  YeniGorev(this._gorevEkleyici);
  @override
  State<YeniGorev> createState() => _YeniGorevState();
}

class _YeniGorevState extends State<YeniGorev> {
  DateTime _tarih = DateTime.now();
  String? _baslik;
  String? _simge = "Okul";
  final _baslikKontrolcusu = TextEditingController();

  _tarihSec() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 3),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(
          () {
            _tarih = pickedDate;
          },
        );
      },
    );
  }

  _gorevUret() {
    if (_baslikKontrolcusu.text.isEmpty) {
      _hataBildir("Lütfen başlık bilgisi giriniz.");
      return;
    } else {
      _baslik = _baslikKontrolcusu.text;
    }

    widget._gorevEkleyici(baslik: _baslik, tarih: _tarih, simge: _simge);
    Navigator.of(context).pop();
  }

  _hataBildir(String mesaj) {
    final hataMesaji = AlertDialog(
      title: const Text("HaAta"),
      content: Text(mesaj),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, "Tamam"),
          child: const Text("Tamam"),
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return hataMesaji;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _baslikKontrolcusu,
                decoration: const InputDecoration(
                  labelText: "Açıklama giriniz.",
                  icon: Icon(Icons.textsms),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: DropdownButton<String>(
                value: _simge,
                icon: const Icon(Icons.arrow_downward),
                elevation: 8,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newvalue) {
                  setState(() {
                    _simge = newvalue;
                  });
                },
                items: <String>["Okul", "Ev", "İş", "Eğlence"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: DateFormat.yMd().format(_tarih.toLocal()),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: TextButton(
                onPressed: _tarihSec,
                child: const Text("Tarih seçin"),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: ElevatedButton(
            onPressed: _gorevUret,
            child: const Text("Ekle"),
          ),
        ),
      ],
    );
  }
}
