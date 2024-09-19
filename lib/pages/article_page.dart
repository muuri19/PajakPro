import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  static const routeName = 'article-page';
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          backgroundColor: Colors.green.shade900,
          title: const Text(
            "Artikel Seputar Pajak",
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: Colors.green,
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(1, 1),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("[Role Viewer]"),
                              Text("[DateTime - Posted]"),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Flexible(
                                child: Text(
                                  "Aliquip dolore culpa elit laborum occaecat est incididunt Lorem officia magna adipisicing dolor proident. Irure exercitation amet aliquip veniam est in ex esse dolor sint reprehenderit et. Est enim sint fugiat id ipsum consequat ad nulla dolore. Nisi amet consectetur officia deserunt enim ex excepteur sit in laborum.",
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    image: const DecorationImage(
                                        image: NetworkImage(
                                            "https://mediakeuangan.kemenkeu.go.id/files/Article/laporan-utama/2023/mediagathering/WhatsApp%20Image%202023-10-20%20at%2009.32.54.jpeg"),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
