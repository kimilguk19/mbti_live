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
  // 선택된 상태를 지정할 초기값 없는 private 변수
  String? _selectedMbtiType1;
  String? _selectedMbtiType2;
  // MBTI 초기 값 지정(16개)
  List<String> mbtiTypes = [
    'ISTJ',
    'ISFJ',
    'INFJ',
    'INTJ',
    'ISTP',
    'ISFP',
    'INFP',
    'INTP',
    'ESTP',
    'ESFP',
    'ENFP',
    'ENTP',
    'ESTJ',
    'ESFJ',
    'ENFJ',
    'ENTJ',
  ];
  // MBTI 유형에 매칭되는 16개의 색상
  List<Color> mbtiColors = [
    Colors.red, //ISTJ-
    Colors.orange, //ISFJ
    Colors.yellow, //INFJ
    Colors.green, //INTJ-
    Colors.blue, //ISTP-
    Colors.indigo, //ISFP
    Colors.purple, //INFP
    Colors.pink, //INTP-
    Colors.teal, //ESTP-
    Colors.cyan, //ESFP
    Colors.lime, //ENFP
    Colors.amber, //ENTP-
    Colors.brown, //ESTJ-
    Colors.grey, //ESFJ
    Colors.blueGrey, //ENFJ
    Colors.deepPurple, //ENTJ-
  ];
  Map<String, Map<String, List<String>>> mbtiMatches = {
    'ISTJ': {
      'best': ['ISTJ', 'ISFJ'],
      'good': ['ISTJ', 'INFJ'],
      'bed': ['ISTJ', 'INTJ'],
    },
    'ISFJ': {
      'best': ['ISFJ', 'ISTJ'],
      'good': ['ISFJ', 'INFP'],
      'bed': ['ISFJ', 'INTP'],
    },
    'INFJ': {
      'best': ['INFJ', 'ISTJ'],
      'good': ['INFJ', 'ISFP'],
      'bed': ['INFJ', 'INTJ'],
    },
    'INTJ': {
      'best': ['INTJ', 'ISTJ'],
      'good': ['INTJ', 'INFP'],
      'bed': ['INTJ', 'ISFP'],
    },
    'ISTP': {
      'best': ['ISTP', 'ISFP'],
      'good': ['ISTP', 'INFP'],
      'bed': ['ISTP', 'INTP'],
    },
    'ISFP': {
      'best': ['ISFP', 'ISTP'],
      'good': ['ISFP', 'INFP'],
      'bed': ['ISFP', 'INTJ'],
    },
    'INFP': {
      'best': ['INFP', 'ISTP'],
      'good': ['INFP', 'ISFP'],
      'bed': ['INFP', 'INTP'],
    },
    'INTP': {
      'best': ['INTP', 'ISTP'],
      'good': ['INTP', 'ISFP'],
      'bed': ['INTP', 'INFJ'],
    },
    'ESTP': {
      'best': ['ESTP', 'ESFP'],
      'good': ['ESTP', 'ENFP'],
      'bed': ['ESTP', 'ENTP'],
    },
    'ESFP': {
      'best': ['ESFP', 'ESTP'],
      'good': ['ESFP', 'ENFP'],
      'bed': ['ESFP', 'ENTJ'],
    },
    'ENFP': {
      'best': ['ENFP', 'ESTP'],
      'good': ['ENFP', 'ESFP'],
      'bed': ['ENFP', 'ENTJ'],
    },
    'ENTP': {
      'best': ['ENTP', 'ESTP'],
      'good': ['ENTP', 'ESFP'],
      'bed': ['ENTP', 'ENFJ'],
    },
    'ESTJ': {
      'best': ['ESTJ', 'ESFJ'],
      'good': ['ESTJ', 'ENFJ'],
      'bed': ['ESTJ', 'ENTJ'],
    },
    'ESFJ': {
      'best': ['ESFJ', 'ESTJ'],
      'good': ['ESFJ', 'ENFP'],
      'bed': ['ESFJ', 'ENTJ'],
    },
    'ENFJ': {
      'best': ['ENFJ', 'ESTJ'],
      'good': ['ENFJ', 'ESFP'],
      'bed': ['ENFJ', 'ENTP'],
    },
    'ENTJ': {
      'best': ['ENTJ', 'ESTJ'],
      'good': ['ENTJ', 'ESFP'],
      'bed': ['ENTJ', 'ENFP'],
    },
  };
  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    ThemeData theme = Theme.of(context); // 디자인 속성을 일괄로 적용하기위해 변수사용
    return Scaffold(
      appBar: AppBar(
        title: const Text('MBTI 매칭 라이브', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor:
            theme.colorScheme.primary, // ThemeData의 primary 색상으로 설정합니다.
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
            SizedBox(height: 16.0),
            Expanded(
              // 화면을 벗어나는 내용이 있으면 에러가 발생되므로, 내용을 가득채우는 위젯으로 감싸줌
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, //가로축의 개수
                  crossAxisSpacing: 8.0, //가로축의 사이간격
                  mainAxisSpacing: 8.0, //세로축의 사이간격
                ),
                itemCount: mbtiTypes.length, //출력할 전체개수
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      print('MBTI Type: ${mbtiTypes[index]}');
                      // 2개의 MbtiType을 선택했을 경우 _selectedMbtiType1,2 값 저장(아래)
                      if (_selectedMbtiType1 == null) {
                        setState(() { // setState를 사용하여 UI를 업데이트
                          _selectedMbtiType1 = mbtiTypes[index];
                        });
                      } else if (_selectedMbtiType2 == null) {
                        setState(() {
                          _selectedMbtiType2 = mbtiTypes[index];
                        });
                      }
                      // 2개의 MbtiType을 선택했을 경우 showDialog 창을 띄운다.(아래)
                      if (_selectedMbtiType1 != null && _selectedMbtiType2 != null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('MBTI 매칭 결과'),
                              content: Text(
                                'MBTI Type1: ${_selectedMbtiType1}\nMBTI Type2: ${_selectedMbtiType2}',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('확인'),
                                ),
                              ],
                            );
                          } // builder
                        ); // showDialog
                      }
                    }, // 액션 처리 예정
                    child: Card(
                      elevation: 4.0, // 그림자 효과
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: mbtiColors[index],
                          borderRadius: BorderRadius.circular(8.0),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [ //0~255의 색상 값에서 50% 의 투명도 계산(아래)
                              mbtiColors[index].withAlpha((255 * 0.5).round()),
                              mbtiColors[index].withOpacity(1.0),//deprecated예정
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            mbtiTypes[index],
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }, // itemBuilder
              ),
            ),
          ],
        ),
      ),
    );
  }
}
