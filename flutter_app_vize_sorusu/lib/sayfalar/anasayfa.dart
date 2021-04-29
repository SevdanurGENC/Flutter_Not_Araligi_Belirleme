import 'package:flutter/material.dart';
import 'hesapla.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  var myTextControllerA,
      myTextControllerB,
      myTextControllerC = TextEditingController();
  var deger1, deger2, deger3, mesaj;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
    tabController.addListener(() {
      var _selectedIndex = tabController.index;
      if (_selectedIndex == 0) {
        mesaj =
            "0 ile metin kutusuna girmis oldugunuz sayi arasindaki not girisleri D olarak adlandirilacaktir. ";
      } else if (_selectedIndex == 1) {
        mesaj =
            "D icin girmis oldugunuz deger ile metin kutusuna girmis oldugunuz sayi arasindaki not girisleri C olarak adlandirilacaktir. ";
      } else if (_selectedIndex == 2) {
        mesaj =
            "C icin girmis oldugunuz deger ile metin kutusuna girmis oldugunuz sayi arasindaki not girisleri B olarak adlandirilacaktir. Ayni zamanda, B icin girmis oldugunuz deger ve 100'e kadar olan tum degerler A olarak tanimlanacaktir.";
      }

      return Fluttertoast.showToast(
        msg: mesaj,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 20.0,
      );
      //print("Selected Index: " + tabController.index.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
    myTextControllerA.dispose();
    myTextControllerB.dispose();
    myTextControllerC.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: new AppBar(
            title: new Text(
              "Sinav Not Araliklari",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              child: Column(
                children: <Widget>[
                  TabBar(
                    onTap: (value) => tabController,
                    controller: tabController,
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(icon: Icon(Icons.looks_one)),
                      Tab(icon: Icon(Icons.looks_two)),
                      Tab(icon: Icon(Icons.three_k)),
                    ],
                  ),
                ],
              ),
              preferredSize: Size.fromHeight(50.0),
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Text(
                      "D-C icin kullanilicak Not Araligini Giriniz : ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      controller: myTextControllerA,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        deger1 = int.parse(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '1. Not Araligini Giriniz.',
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Text(
                      "C-B icin kullanilicak Not Araligini Giriniz : ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      controller: myTextControllerB,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        deger2 = int.parse(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '2. Not Araligini Giriniz.',
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Text(
                      "B-A icin kullanilicak Not Araligini Giriniz : ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      controller: myTextControllerC,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        deger3 = int.parse(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '3. Not Araligini Giriniz.',
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
                        'Kaydet ve Ikinci Sayfaya Gec',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Hesapla(
                                    deger1,
                                    deger2,
                                    deger3,
                                  )),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
