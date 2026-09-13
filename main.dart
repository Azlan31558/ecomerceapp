import 'package:flutter/material.dart';
import 'package:newecommapp/apptheme.dart';
import 'package:newecommapp/splashscreen.dart';
 

void main(){WidgetsFlutterBinding.ensureInitialized();runApp(const ShopEaseApp());}

class ShopEaseApp extends StatelessWidget{const ShopEaseApp({super.key});@override Widget build(BuildContext context)=>MaterialApp(debugShowCheckedModeBanner:false, theme: AppTheme.lightTheme,title:'ShopEase' ,home:const SplashScreen());}
