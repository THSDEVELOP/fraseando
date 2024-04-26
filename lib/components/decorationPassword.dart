import "package:flutter/material.dart";

InputDecoration getPasswordInputDecoration(String label,
    {required InkWell suffixIcon}) {
  return InputDecoration(
    hintText: label,
    hintStyle: const TextStyle(color: Colors.grey),
    fillColor: Colors.white,
    filled: true,
    prefixIcon: const Icon(
      Icons.lock,
      color: Colors.black,
    ),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide:
            const BorderSide(color: Color.fromARGB(255, 5, 12, 15), width: 3)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: const BorderSide(
            color: Color.fromARGB(255, 6, 227, 239), width: 3)),
  );
}
