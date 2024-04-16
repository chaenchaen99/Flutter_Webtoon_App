

class Player {
  String? name; //Player를 만들 때 name을 꼭 보내지 않아도 된다.
  //dart에게 Player가 name을 가질 수도, 가지지 않을 수도 있다고 말해주는 것.

  //constructor
  Player({required this.name});
}

void main() {
  var chaeyeon = Player(name: "chaeyeon");//클래스의 파라미터가 많을 때는 named parameter를 사용한다.
  //argument 위치가 중요한 것은 position parameter를 사용한다.

 // runApp(App());
}