import 'package:flutter/material.dart';

class CounterFuntionsScreen extends StatefulWidget {
  const CounterFuntionsScreen({super.key});

  @override
  State<CounterFuntionsScreen> createState() => _CounterFuntionsScreenState();
}

class _CounterFuntionsScreenState extends State<CounterFuntionsScreen> {

  int clickCounter = 0;

  void aumenta(){
    clickCounter++;
    setState(() {});
  }
  void decrementa(){
    if( clickCounter == 0 ) return;
    clickCounter--;
    setState(() {});
  }
  void reset(){
    setState(() {
      clickCounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Counter Functions')),
          elevation: 25,    

          // iconos al lado derecho
          // leading: IconButton(
          //   icon: const Icon( Icons.refresh_outlined, size: 33, ),
          //   onPressed: () {  }, 
          // ), 

          // iconos al lado izquierdo
          actions: [
            IconButton(
              icon: const Icon( Icons.refresh_outlined, size: 23, ),
              onPressed: reset, 
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$clickCounter", style: const TextStyle( fontSize: 160, fontWeight: FontWeight.w100),),              
              Text( 'Click${clickCounter>1 ? 's' : ''}', style: const TextStyle(fontSize: 25),),              
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [ 
            CustomButton( onPressed: reset, icon: Icons.refresh_outlined),
            const SizedBox( height: 10 ),
            CustomButton( onPressed: aumenta, icon: Icons.plus_one),
            const SizedBox( height: 10 ),
            CustomButton( onPressed: decrementa, icon: Icons.exposure_minus_1_outlined),            
          ],
        ),
    );
  }
}

//reset

class CustomButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressed; 

  const CustomButton({
    super.key, 
    required this.icon, 
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton (
      onPressed: onPressed,
      child: Icon( icon ),          
    );
  }
}