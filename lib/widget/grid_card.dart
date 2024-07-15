import 'package:flutter/material.dart';

Container gridCard(BuildContext context, data) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2), 
          spreadRadius: 2, 
          blurRadius: 5, 
          offset: const Offset(0, 3), 
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            data.name,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        child: Image.network(
          data.image,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Image.asset(
            "assets/error.jpg",
            fit: BoxFit.cover,
          ),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    ),
  );
}
