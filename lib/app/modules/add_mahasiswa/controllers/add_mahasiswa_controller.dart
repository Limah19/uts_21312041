import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMahasiswaController extends GetxController {
  late TextEditingController cNPM;
  late TextEditingController cNama;
  late TextEditingController cAlamat;
  late TextEditingController cProgram_Studi;
  late TextEditingController cJenis_Kelamin;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addMahasiswa(String npm, String nama, String alamat,
      String program_studi, String jenis_kelamin) async {
    CollectionReference mahasiswa = firestore.collection("mahasiswa");

    try {
      await mahasiswa.add({
        "npm": npm,
        "name": nama,
        "alamat": alamat,
        "program_studi": program_studi,
        "jk": jenis_kelamin,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data produk",
          onConfirm: () {
            cNPM.clear();
            cNama.clear();
            cAlamat.clear();
            cProgram_Studi.clear();
            cJenis_Kelamin.clear();
            Get.back();
            Get.back();
            Get.back();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNPM = TextEditingController();
    cNama = TextEditingController();
    cAlamat = TextEditingController();
    cProgram_Studi = TextEditingController();
    cJenis_Kelamin = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNPM.dispose();
    cNama.dispose();
    cAlamat.dispose();
    cProgram_Studi.dispose();
    cJenis_Kelamin.dispose();
    super.onClose();
  }
}
