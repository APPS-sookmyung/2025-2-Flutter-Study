## 4.0 Your First Dart Class

- Class에서 property를 선언할 때 타입을 사용해서 정의해야 한다.
- function 내에서 variable 사용할 때는 타입 없이 var를 사용한다.

```dart
class Player {
  String name = "nico"; //String 앞에 final 붙이면 수정 못함
  int xp = 1500;

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var player = Player("nico", 1500); //new Player라고 해도 됨 //Player 인스턴스 생성
  print(player.name);
  player.name = "lalala";
  print(player.name);
}
```

---

## 4.1 Constructors

- late는 선언만 하고 변수들의 값을 나중에 받아올 것이라는 뜻이다.

```dart
  //constructor method의 이름을 class 이름과 같아야 함
  Player(String name, int xp) {
    this.name = name;
    this.xp = xp;
  }
  // 아래처럼 써도 됨
  Player(this.name, this.xp);
```

## 4.2 Named Constructor Parameters

```dart
class Player {
  late final String name;
  late int xp;
  String team;
  int age;

  //Named Constructor Parameters
  //중괄호 안에 넣기, required로 null safety 막기
  Player({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var player = Player(name: "nico", xp: 1200, team: 'blue', age: 21); //순서에 상관없이 key, value 맞추기
  player.sayHello();
  var player2 = Player(name: "lynn", xp: 2500, team: 'red', age: 12);
  player2.sayHello();
}

```

---

## 4.3 Named Constructors

```dart
final String name, team; //name, team 모두 final로 선언됨
```

```dart
class Player {
  final String name;
  int xp, age;
  String team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

  //이 메서드는 Player 객체를 만듦
  Player.createBluePlayer({required String name, required int age})
    : //콜론을 넣음으로써 Player 객체를 초기화함
      this.age = age,
      this.name = name,
      this.team = 'blue',
      this.xp = 0; //마지막은 세미콜론

  Player.createRedPlayer(String name, int age)
    : this.age = age,
      this.name = name,
      this.team = 'red',
      this.xp = 0;

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var player = Player.createBluePlayer(name: "nico", age: 21);
  var redPlayer = Player.createRedPlayer("nico", 21);
}
```

---

## 4.4 Recap

- API로부터 데이터를 받으면, 그걸 class로 바꿔야 한다.

```dart
class Player {
  final String name;
  int xp;
  String team;

  Player.fromJson(
    Map<String, dynamic> playerJson,
  ) //String인 key를 가지고, value는 dynamic //property를 초기화할 수 있음
  : name = playerJson['name'],
      xp = playerJson['xp'],
      team = playerJson['team'];

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var apiData = [
    {"name": "nico", "team": "red", "xp": 0},
    {"name": "lynn", "team": "red", "xp": 0},
    {"name": "dal", "team": "red", "xp": 0},
  ];

  apiData.forEach((playerJson) {
    var player = Player.fromJson(playerJson);
    player.sayHello();
  });
}
```

---

## 4.5 Cascade Notation

```dart
void main() {
  var nico = Player(name: "nico", xp: 1200, team: 'red');
  nico.name = 'las';
  nico.xp = 1200000;
  nico.team = 'blue';

  //위의 코드와 같은 역할을 함
  var nico2 = Player(name: "nico", xp: 1200, team: 'red') //세미콜론 없음
  ..name = 'las'
  ..xp = 1200000
  ..team = 'blue'
  ..sayHello();
}
```

---

## Enums

```dart
enum Team { red, blue } //*

enum XPLevel { pro, medium } //*

class Player {
  String name;
  XPLevel xp; //*
  Team team; //*

  Player({required this.name, required this.xp, required this.team});

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var nico = Player(name: "nico", xp: XPLevel.pro, team: Team.red) //*
    ..name = 'las'
    ..xp = XPLevel.pro //*
    ..team = Team.blue //*
    ..sayHello();
}
```

---

## 4.7 Abstract Classes

- 추상화 클래스로는 객체를 생성할 수 없다.
- 추상화 클래스는 다른 클래스들이 직접 구현해야 하는 메소드들을 모아놓은 일종의 청사진이다.

```dart
abstract class Human {
  void walk();
} //Human이라는 추상화 클래스는 walk라는 메소드를 가지고, walk 메소드는 void를 반환함

enum Team { red, blue }

enum XPLevel { pro, medium }

class Player extends Human {
  String name;
  XPLevel xp;
  Team team;

  Player({required this.name, required this.xp, required this.team});

  //Human 클래스를 상속받으면 Player 클래스에 walk가 있어야 함
  void walk() {
    print("im walking");
  }
}

class Coach extends Human {
  //Human 클래스를 상속받으면 Coach 클래스에 walk가 있어야 함
  void walk() {
    print("the coach is walking");
  }
}
```

---

## 4.8 Inheritance

- 객체 지향 프로그래밍
- 부모 클래스가 생성자를 포함하고 있을 때, 그 클래스를 다른 곳에서 사용하려면 필요한 값을 전달해야 하고 그 부모 클래스의 생성자를 호출해줘야 한다

```dart
class Human {
  final String name;
  Human({required this.name});
  void sayHello() {
    print("Hi my name is $name");
  }
}

enum Team { blue, red }

class Player extends Human {
  final Team team;

  Player({required this.team, required String name}) : super(name: name);
  //super라는 키워드를 통해 확장을 한 부모 클래스와 상호작용할 수 있게 함
  //super 클래스는 확장한 부모 클래스를 의미함

  //Human에서 온 sayHello를 직접 만든 메소드로 override(대체)함
  @override
  void sayHello() {
    super.sayHello();
    print('and I play for ${team}');
  }
}

void main() {
  var player = Player(team: Team.red, name: 'nico');
}
```

---

## 4.9 Mixins

- Mixins은 **생성자가 없는 클래스**를 의미한다
- with: 다른 클래스의 프로퍼티와 메소드를 긁어온다 (뺏어온다)
- Mixin 클래스들을 하나의 클래스에 단 한 번만 사용할 것이라면 의미가 없다
- Mixin의 핵심은 여러 클래스에 재사용이 가능하다는 점이다
- class 대신 mixin을 붙여줘야 한다

```dart
mixin Strong {
  final double strenghtLevel = 1500.99;
}

mixin QuickRunner {
  void runQuick() {
    print("ruuuuuuuun!");
  }
}

mixin Tall {
  final double height = 1.99;
}

enum Team { blue, red }

class Player with Strong, QuickRunner, Tall {
  final Team team;

  Player({required this.team});
}

class Horse with Strong, QuickRunner {}

class Kid with QuickRunner {}

void main() {
  var player = Player(team: Team.red);
  player.runQuick();
}
```
