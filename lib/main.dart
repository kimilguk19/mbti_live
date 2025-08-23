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
  // MBTI 초기 값 지정(16개)
  List<String> mbtiTypes = [
    'ISTJ', 'ISFJ', 'INFJ', 'INTJ',
    'ISTP', 'ISFP', 'INFP', 'INTP',
    'ESTP', 'ESFP', 'ENFP', 'ENTP',
    'ESTJ', 'ESFJ', 'ENFJ', 'ENTJ'
  ];
// MBTI 유형에 매칭되는 16개의 색상
  List<Color> mbtiColors = [
    Colors.red,     //ISTJ-
    Colors.orange,  //ISFJ
    Colors.yellow,  //INFJ
    Colors.green,   //INTJ-
    Colors.blue,    //ISTP-
    Colors.indigo,  //ISFP
    Colors.purple,  //INFP
    Colors.pink,    //INTP-
    Colors.teal,    //ESTP-
    Colors.cyan,    //ESFP
    Colors.lime,    //ENFP
    Colors.amber,   //ENTP-
    Colors.brown,   //ESTJ-
    Colors.grey,    //ESFJ
    Colors.blueGrey,//ENFJ
    Colors.deepPurple//ENTJ-
  ];
  Map<String, Map<String, List<String>>> mbtiMatches = {
    'ISTJ': {'best': ['ISTJ', 'ISFJ'], 'good': ['ISTJ', 'INFJ'], 'bed': ['ISTJ', 'INTJ']},
    'ISFJ': {'best': ['ISFJ', 'ISTJ'], 'good': ['ISFJ', 'INFP'], 'bed': ['ISFJ', 'INTP']},
    'INFJ': {'best': ['INFJ', 'ISTJ'], 'good': ['INFJ', 'ISFP'], 'bed': ['INFJ', 'INTJ']},
    'INTJ': {'best': ['INTJ', 'ISTJ'], 'good': ['INTJ', 'INFP'], 'bed': ['INTJ', 'ISFP']},
    'ISTP': {'best': ['ISTP', 'ISFP'], 'good': ['ISTP', 'INFP'], 'bed': ['ISTP', 'INTP']},
    'ISFP': {'best': ['ISFP', 'ISTP'], 'good': ['ISFP', 'INFP'], 'bed': ['ISFP', 'INTJ']},
    'INFP': {'best': ['INFP', 'ISTP'], 'good': ['INFP', 'ISFP'], 'bed': ['INFP', 'INTP']},
    'INTP': {'best': ['INTP', 'ISTP'], 'good': ['INTP', 'ISFP'], 'bed': ['INTP', 'INFJ']},
    'ESTP': {'best': ['ESTP', 'ESFP'], 'good': ['ESTP', 'ENFP'], 'bed': ['ESTP', 'ENTP']},
    'ESFP': {'best': ['ESFP', 'ESTP'], 'good': ['ESFP', 'ENFP'], 'bed': ['ESFP', 'ENTJ']},
    'ENFP': {'best': ['ENFP', 'ESTP'], 'good': ['ENFP', 'ESFP'], 'bed': ['ENFP', 'ENTJ']},
    'ENTP': {'best': ['ENTP', 'ESTP'], 'good': ['ENTP', 'ESFP'], 'bed': ['ENTP', 'ENFJ']},
    'ESTJ': {'best': ['ESTJ', 'ESFJ'], 'good': ['ESTJ', 'ENFJ'], 'bed': ['ESTJ', 'ENTJ']},
    'ESFJ': {'best': ['ESFJ', 'ESTJ'], 'good': ['ESFJ', 'ENFP'], 'bed': ['ESFJ', 'ENTJ']},
    'ENFJ': {'best': ['ENFJ', 'ESTJ'], 'good': ['ENFJ', 'ESFP'], 'bed': ['ENFJ', 'ENTP']},
    'ENTJ': {'best': ['ENTJ', 'ESTJ'], 'good': ['ENTJ', 'ESFP'], 'bed': ['ENTJ', 'ENFP']}
  };
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
