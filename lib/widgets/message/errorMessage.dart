// ignore_for_file: file_names

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

showErrorMessage(String message) {
  BotToast.showCustomText(
    align: Alignment.center,
    toastBuilder: (close) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          color: Colors.black.withOpacity(0.45),
          alignment: Alignment.center,
          child: Container(
            width: 300,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
                  color: const Color(0xFF00A7EF),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Peringatan",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 22, 0, 22),
                  width: double.infinity,
                  child: Text(
                    message,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    duration: const Duration(seconds: 3),
    onClose: () {},
    onlyOne: true,
  );
}
