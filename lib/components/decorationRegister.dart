import 'package:flutter/material.dart';

InputDecoration getAuthenticationInputDecoration(String label) {
  return InputDecoration(
    hintText: label,
    fillColor: Colors.white,
    filled: true,
    prefixIcon: const Icon(
      Icons.person,
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

InputDecoration getPasswordInputRegisterDecoration(String label) {
  bool isObscureText = true;
  return InputDecoration(
    enabled: true,
    hintText: label,
    hintStyle: const TextStyle(color: Colors.grey),
    fillColor: Colors.white,
    filled: true,
    prefixIcon: const Icon(
      Icons.lock,
      color: Colors.black,
    ),
    suffixIcon: Icon(
      isObscureText ? Icons.visibility_off : Icons.visibility,
      color: Colors.black87,
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
