import 'package:flutter/material.dart';
import 'package:flutter/animation.dart'; // 구현하는 앱에 애니메이션 효과가 사용되기 때문에

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MBTI LIVE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
      ),
      home: MbtiLiveScreen(),
    );
  }
}
class MbtiLiveScreen extends StatefulWidget {
  const MbtiLiveScreen({super.key});

  @override
  State<MbtiLiveScreen> createState() => _MbtiLiveScreenState();
}
class _MbtiLiveScreenState extends State<MbtiLiveScreen> {
  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    ThemeData theme = Theme.of(context); // 디자인 속성을 일괄로 적용하기위해 변수사용
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'MBTI 매칭 라이브',
            style: TextStyle(
              color: Colors.white,
            ),
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,// ThemeData의 primary 색상으로 설정합니다.
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Text(
                  'MBTI 성향 조합 테스트',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
              ),
            ),
            Center(
              child: Text(
                '두 MBTI 성향을 선택하세요',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
