import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/classes/items.dart';
import 'package:mini_ecommerce_app/constant/appbar.dart';
import 'package:mini_ecommerce_app/constant/colors.dart';

class Details extends StatefulWidget {
  final Item item;
  const Details(
      {super.key, required this.item});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isShowMore = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appbarGreen,
          title: const Text("Details"),
          actions: const [
            MyAppBar()
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(widget.item.imgPath),
              const SizedBox(
                height: 11,
              ),
               Text(
                '\$ ${widget.item.price}',
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 223, 98, 98),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'New',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 226, 206, 25),
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 226, 206, 25),
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 226, 206, 25),
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 226, 206, 25),
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 226, 206, 25),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 77,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.location_on),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Flower Shop',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Details:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 8, right: 8, bottom: 4, left: 4),
                child: Text(
                  'A flower, also known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). Flowers consist of a combination of vegetative organs – sepals that enclose and protect the developing flower, petals that attract pollinators, and reproductive organs that produce gametophytes, which in flowering plants produce gametes. The male gametophytes, which produce sperm, are enclosed within pollen grains produced in the anthers. The female gametophytes are contained within the ovules produced in the carpels.',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  // ignore: dead_code
                  maxLines: isShowMore ? 3 : null,
                  overflow: TextOverflow.fade,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isShowMore = !isShowMore;
                  });
                },
                child: Text(
                  isShowMore ? 'Show More' : "Show less",
                  style: const TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
