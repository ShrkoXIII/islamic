import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/taps/hadeth/hadeth.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'hadeth details'; 
  @override
  Widget build(BuildContext context) {
    Hadeth hadeth =ModalRoute.of(context)!.settings.arguments as Hadeth;  
     return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/default_bg.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(hadeth.title),
        ),
        body: Container(
                decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.05,
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                padding: EdgeInsets.all(15), //.circular (shortcut)
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(hadeth.content[index],
                      style: Theme.of(context).textTheme.titleLarge,
                      textDirection: TextDirection.rtl),
                  itemCount: hadeth.content.length,
                ),
              ),
      ),
    );
  }
  }
