# flutter_biginner

const taxAmount = 15;
const priceAmount = 30;

var finalPrice = taxAmount + priceAmount;

const 로 변수를 정의하면 프로그램을 compile하기 전에 value를 알고 있어서,
Dart compiler가 이 코드를 compile하면, taxAmount, priceAmount 이 두 변수를 위한 메모리 공간을 만드는 대신,
value를 검토하고

var finalPrice = 15 + 30;  ---> var finalPrice = 45;

이런 식으로 대체시킨다.
즉, constant는 수정할 수 없고, compile 전에 그 value를 알 수 있는 변수이다.
아주 유용하고 좋은 최적화 방식이다.
