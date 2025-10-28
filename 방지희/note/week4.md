# 노마드코더 Flutter로 웹툰 앱 만들기

## 1.0 Introduction

- Flutter는 멀티 플랫폼 개발을 지원한다.
- 웹 사이트 어플리케이션
- iOS
- Android 어플리케이션
- 맥OS
- 윈도우
- 리눅스
- 임베디드 어플리케이션

---

## 1.3 How Flutter Works

- Swift로 iOS를, Java로 안드로이드를 만드는 네이티브 앱 개발을 할 때 운영체제와 직접적으로 얘기한다. (네이티브 프레임 워크)
- Flutter 혹은 Dart 코드는 운영체제와 직접적으로 얘기하지 않는다.
- Flutter에선 실제 iOS 혹은 안드로이드 버튼을 만들어내는 기능은 존재하지 않는다.

- Flutter Engine
- 어플리케이션의 실제 UI를 렌더링한다.
- c/c++로 만들어졌다.
- Flutter가 운영체제와 대화하지 않는 대신 엔진이 화면상에 코드로 쓴 것들을 그려준다.
- Flutter는 운영체제에 내장된 플랫폼 widget을 사용하지 않는다.
- 운영체제는 엔진만 실행시키고, 엔진이 프레임워크를 동작시키고 UI 렌더링 역할을 한다.
- "runner" 프로젝트: 엔진을 가동시킨다.

- Flutter 팀은 iOS의 스타일을 복사해서 비슷하게 해두었지만 100% 일치하지 않는다.
- iOS는 렌더링 운영체제에서 렌더링하는 거고 Flutter는 엔진에서 렌더링 한다.
- Flutter는 네이티브에서 가능한 위젯을 사용할 수 없다.

Embedder

- 특정 플랫폼에 특화된 것
- "runner" 프로젝트를 가리킨다. -> iOS, 안드로이드, 맥OS, 윈도우, 리눅스를 위한 다양한 Embedder이 존대한다.
- 호스트 플랫폼 상에서 엔진을 가동시킨다.

---

## 1.4 Flutter vs React Native

- 네이티브 앱 운영체제 상에서 가능한 위젯을 사용하고 싶다면 -> React Native
- React Native는 iOS와 안드로이드에서 버튼 등이 다르게 보인다.
- React Native는 자바스크립트를 통해서 운영체제와 대화한다.

- 세밀한 디자인 요구사항이 있고, 요소들이나 애니메이션을 전부 커스터마이징을 해야 한다면 -> Flutter

---

## 2.1 Dart Pad

- Dart Pad는 온라인에서 dart 코드를 실행할 수 있게 한다
- dart는 javascript로 컴파일해주기 때문이다.
- 2개 이상의 파일을 만들 수 없다.

---

## 2.1 Running Flutter

- linux 폴더: linux 데스크탑 앱을 만들 때 필요한 설정 파일들
- MacOS 폴더: MacOS 앱을 만들 때 필요한 설정 파일들
- ...

---

## 2.3 Hello World

- flutter에 있는 모든 건 Widget
- Widget들을 합치는 방식으로 앱을 만든다.
- class을 Widget으로 만들기 위해선 flutter SDK에 있는 3개의 core Widget 중에 하나를 상속(extend)받아야 한다.
- 모든 Widget은 build 메소드를 구현해야 한다.

- **flutter Widget catalog**

build 메소드

- build 메소드는 flutter가 실행한다.
- build 메소드는 Widget의 UI를 만든다.
- build 메소드가 return하는 것을 화면에 띄운다.
- build 메소드는 Widget을 return 한다.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
```

- App Widget은 앱의 root이다.
- 앱의 root Widget은 아래 두 개의 옵션(core Widget) 중 하나를 return 해야 한다.
- matetial 앱: 구글의 디자인 시스템
- cupertino 앱: 애플의 디자인 시스템

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello flutter!'),
        ),
        body: Center(child: Text('Hello world!'),
        ),
      ),
    );
  }
}
```

- Scanffold, AppBar, Text, Center... 모두 Widget
- ,를 붙이면 자동 포맷 시 들여쓰기가 깔끔하게 유지된다
- Widget을 쓰는 것은 클래스를 쓰는 것

---

## 2.5 Classes Recap

- class의 파라미터가 많을 때는, named parameter를 사용한다.
- home, appBar, title, body, child 등이 named parameter
- positional parameter constructor는 파라미터의 위치가 중요하다.

```dart
class Player {
  String? name;

  Player({required this.name});
}
```

- ?: Player가 name을 가질수도, 가지지 않을 수도 있다.
- ? 없으면 필수, 있으면 선택
