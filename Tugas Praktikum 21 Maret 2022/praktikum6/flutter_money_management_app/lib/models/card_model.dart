class CardModel{
  String user;
  String cardNumber;
  String cardExpired;
  String cardType;
  String cardBackground;
  String cardElementTop;
  String cardElementBottom;

  CardModel(this.user, this.cardNumber, this.cardExpired, this.cardType, this.cardBackground, this.cardElementTop, this.cardElementBottom);
}

List<CardModel> cards = cardData.map(
  (item) => CardModel(
    item["user"].toString(),
    item["cardNumber"].toString(),
    item["cardExpired"].toString(),
    item["cardType"].toString(),
    item["cardBackground"].toString(),
    item["cardElementTop"].toString(),
    item["cardElementBottom"].toString()
  ),
).toList();

var cardData = [
  {
    "user": 'Amanda Alex',
    "cardNumber": '**** **** **** 1425',
    "cardExpired": '01-01-2023',
    "cardType": 'assets/images/mastercard.png',
    "cardBackground": '0xff1e1e99',
    "cardElementTop": 'assets/svg/collapsetop1.svg',
    "cardElementBottom": 'assets/svg/collapsebottom1.svg',
  },
  {
    "user": 'Amanda Alex',
    "cardNumber": '**** **** **** 8287',
    "cardExpired": '01-04-2023',
    "cardType": 'assets/images/mastercard.png',
    "cardBackground": '0xffff78a5',
    "cardElementTop": 'assets/svg/collapsetop2.svg',
    "cardElementBottom": 'assets/svg/collapsebottom2.svg',
  }
];
