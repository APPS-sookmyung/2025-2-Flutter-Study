## 3.0 Defining a Function

- fat arrow syntax는 return이랑 같은 의미이다.
- 함수 내부의 코드가 한 줄일 때 fat arrow syntax를 사용한다.

```dart
//ver1
String sayHello(String name) {
    return "Hello $name nice to meet you!";
}

//ver2 - fat arrow syntax
String sayHello(String name) => "Hello $name nice to meet you!";

void main() {
    print(sayHello('nico'));
}
```

---

## 3.1 Named Parameters

```dart
//ver1 - named argument
String sayHello({String name, int age, String country}) {
    return "Hello $name, you are $age, and you come from $country"; //named argument: 변수를 중괄호 안에 넣기
}

void main() {
    print(sayHello(
        age: 12,
        country: 'cuba',
        name: 'nico',
        //named argument 사용 방법
    ))
}
```

```dart
//ver2 - default value
String sayHello({
  String name = 'anon',
  int age = 99,
  String country = 'wakanda',
}) {
  return "Hello $name, you are $age, and you come from $country"; //default value
}

void main() {
  print(
    sayHello(
      age: 12, //default value가 있으면 이렇게 적어도 됨
    ),
  );
}
```

```dart
//ver3 - required (null safety로부터 막아줌)
String sayHello({
  required String name,
  required int age,
  required String country,
}) {
  return "Hello $name, you are $age, and you come from $country";
}

void main() {
  print(sayHello(age: 12, country: 'cicici', name: 'lalala'));
}
```

---

## 3.2 Recap

- positional prameter: 순서, 위치가 중요
- named parameter: 중괄호

---

## 3.3 Optional Positional Parameters

```dart
SString sayHello(
  String name,
  int age, [
  String? country = 'cuba', //country는 not required, default value
]) => "Hello $name, you are $age, and you come from $country";

void main() {
  var results = sayHello('nico', 12);
  print(results);
}
```

- String?: country(파라미터)가 null이 될 수 있음을 나타낸다.

---

## 3.4 QQ Operator

```dart
//ver1
String capitalizeName(String? name) {
  if (name != null) {
    return name.toUpperCase();
  }
  return 'ANON';
}

void main() {
  capitalizeName('nico');
  capitalizeName(null);
}
```

```dart
//ver2 - fat arrow
String capitalizeName(String? name) =>
  name != null ? name.toUpperCase() : 'ANON';

void main() {
  capitalizeName('nico');
  capitalizeName(null);
}
```

```dart
//ver3 - question question operator
String capitalizeName(String? name) =>
    name?.toUpperCase() ?? 'ANON';

void main() {
  capitalizeName('nico');
  capitalizeName(null);
}
```

- ??의 좌항이 null이면 우항을 return 한다.
- ??의 좌항이 null이 아니면 그대로 좌항을 return 한다.
- name 자체가 null인 경우에는 toUpperCase를 호출할 수 없다. -> name?

---

```dart
//ver1
void main() {
    String? name;
    name ??= 'nico';
    name ??= 'another';
    print(name);
}
```

- name ??= 'nico'; //name이 null이면 'nico'를 할당해준다.
- name ??= 'nico'; //이 코드 뒤부터는 name이 null이 될 일이 없다. -> another은 출력 X

```dart
//ver2
void main() {
    String? name;
    name ??= 'nico';
    name = null;
    name ??= 'another';
    print(name);
}
```

- 이렇게 하면 OK

---

## 3.5 Typedef

```dart
typedef ListOfInts = List<int>;

ListOfInts reverseListOfNumbers(ListOfInts list) {
    var reversed = list.reversed;
    return reversed.toList();
}

void main() {
    print(reverseListOfNumbers([1, 2, 3]));
}
```

- typedef는 자료형에 alias를 붙일 수 있게 한다.
- typedef는 원하는 만큼 생성 가능하다.
- Integer List나 Map이나 Set처럼 간단한 것들에 사용된다.

* List를 reversed 하면 List와 조금 다른 iterable이 돼서 다시 List로 변환해야 함
