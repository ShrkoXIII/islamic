import 'package:flutter/material.dart';
import 'package:islamic/taps/hadeth/hadeth%20tap.dart';
import 'package:islamic/taps/quran/quran_tap.dart';
import 'package:islamic/taps/radio/radio_tap.dart';
import 'package:islamic/taps/sebha/sebha_tap.dart';
import 'package:islamic/taps/settings/settings_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> taps=[QuranTap(),Hadethtap(),SebhaTap(),RadioTap(),SettingsTap()];
  int selectedindex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/default_bg.png'))
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('إسلامي'),
        ) ,
       // extendBodyBehindAppBar: true, if i wrap the body
       // backgroundColor: Colors.transparent, ican wrap the taps inthe bodt with animage container or wrap all the scaffold 
       body: taps[selectedindex],
       bottomNavigationBar:BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex:selectedindex ,
          onTap: (index){
            selectedindex=index;
            setState(() {
            
            });
          },
          items: [
          BottomNavigationBarItem(icon:ImageIcon( AssetImage('assets/images/icon_quran.png')),label:'Quran',),    
            
          BottomNavigationBarItem(icon:ImageIcon( AssetImage('assets/images/icon_hadeth.png')),label:'Hadeeth',),
          
          BottomNavigationBarItem(icon:ImageIcon( AssetImage('assets/images/icon_sebha.png')),label:'Sebhah',),
      
          BottomNavigationBarItem(icon:ImageIcon( AssetImage('assets/images/icon_radio.png')),label:'Radio',),
           
          BottomNavigationBarItem(icon: Icon(Icons.settings),label:'Settings',),   
      
        ],) ,
      ),
    );
  }
}