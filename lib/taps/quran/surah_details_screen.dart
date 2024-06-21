import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/taps/widgets/loading_indecator.dart';

class SurahDetailsScreen extends StatefulWidget {
  static const String routename = 'sura_details';

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    SurahDetailsScreenArgument args = ModalRoute.of(context)!.settings.arguments
        as SurahDetailsScreenArgument;
    if (ayat.isEmpty) {
      loadsorafile(args.index);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/default_bg.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.surahname),
        ),
        body: ayat.isEmpty
            ? LoadingIndecator()
            : Container(
                decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.05,
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                padding: EdgeInsets.all(15), //.circular (shortcut)
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(ayat[index],
                      style: Theme.of(context).textTheme.titleLarge,
                      textDirection: TextDirection.rtl),
                  itemCount: ayat.length,
                ),
              ),
      ),
    );
  }

  Future<void> loadsorafile(int index) async {
    // async and await come to gether
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    ayat = sura.split('\n');
    //ayat=['a','a','c'];
    setState(() {});
  }
}

class SurahDetailsScreenArgument {
  int index;
  String surahname;
  SurahDetailsScreenArgument(this.index, this.surahname);
}
