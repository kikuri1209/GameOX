class Item{

  final String name;
  final String com;

  Item({

    required this.name,
    required this.com,
});
  factory Item.fromJson(Map<String,dynamic>json){
    return Item( name: json['name'], com: json['com']);
  }
}

//      "id": 1,
//       "name": "จัส",
//       "com": "เกมกระโปก"