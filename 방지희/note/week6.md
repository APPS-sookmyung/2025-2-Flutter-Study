# 노마드코더 Flutter로 웹툰 앱 만들기

## 4.0 State

- Stateless Widget은 build 메서드를 통해서 단지 UI를 출력한다.
- Stateful Widget은 상태를 가지고 있다.

Stateful Widget

1. 상태가 없는 위젯 그 자체
2. 위젯의 state: 위젯에 들어갈 데이터와 UI를 저장한다.

- 데이터가 변경되면 위젯의 UI도 변경된다.

---

## 4.1 setState

- setState 호출은 Flutter의 위젯에게 새로운 데이터가 있으니 build 메서드를 다시 실행하여 UI를 업데이트 하라는 뜻이다.

```dart
void onClicked() {
    counter = counter + 1;
    setState(() {});
}
```

```dart
void onClicked() {
    setState(() {
        counter = counter + 1;
    })
} // 이걸 더 추천
```

- 위의 두 코드는 같다.

---

## 4.3 BuildContext

- BuildContext: 현재 위젯의 위치와 위젯 트리 내 관계 정보를 가진 객체이다.
- 스타일을 미리 ThemeData 등으로 정의해 놓고 BuildContext로 불러와 쓰는 구조가 Flutter의 효율적인 스타일 관리 방법이다.

```dart
theme: ThemeData(
    textTheme: const TextTheme(
        titleLarge: TextStyle(
            color: Colors.red,
        ),
    ),
),
...

@override
Widget build(BuildContext context) {
    return Text(
        'My Large Title',
        style: TextStyle(
            fontSize: 30,
            color: Theme.of(context).textTheme.titleLarge!.color, // !는 무조건 null 값이 아니라는 것을 뜻함
        )
    )
}
```

---

## 4.4 Widget Lifecycle

**InitState**

- 상태를 초기화 하기 위한 메서드이다.
- 거의 안 쓰지만 종종 부모 요소에 의존하는 데이터를 초기화하는 경우 등에 사용한다.
- initState 메서드는 항상 build 메서드보다 먼저 호출되어야 한다.
- 위젯의 라이프사이클 중 최초 한 번만 호출된다.

```dart
@override
void initState() {
    super.initState();
    print('initState!');
}
```

**dispose**

- 위젯이 스크린에서(위젯트리에서) 제거될 때 호출되는 메서드이다.
- API 업데이트, 이벤트 리스너로부터 구독을 취소, form의 리스너로부터 벗어나는 경우 등에 사용한다.

---

## 5.0 User Interface

**Flexible**

- 하드 코딩되는 값을 만들게 해준다.
- UI를 비율에 기반해서 더 유연하게 만들 수 있게 한다.
- 하나의 박스가 얼마나 공간을 차지할지 비율을 정한다.

---

## 5.1 Timer

**late modifier**

- property를 당장 초기화하지 않아도 된다.
- 단, property를 사용하기 전에 반드시 초기화해야 한다.
