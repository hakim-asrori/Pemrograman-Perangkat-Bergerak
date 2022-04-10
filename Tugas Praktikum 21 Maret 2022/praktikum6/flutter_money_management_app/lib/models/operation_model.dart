class OperationModel {
  String? name;
  String? selectedIcon;
  String? unselectedIcon;

  OperationModel(this.name, this.selectedIcon, this.unselectedIcon);
}

List<OperationModel> datas = operationsData.map(
  (item) => OperationModel(
    item['name'],
    item['selectedIcon'],
    item['unselectedIcon'],
  )
).toList();

var operationsData = [
  {
    "name": "Money \n Transfer",
    "selectedIcon": "assets/svg/moneywhite.svg",
    "unselectedIcon": "assets/svg/moneyblue.svg",
  },
  {
    "name": "Bank \n withDraw",
    "selectedIcon": "assets/svg/bankwhite.svg",
    "unselectedIcon": "assets/svg/bankblue.svg",
  },
  {
    "name": "Insight \n Tracking",
    "selectedIcon": "assets/svg/insightwhite.svg",
    "unselectedIcon": "assets/svg/insightblue.svg",
  },
];