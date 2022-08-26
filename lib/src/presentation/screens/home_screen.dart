import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/model/news_model.dart';
import 'package:flutter_news_app/src/presentation/provider/dataclass.dart';
import 'package:flutter_news_app/src/presentation/widget/posts.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../../services/service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  int index = 0;

  @override
  initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16)
                .copyWith(bottom: 6),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(26)),
                      border: Border.all(color: Colors.black12)),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Searching",
                      suffixIcon:
                          Icon(Icons.search_rounded, color: Color(0xff818181)),
                      border: InputBorder.none,
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                )),
                const SizedBox(width: 8),
                const CircleAvatar(
                    backgroundColor: Color(0xffFF3A44),
                    radius: 20,
                    child: Icon(
                      Icons.notifications_on_outlined,
                      size: 25,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          const SizedBox(height: 6),
          TabBar(
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: const Color(0x992E0505),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
            indicatorColor: Colors.transparent,
            labelStyle:
                const TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
            isScrollable: true,
            tabs: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: index == 0 ? const Color(0xffFF3A44) : Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: const Tab(text: "All"),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    color: index == 1 ? const Color(0xffFF3A44) : Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: const Color(0xfff0f1fA))),
                child: const Tab(text: "Technology"),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: index == 2 ? const Color(0xffFF3A44) : Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: const Tab(text: "Finance"),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                FutureBuilder(
                  future: DataService.fetchDataAPI(),
                  builder: (_, AsyncSnapshot<List<Articles>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (snapshot.hasError) {
                      if (kDebugMode) {
                        print('Error => ${snapshot.error}');
                      }
                    }
                    List<Articles> data = snapshot.data!;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return BuildPost(
                          data[index].title!,
                          data[index].urlToImage ?? '',
                          data[index].description ?? '',
                          data[index].publishedAt!,
                          data[index].author??'',
                        );
                      },
                    );
                  },
                ),
                Container(
                  color: Colors.yellow,
                ),
                Container(
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
