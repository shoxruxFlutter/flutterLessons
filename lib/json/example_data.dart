import 'package:flutter_lessons/json/address.dart';
import 'package:flutter_lessons/json/human.dart';

// class GetInfoResponse {
//   final GetInfo response;

//   GetInfoResponse({required this.response});
// }

// class GetInfo {
//   int faRequired;
//   AudioAds audioAds;

//   GetInfo({required this.faRequired, required this.audioAds});
// }

// class AudioAds {
//   int dayLimit;
//   int trackLimit;
//   List<String> typesAllowed;
//   List<String> sections;

//   AudioAds(
//       {required this.dayLimit,
//       required this.trackLimit,
//       required this.typesAllowed,
//       required this.sections});
// }

final humans = [
  Human(
    name: 'Anvar',
    surname: 'Anvarov',
    age: 30,
    address: [
      Address(city: 'Samarkand', street: 'Ziyolilar', house: '41a', flat: 41),
      Address(city: 'Navoiy', street: 'Bog`ishamol', house: '52b', flat: 21),
      Address(city: 'Xorazm', street: 'Ziyolilar', house: '23c', flat: 23),
    ],
  ),
  Human(
    name: 'Feruz',
    surname: 'Maxmudov',
    age: 33,
    address: [
      Address(city: 'Samarkand', street: 'Ziyolilar', house: '41a', flat: 41),
      Address(city: 'Navoiy', street: 'Bog`ishamol', house: '52b', flat: 21),
      Address(city: 'Xorazm', street: 'Ziyolilar', house: '23c', flat: 23),
    ],
  )
];
const jsonString = ''' 
[
  {
    "name" : "Anvar",
    "surname" : "Anvarov",
    "age" : 30,
    "address" : [
      {
        "city" : "Samarkand",
        "street" : "Ziyolilar",
        "house" : "41a",
        "flat" : 41
      },
      {
        "city" : "Navoiy",
        "street" : "Bog`ishamol",
        "house" : "52b",
        "flat" : 21
      },
      {
        "city" : "Xorazm",
        "street" : "Ziyolilar",
        "house" : "23c",
        "flat" : 23
      }
    ]
  },
  {
    "name" : "Feruz",
    "surname" : "Maxmudov",
    "age" : 30,
    "address" : [
      {
        "city" : "Samarkand",
        "street" : "Amir Temur",
        "house" : "23b",
        "flat" : 56
      },
      {
        "city" : "Samarkand",
        "street" : "Amir Temur",
        "house" : "23b",
        "flat" : 56
      },
      {
        "city" : "Samarkand",
        "street" : "Amir Temur",
        "house" : "23b",
        "flat" : 56
      }
    ]
  }
]
''';
