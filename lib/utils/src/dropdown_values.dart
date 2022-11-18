import 'package:Blog_web/models/models.dart';

const List<Map> member = [
  {"id": MemberStatus.normal, "member": "Normal"},
  {"id": MemberStatus.premium, "member": "Premium"}
];

const List<Map> label = [
  {"id": MemberStatus.normal, "label": "Normal"},
  {"id": MemberStatus.premium, "label": "Premium"}
];

const List<Map> postStatus = [
  {"id": 1, "status": "Draft"},
  {"id": 2, "status": "Pending Review"},
  {"id": 3, "status": "Published"}
];

List<Map> categoryId = [
  {"id": 1, "category": "Data Science"},
  {"id": 2, "category": "AI"},
  {"id": 3, "category": "Published"}
];

List<Map> activated = [
  {"id": 1, "activate": "Yes"},
  {"id": 2, "activate": "No"},
];
