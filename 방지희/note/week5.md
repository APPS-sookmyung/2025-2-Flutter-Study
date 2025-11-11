# 노마드코더 Flutter로 웹툰 앱 만들기

## 3.0 Header

```dart
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [Text('Hey, Selena'), Text('Welcome back')]),
      ),
    );
  }
}
```

하나의 Column, 하나의 Row, Row 안의 하나의 Column

```dart
SizedBox(height: 80)
```

- Row의 MainAxisAlignment는 수평 방향
- Column의 MainAxisAlignment는 수직 방향

```dart
padding: EdgeInsets.all(20),
```

화면의 상하좌우 모두에 padding 20

---

## 3.2 Buttons Section

```dart
Padding(
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
    child: Text('Transfer'),
)
```

Padding Widget

```dart
Container(
    decoration: BoxDecoration(
    color: Colors.amber,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      child: Text('Transfer'),
    )
)
```

Container Widget

---

## 3.3 VSCode Settings

- constant는 수정할 수 없고, compile 전에 그 value를 알 수 있는 변수

```dart
Color(0xFF181818),
const Color(0xFF181818),
```

const Color는 런타임 대신, 컴파일러가 컴파일 하는 중에 값을 산정할 수 있다.

```json
"editor.codeActionsOnSave": {
    "source.fixAll": true
},
"dart.previewFlutterUiGuides": true
```

settings.json에 추가

---

## 3.4 Code Actions

- 코드 수정, 리팩토링, 자동 완성 등을 도와주는 기능
- 선택한 위젯을 Center 등으로 감싸거나(Wrap with Widget), 위젯을 삭제하는 등 구조 변경 가능
- 위젯 배치, 이동, 삭제 등 코드 구조를 빠르게 바꿔준다

---

## 3.7 Icons and Transforms

```dart
clipBehavior: Clip.hardEdge
```

카드를 넘어가는 부위 자르기
