import 'package:flutter/material.dart';

class Hesapla extends StatefulWidget {
  int not1Araligi, not2Araligi, not3Araligi;

  Hesapla(this.not1Araligi, this.not2Araligi, this.not3Araligi);

  @override
  _HesaplaState createState() => _HesaplaState();
}

class _HesaplaState extends State<Hesapla> {
  var myController = TextEditingController();
  var sonuc, kullaniciNotu;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          "Hesapla",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Text(
              "Ilgili Ders Notunu Giriniz : ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: myController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                kullaniciNotu = int.parse(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Notunuzu Giriniz',
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // background
                onPrimary: Colors.white, // foreground
              ),
              child: Text(
                'Not Hesapla',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (kullaniciNotu >= 0 && kullaniciNotu <= widget.not1Araligi) {
                  sonuc = "D";
                } else if (kullaniciNotu > widget.not1Araligi &&
                    kullaniciNotu <= widget.not2Araligi) {
                  sonuc = "C";
                } else if (kullaniciNotu > widget.not2Araligi &&
                    kullaniciNotu <= widget.not3Araligi) {
                  sonuc = "B";
                } else if (kullaniciNotu > widget.not3Araligi &&
                    kullaniciNotu <= 100) {
                  sonuc = "A";
                } else {
                  sonuc = "Farkli bir deger girisi yaptiniz.";
                }

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0))
                      ),
                      title: new Text("Notunuz : " + kullaniciNotu.toString(),
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      content: new Text(
                        "Almis oldugunuz sonuc : " + sonuc.toString(),
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("Tamam", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
