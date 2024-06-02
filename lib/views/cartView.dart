import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';


class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Consumer<BurgerController>(builder: (context,_,widget) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios_new)),
                  Column(
                    children: List.generate(
                        context.read<BurgerController>().cartList?.length ?? 0,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.amber),
                                height: 100,
                                width: double.infinity,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                          context.read<BurgerController>().cartList?[index]?.image ??
                                              "assets/images (1).jpg"),
                                      Text(
                                        "cheese burger",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    context.read<BurgerController>().icreament(context.read<BurgerController>()
                                                        .cartList?[index]);
                                                  },
                                                  child: Icon(Icons.add)),
                                              Text(context.read<BurgerController>().cartList?[index]
                                                      ?.quantity
                                                      .toString() ??
                                                  '0'),
                                              InkWell(
                                                  onTap: () {
                                                    context.read<BurgerController>().decreament(context.read<BurgerController>()
                                                        .cartList?[index]);
                                                  },
                                                  child: Icon(Icons.remove)),
                                            ],
                                          )
                                        ],
                                      )
                                    ]),
                              ),
                            )),
                  )
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
