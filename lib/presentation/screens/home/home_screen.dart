import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric( horizontal: 30 ),
              child: CustomScrollView(
                slivers: [
                  
                  SliverAppBar(
                    title: const Text('Miscelaneos'),
                    actions: [
                      IconButton(
                        icon: const Icon( Icons.settings ),
                        onPressed: (){
                          context.push('/permissions');
                        }
                      )
                    ],
                  ),
                  
                  const MainMenu()
                ],
              ),
            ),
          ),

          // Ad Banner
          Container(
            color:  Colors.red,
            width: double.infinity,
            height: 75,
          )
        ],
      ),
    );
  }
}