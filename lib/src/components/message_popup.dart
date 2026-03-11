import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePopup extends StatelessWidget {
  final String? title;
  final String? message;
  final Function()? okCallback;
  final Function()? cancelCallback;

  const MessagePopup({
    super.key,
    required this.title,
    required this.message,
    required this.okCallback,
    this.cancelCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, //(불투명?)뒷 배경 보이게 하는 방법
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //가운데 정렬
        children: [
          ClipRRect(
            //위젯의 모서리를 둥글게 깎아내는 레이아웃 위젯
            borderRadius: BorderRadius.circular(6), // 6만큼 둥글게 깎음
            child: Container(
              color: Colors.white, //흰색
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 15,
              ), //컨테이너 내부 여백 설정
              width: Get.width * 0.7, //현재 화면 전체 가로 길이의 0.7
              child: Column(
                children: [
                  Text(
                    // 시스템 글자 설정
                    title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 7), //사이 간격 7만큼
                  Text(
                    // 종료하시겠습니까? 글자 설정
                    message!,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(height: 15), //사이 간격 15만큼
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //변경됨
                      // ElevatedButton(onPressed: okCallback, child: Text('확인')),
                      // const SizedBox(width: 10),
                      // ElevatedButton(
                      //   onPressed: cancelCallback,
                      //   child: Text('최소'),
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors
                      //         .grey,
                      //   ),
                      // ),
                      //primary: --> backgroundColor: 로 바뀌었음!!
                      ElevatedButton(
                        //확인 버튼 생성
                        onPressed: () {
                          //누르면
                          Navigator.of(context).pop(true); //app.dart에 true
                        },
                        style: ElevatedButton.styleFrom(
                          //확인 버튼 설정
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text('확인'),
                      ),
                      const SizedBox(width: 10), //사이 간격 10
                      ElevatedButton(
                        //취소 버튼 생성
                        onPressed: () {
                          Navigator.of(context).pop(false); //app.dart에 false
                        },
                        style: ElevatedButton.styleFrom(
                          //취소 버튼 설정
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text('취소'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
