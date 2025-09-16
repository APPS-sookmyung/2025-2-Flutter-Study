## 0 Introduction

- dart는 UI에 최적화돼있음
- 생산적인 개발환경을 가짐
- 모든 플랫폼에서 빠름

- dart는 두 개의 컴파일러를 가진다
- Dart Web: dart로 쓴 코드를 javascript로 변환해주는 컴파일러
- Dart Native: dart 코드를 여러 CPU의 아키텍쳐에 맞게 변환해줌

- JIT: just-in-time → JIT 컴파일러는 dart VM을 사용하는데 코드의 결과를 바로 화면에 보여줌 / 개발할 때만 사용
- AOT: ahead-of-time → 앱을 배포할 때는 AOT 컴파일러를 사용함
- 예를 들어 C, C++, Rust, Go로 코딩한다면 코딩을 다 하고 컴파일할 때 아키텍쳐를 지정해야 함
- null safety는 안전한 프로그램을 빌드할 때 중요함
- Flutter의 최적화를 위해 Dart 언어를 수정할 수 있음

- flutter extension

## 1 Variables

- main 함수는 모든 Dart 프로그램의 Entry point이므로 중요하다
- 모든 코드는 main 함수 안에 들어가야 한다
- 세미콜론 주의!

- var: 함수나 메소드 내부에 지역 변수를 선언할 때
- 타입 지정: class나 변수나 property를 선언할 때
- 데이터의 타입만 유지되면 변수는 업데이트가 가능하다

- dynamic: 여러 가지 타입을 가질 수 있는 변수에 쓰는 키워드

```dart
void main() {
  print('hello world');

  var name1 = '니꼬';
  name1 = 'nico';

  String name2 = '니꼬';
  name2 = 'nico';
}
```

```dart
void main() {
  var name3; //변수의 타입: dynamic
  dynamic name4; //var 대신 dynamic이라고 써도 된다
  name3 = 'nico';
  name3 = 12;
  name3 = true;
}
```

- 어떤 데이터를 받았는데 그 데이터의 타입을 모른다면 dynamic을 이용해 dart가 데이터 타입을 확인하게 도와준다 -> 타입이 확인되면 dart는 데이터의 타입이 뭔지 알게 된다
- 사용이 거의 권장되지 않고 꼭 필요할 때만 쓰기

- null safety는 개발자가 null 값을 참조할 수 없도록 하는 것
- 런타임 에러: 사용자가 앱을 사용하던 중에 뜨는 에러

```dart
//Witout null safety:
bool is Empty(String string) => string.length == 0;

main() {
    isEmpty(null);
}
```

```dart
void main() {
  String nico = 'nico';
  nico = null;
} //오류

void main() {
  String? nico = 'nico';
  nico = null;
} //OK nico가 String일 수도, null일 수도 있음을 dart가 앎
```

- var 대신 final로 변수를 만들면 변수 업데이트가 안 된다

```dart
void main() {
  final name = 'nico'; //final String name = 'nico'라고 해도 됨
  name = null;
} //오류
```

- late는 final이나 var 앞에 붙여줄 수 있는 수식어
- late는 초기 데이터 없이 변수를 선언할 수 있게 한다

```dart
late final String name;
  //do something, go to api
  name = 'nico';
  name = '12'; //오류 final이니까
```

- dart에서 const는 compile-time constant를 만들어준다
- const는 컴파일 할 때 알고 있는 값에 사용한다

```dart
const API = '121212';
  const API = fetchaApi(); //오류
  final API = fetchaApi(); //이렇게 써야함
```

## 2 Data types

```dart
num x = 12;
x = 1.1;
```

- num은 integer, double 모두 사용 가능
- num: integer와 double의 부모 class

### Lists

```dart
void main() {
  var numbers1 = [1, 2, 3, 4]; //보통 var로 써야 함
  List<int> numbers2 = [1, 2, 3, 4]; //이렇게 써도 됨
  numbers1.add(1);
  numbers1.first; //배열의 첫 요소
  numbers1.last; //배열의 마지막 요소
}
```

- collection if와 collection for을 지원한다

```dart
void main() {
  var giveMeFive = true;
  var numbers = [1, 2, 3, 4, if (giveMeFive) 5]; //giveMeFive가 true면 5 배열에 5 추가
}
```

### String Interpolation

- string interpolation은 text에 변수를 추가하는 방법

```dart
void main() {
  var name = 'nico';
  var greeting = 'Hello everyone, my name is $name, nice to meet you!';
}
```

- 큰따옴표, 작은따옴표 상관 없다
- 달러 기호 뒤에는 반드시 변수 적어주기

```dart
void main() {
  var name = 'nico';
  var age = 10;
  var greeting = "Hello everyone, my name is $name and I'm ${age + 2}";
}
```

### Collection for

```dart
void main() {
  var oldFriends = ['nico', 'lynn'];
  var newFriends = ['lewis', 'ralph', 'darren', for (var friend in oldFriends) "💖 $friend"];
}
```

### Maps

```dart
void main() {
  var player = {
    'name': 'nico',
    'xp': 19.99,
    'superpower': false,
  }
}
```

```dart
void main() {
  Map<int, bool> player = {
    1: true,
    2: false,
    3: true
  };
}
```

```dart
void main() {
  List<Map<String, Object>> players = [
    {'name': 'nico', 'xp': 199993.999},
    {'name': 'nico', 'xp': 199993.999},
  ]
}
```

### Sets

```dart
void main() {
  //var numbers = {1, 2, 3, 4};
  Set<int> numbers = {1, 2, 3, 4};
}
```

- Set에 속한 모든 아이템은 유니크하다
- Set은 sequence(순서가 있음)이다
- List랑 같지만 모든 요소가 유니크하다
- 요소가 항상 하나씩만 있어야 될 때 Set을 사용한다
