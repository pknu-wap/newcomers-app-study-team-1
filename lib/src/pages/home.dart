import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/avatar_widget.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:flutter_clone_instagram/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _myStory() {
    return Stack( //레이어? 설정하는거 같다
      children: [
        AvatarWidget( //이미지 설정
          type: AvatarType.TYPE2,
          thumbPath:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROHxYft1f_Ln_y_scKnh8-g5rLMmce7JKyPQ&s',
          size: 70,
        ),
        Positioned( //위치 설정
          right: 5,
          bottom: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Center( //스토리 추가 (+) 설정
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _storyBoardList() { //내것이 아닌 스토리 100개 생성
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 20),
          _myStory(),
          SizedBox(width: 5),
          ...List.generate(
            100,
            (index) => AvatarWidget(
              type: AvatarType.TYPE1,
              thumbPath:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGa70BgePn1Rsf41oiG6ac0_TAzpKXj4d9qg&s',
            ),
          ),
        ],
      ),
    );
  }

  Widget _postList() { //게시물 50개 생성
    return Column(children: List.generate(50, (index) => PostWidget()).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ImageData(IconsPath.logo, width: 270),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(IconsPath.directMessage, width: 50),
            ),
          ),
        ],
      ),
      body: ListView(children: [_storyBoardList(), _postList()]),
    );
  }
}
