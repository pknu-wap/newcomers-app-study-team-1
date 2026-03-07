import 'package:flutter/material.dart';
// import 'package:flutter_clone_instagram/src/app.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';

class SearchForcus extends StatefulWidget {
  const SearchForcus({super.key});

  @override
  State<SearchForcus> createState() => _SearchForcusState();
}

class _SearchForcusState extends State<SearchForcus>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  Widget _tabMenuOne(String menu) { //탭바의 이름을 받아 탭바 생성
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(vertical: 15),
      child: Text(menu, style: TextStyle(fontSize: 15, color: Colors.black)),
    );
  }

  PreferredSizeWidget _tapMenu() { //search 페이지의 검색 상단 탭바 구현
    return PreferredSize(
      child: Container(
        height: AppBar().preferredSize.height,
        width: Size.infinite.width,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xffe4e4e4))),
        ),
        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.black,
          tabs: [
            _tabMenuOne('인기'), //중복되어 widget으로 생성함
            _tabMenuOne('계정'),
            _tabMenuOne('오디오'),
            _tabMenuOne('태그'),
            _tabMenuOne('장소'),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
    );
  }

  Widget _body() { //search 페이지의 검색 중하단 페이지 구현
    return TabBarView( 
      controller: tabController,
      children: const [
        Center(child: Text('인기페이지')),
        Center(child: Text('계정페이지')),
        Center(child: Text('오디오페이지')),
        Center(child: Text('태그페이지')),
        Center(child: Text('장소페이지')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) { //search 페이지의 검색 구현
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          // onTap: BottomNavController.to.willPopAction,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(IconsPath.backBtnIcon), //search 페이지의 검색 뒤로가기 아이콘
          ),
        ),
        titleSpacing: 0,
        title: Container( //search 페이지의 검색 상단의 검색바 구현
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color(0xffefefef),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '검색',
              contentPadding: EdgeInsets.only(left: 15, top: 7, bottom: 7),
              isDense: true,
            ),
          ),
        ),
        bottom: _tapMenu(), //_tapMenu실행
      ),
      body: _body(), //_body실행
    );
  }
}
