import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/avatar_widget.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  Widget _header() { // 게시물 프로필, 닉네임, 더보기 표시 설정
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //사이에 거리를 둠
        children: [
          AvatarWidget(
            type: AvatarType.TYPE3,
            nickname: '개발하는남자', //닉네임
            size: 40, //프로필 크기
            thumbPath: //이미지 주소
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROHxYft1f_Ln_y_scKnh8-g5rLMmce7JKyPQ&s',
          ),
          GestureDetector(
            onTap: () {}, //누르면 암것도 안일어남
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(IconsPath.postMoreIcon, width: 30),
            ),
          ),
        ],
      ),
    );
  }

  Widget _image() { //게시물 설정
    return CachedNetworkImage(
      imageUrl:
          'https://www.adobe.com/kr/products/firefly/features/media_156f60527ad304e5d5cc92b1c934b381d6ff0625c.jpg?width=750&format=jpg&optimize=medium',
    );
  }

  Widget _infoCount() { //게시물 아래 좋아요, 댓글, 보내기, 북마크 표시 설정
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(IconsPath.likeOffIcon, width: 65),
              SizedBox(width: 15),
              ImageData(IconsPath.replyIcon, width: 60),
              SizedBox(width: 15),
              ImageData(IconsPath.directMessage, width: 55),
            ],
          ),
          ImageData(IconsPath.bookMarkOffIcon),
        ],
      ),
    );
  }

  Widget _infoDescription() { //댓글 설정, 더보기, 접기, 프로필 이동 설정(구체적 내용 설정)
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('좋아요 150개', style: TextStyle(fontWeight: FontWeight.bold)),
          ExpandableText(
            '콘텐츠 1입니다.\n콘텐츠 1입니다.\n콘텐츠 1입니다.\n콘텐츠 1입니다.\n콘텐츠 1입니다.\n',
            prefixText: '개발하는 남자',
            onPrefixTap: () {
              print('개발하는 남자 프로필로 이동');
            },
            prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
            expandText: '더보기',
            collapseText: '접기',
            maxLines: 3,
            expandOnTextTap: true,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _replyTextBtn() { //댓글 표시 (구현 X) 설정
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          '댓글 199개 모두 보기',
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ),
    );
  }

  Widget _dataAgo() { //몇일전 표시 설정
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        '1일전',
        style: TextStyle(color: Colors.grey, fontSize: 11),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20), //위쪽만 20 간격s
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(),
          const SizedBox(height: 15), //사이간격 주기
          _image(),
          const SizedBox(height: 15),
          _infoCount(),
          const SizedBox(height: 5),
          _infoDescription(),
          const SizedBox(height: 5),
          _replyTextBtn(),
          const SizedBox(height: 5),
          _dataAgo(),
        ],
      ),
    );
  }
}
