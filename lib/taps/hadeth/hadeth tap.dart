import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/taps/hadeth/hadeth.dart';
import 'package:islamic/taps/hadeth/hadeth_details.dart';
import 'package:islamic/taps/widgets/loading_indecator.dart';

class Hadethtap extends StatefulWidget {
  @override
  State<Hadethtap> createState() => _HadethtapState();
}

class _HadethtapState extends State<Hadethtap> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadAhadethFile();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/hadeth_logo.png'),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: ahadeth.isEmpty
              ? LoadingIndecator()
              : ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                    //gesturedetector no motion and it can have more than an option
                    onTap: () {
                      Navigator.of(context).pushNamed(HadethDetails.routeName,
                          arguments: ahadeth[index] 
                          );
                    },
                    child: Text(
                      ahadeth[index].title,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ), //take the current theme
                  itemCount: ahadeth.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8,
                  ),
                ),
        )
      ],
      //  color: Colors.green,
    );
  }

  Future<void> loadAhadethFile() async {
    String ahadethfilecontent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethStringes = ahadethfilecontent.split('#\r\n');
    ahadeth = ahadethStringes.map((hadethString) {
      List<String> hadethLines = hadethString.split('\n');//trim()
      String title = hadethLines.first;
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      return Hadeth(title, content);
    }).toList();
    setState(() {});
  }
}
