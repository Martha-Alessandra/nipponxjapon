import 'package:flutter/material.dart';

class TipsView extends StatefulWidget {
  const TipsView({super.key});

  @override
  State<TipsView> createState() => _TipsViewState();
}

class _TipsViewState extends State<TipsView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> myTabs = const [
    Tab(text: 'Comida'),
    Tab(text: 'Skincare'),
    Tab(text: 'Medicinas'),
    Tab(text: 'Tips'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildContenidoPlaceholder(String categoria) {
    return Center(
      child: Text(
        'Aquí irán las recomendaciones de $categoria',
        style: const TextStyle(fontSize: 18, color: Color(0xFF555555)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF272727),
        title: const Text(
          'Tips de Viaje',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.bold,
            color: Color(0xFFD30000),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFFD30000),
          unselectedLabelColor: Colors.white,
          indicatorColor: const Color(0xFFD30000),
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildContenidoPlaceholder("Comida"),
          buildContenidoPlaceholder("Skincare"),
          buildContenidoPlaceholder("Medicinas"),
          buildContenidoPlaceholder("Tips"),
        ],
      ),
    );
  }
}
