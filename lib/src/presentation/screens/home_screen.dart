import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/core/strings.dart';
import 'package:flutter_news_app/src/presentation/screens/all_screen.dart';

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
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16)
                .copyWith(bottom: 6),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(left: 12, bottom: 4),
                  height: 36,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(26)),
                      border: Border.all(color: Colors.black12)),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: searching,
                      hintStyle: TextStyle(fontSize: 13),
                      suffixIcon: Icon(Icons.search_rounded,
                          color: Color(0xff818181), size: 20),
                      border: InputBorder.none,
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                )),
                const SizedBox(width: 8),
                const CircleAvatar(
                    backgroundColor: Color(0xffFF3A44),
                    radius: 18,
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
            splashBorderRadius: const BorderRadius.all(Radius.circular(20)),
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: const Color(0x992E0505),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
            indicatorColor: Colors.transparent,
            labelStyle:
                const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            isScrollable: true,
            tabs: [
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: index == 0 ? const Color(0xffFF3A44) : Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: const Color(0xfff0f1fA)),
                ),
                child: const Tab(text: all),
              ),
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: index == 1 ? const Color(0xffFF3A44) : Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: const Color(0xfff0f1fA)),
                ),
                child: const Tab(text: technology),
              ),
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: index == 2 ? const Color(0xffFF3A44) : Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: const Color(0xfff0f1fA))),
                child: const Tab(text: finance),
              ),
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: index == 3 ? const Color(0xffFF3A44) : Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: const Color(0xfff0f1fA))),
                child: const Tab(text: sport),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const AllPage(),
                Container(
                  color: Colors.yellow,
                ),
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
