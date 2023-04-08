import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int id, cost;
  final Color color;
  Product({
    required this.image,
    required this.title,
    required this.cost,
    required this.color,
    required this.id,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Math",
    image: "assets/images/maths.png",
    color: Color(0xFF71b8ff),
    cost: 600,
  ),
  Product(
    id: 2,
    title: "Science",
    image: "assets/images/science.png",
    color: Color(0xFFff6374),
    cost: 600,
  ),
  Product(
    id: 3,
    title: "SST",
    image: "assets/images/sst.png",
    color: Color(0xFFffaa5b),
    cost: 400,
  ),
  Product(
    id: 4,
    title: "English",
    image: "assets/images/english.png",
    color: Color(0xFF9ba0fc),
    cost: 400,
  ),
  Product(
    id: 5,
    title: "Hindi",
    image: "assets/images/hindi.png",
    color: Color(0xFFFFCE44),
    cost: 400,
  ),
  Product(
    id: 6,
    title: "Computer",
    image: "assets/images/computer.png",
    color: Color(0xFF513B1C),
    cost: 400,
  ),
  Product(
    id: 7,
    title: "GK",
    image: "assets/images/gk.png",
    color: Color(0xFFFF4500),
    cost: 400,
  ),
];
List<Product> products_9_10 = [
  Product(
    id: 1,
    title: "Math",
    image: "assets/images/math_s.png",
    color: Color(0xFF71b8ff),
    cost: 600,
  ),
  Product(
    id: 2,
    title: "Biology",
    image: "assets/images/biology.png",
    color: Color(0xFFff6374),
    cost: 600,
  ),

  Product(
    id: 3,
    title: "Chemistry",
    image: "assets/images/chemistry.png",
    color: Color(0xFF513B1C),
    cost: 600,
  ),
  Product(
    id: 4,
    title: "Physics",
    image: "assets/images/physics.png",
    color: Color(0xFFFF4500),
    cost: 600,
  ),
  Product(
    id: 5,
    title: "SST",
    image: "assets/images/sst.png",
    color: Color(0xFFffaa5b),
    cost: 400,
  ),
  Product(
    id: 6,
    title: "English",
    image: "assets/images/english.png",
    color: Color(0xFF9ba0fc),
    cost: 400,
  ),
  Product(
    id: 7,
    title: "Hindi",
    image: "assets/images/hindi.png",
    color: Color(0xFFFFCE44),
    cost: 400,
  )
];
List<Product> productsSci = [
  Product(
    id: 1,
    title: "Chemistry",
    image: "assets/images/chemistry.png",
    color: Color(0xFF71b8ff),
    cost: 600,
  ),
  Product(
    id: 2,
    title: "Biology",
    image: "assets/images/biology.png",
    color: Color(0xFFff6374),
    cost: 600,
  ),

  Product(
    id: 3,
    title: "Physics",
    image: "assets/images/physics.png",
    color: Color(0xFF513B1C),
    cost: 600,
  ),
  Product(
    id: 4,
    title: "Math",
    image: "assets/images/math_s.png",
    color: Color(0xFFFF4500),
    cost: 600,
  ),  Product(
    id: 6,
    title: "English",
    image: "assets/images/english.png",
    color: Color(0xFF9ba0fc),
    cost: 400,
  ),

];
List<Product> productsCom = [
  Product(
    id: 1,
    title: "Accountancy",
    image: "assets/images/accountancy.png",
    color: Color(0xFF71b8ff),
    cost: 600,
  ),
  Product(
    id: 2,
    title: "BS",
    image: "assets/images/Business Studies.png",
    color: Color(0xFFff6374),
    cost: 600,
  ),

  Product(
    id: 3,
    title: "Economics",
    image: "assets/images/Economics.png",
    color: Color(0xFF513B1C),
    cost: 600,
  ),
  Product(
    id: 4,
    title: "IP",
    image: "assets/images/ip.png",
    color: Color(0xFFFF4500),
    cost: 600,
  ),
  Product(
    id: 5,
    title: "Maths",
    image: "assets/images/math_s.png",
    color: Color(0xFFFF4500),
    cost: 600,
  ),
  Product(
    id: 6,
    title: "English",
    image: "assets/images/english.png",
    color: Color(0xFF9ba0fc),
    cost: 400,
  ),

];

List<Product> productsArts = [
  Product(
    id: 1,
    title: "Economic",
    image: "assets/images/Economics.png",
    color: Color(0xFF71b8ff),
    cost: 600,
  ),
  Product(
    id: 2,
    title: "Geography",
    image: "assets/images/geo.png",
    color: Color(0xFFff6374),
    cost: 600,
  ),

  Product(
    id: 3,
    title: "History",
    image: "assets/images/history.png",
    color: Color(0xFF513B1C),
    cost: 600,
  ),

  Product(
    id: 6,
    title: "English",
    image: "assets/images/english.png",
    color: Color(0xFF9ba0fc),
    cost: 400,
  ),

];



