// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../modals/gorevmodeli.dart';
import 'package:intl/intl.dart';

class GorevListesi extends StatelessWidget {
  List<GorevModeli> _gorevlerim;
  Function _gorevSil;

  GorevListesi(this._gorevlerim, this._gorevSil);

  Widget build(BuildContext context) {
    return _gorevlerim.isEmpty
        ? const ListTile(
            title: Text("Henuz görev girilmedi"),
            leading: Icon(Icons.question_mark),
          )
        : ListView.builder(
            itemCount: _gorevlerim.length,
            itemBuilder: (ctx, index) {
              GorevModeli e = _gorevlerim[index];
              return (Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: ListTile(
                  leading: simge[e.simge],
                  title: Text(e.baslik),
                  subtitle: Text(DateFormat.yMd().format(e.tarih)),
                  trailing: TextButton(
                    child: const Icon(
                      Icons.check_box_outlined,
                      size: 28,
                    ),
                    onPressed: () {
                      _gorevSil(e.id);
                    },
                  ),
                ),
              ));
            });
  }
}
