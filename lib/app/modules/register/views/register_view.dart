import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key, required this.roleAccount}) : super(key: key);

  @override
  final RegisterController controller = Get.put(
    RegisterController(),
  );
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController cardIdentityController = TextEditingController();
  final String roleAccount;

  @override
  Widget build(BuildContext context) {
    var role = roleAccount;
    controller.selectedUserType.value = role;

    return Scaffold(
      backgroundColor: blackGray,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        leading: const Text(
          "",
        ),
      ),
      body: Obx(
        () {
          if (controller.selectedUserType.value == "Murid" || role == "Murid") {
            return Stack(
              children: [
                // Section - background color
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      40,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(
                          0.25,
                        ),
                        offset: Offset.zero,
                        blurRadius: 10,
                      ),
                    ],
                    color: azureishWhite,
                  ),
                ),

                // Section - register
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      40,
                      kToolbarHeight,
                      40,
                      kToolbarHeight,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Section - logo
                        Center(
                          child: Image.asset(
                            "assets/images/logo.png",
                            scale: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),

                        // Section - register container
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                20,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  0.25,
                                ),
                                offset: Offset.zero,
                                blurRadius: 10,
                              ),
                            ],
                            color: blackGray,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                              20,
                            ),
                            child: Column(
                              children: [
                                // Section - header
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                    text: "Silahkan Daftar",
                                    style: blackBold16,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "\nAkun Murid",
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                // Section - name
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                          0.25,
                                        ),
                                        offset: Offset.zero,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                    controller: nameController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          20,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: columbiaBlue,
                                      suffixIcon: const Icon(
                                        Icons.email,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      hintText: "Nama Lengkap",
                                      hintStyle: blackW30012italic,
                                    ),
                                    maxLines: 1,
                                    style: blackW30012italic,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                // Section - email
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                          0.25,
                                        ),
                                        offset: Offset.zero,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          20,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: columbiaBlue,
                                      suffixIcon: const Icon(
                                        Icons.email,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      hintText: "Email",
                                      hintStyle: blackW30012italic,
                                    ),
                                    maxLines: 1,
                                    style: blackW30012italic,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                // Section - password
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                          0.25,
                                        ),
                                        offset: Offset.zero,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Obx(
                                    () => TextField(
                                      controller: passwordController,
                                      obscureText:
                                          controller.showPassword.value,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: columbiaBlue,
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            controller.showPassword.value =
                                                !(controller
                                                    .showPassword.value);
                                          },
                                          child: Icon(
                                            controller.showPassword.value !=
                                                    false
                                                ? Icons.lock
                                                : Icons.lock_open,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                        ),
                                        hintText: "Kata Sandi",
                                        hintStyle: blackW30012italic,
                                      ),
                                      maxLines: 1,
                                      style: blackW30012italic,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                // Section - confirm password
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                          0.25,
                                        ),
                                        offset: Offset.zero,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Obx(
                                    () => TextField(
                                      controller: confirmPasswordController,
                                      obscureText:
                                          controller.showConfirmPassword.value,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: columbiaBlue,
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            controller
                                                    .showConfirmPassword.value =
                                                !(controller
                                                    .showConfirmPassword.value);
                                          },
                                          child: Icon(
                                            controller.showConfirmPassword
                                                        .value !=
                                                    false
                                                ? Icons.lock
                                                : Icons.lock_open,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                        ),
                                        hintText: "Konfirmasi Kata Sandi",
                                        hintStyle: blackW30012italic,
                                      ),
                                      maxLines: 1,
                                      style: blackW30012italic,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                // Section - card identity (optional)
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                          0.25,
                                        ),
                                        offset: Offset.zero,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                    controller: cardIdentityController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          20,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: columbiaBlue,
                                      suffixIcon: const Icon(
                                        Icons.person,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      hintText: "Nomor KTP",
                                      hintStyle: blackW30012italic,
                                    ),
                                    maxLines: 1,
                                    style: blackW30012italic,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                // Section - register button
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                          0.25,
                                        ),
                                        offset: Offset.zero,
                                        blurRadius: 5,
                                      ),
                                    ],
                                    color: columbiaBlue,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      10,
                                    ),
                                    child: InkWell(
                                      onTap: () {},
                                      child: const AutoSizeText(
                                        "Daftar",
                                        style: blackBold16,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),

                                // Section - login button
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Sudah punya akun?",
                                      style: blackW30012,
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Masuk",
                                        style: pictonBlueBold12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // Section - teacher register button
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                20,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  0.25,
                                ),
                                offset: Offset.zero,
                                blurRadius: 5,
                              ),
                            ],
                            color: blackGray,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                              10,
                            ),
                            child: InkWell(
                              onTap: () {
                                controller.selectedUserType.value = "Guru";
                                role = "Guru";
                              },
                              child: const AutoSizeText(
                                "Daftar sebagai Guru",
                                style: blackBold12,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),

                        // Section - islamify
                        const Text(
                          "Islamify",
                          style: blackBold16,
                          textAlign: TextAlign.center,
                        ),

                        // Section - description
                        const Text(
                          "Solusi pemudah hijrah 😁🙏",
                          style: blackW30012,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Stack(
              children: [
                // Section - background color
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      40,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(
                          0.25,
                        ),
                        offset: Offset.zero,
                        blurRadius: 10,
                      ),
                    ],
                    color: azureishWhite,
                  ),
                ),

                // Section - register
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      40,
                      kToolbarHeight,
                      40,
                      kToolbarHeight,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Section - logo
                        Center(
                          child: Image.asset(
                            "assets/images/logo.png",
                            scale: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),

                        // Section - register container
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                20,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  0.25,
                                ),
                                offset: Offset.zero,
                                blurRadius: 10,
                              ),
                            ],
                            color: blackGray,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                              20,
                            ),
                            child: Column(
                              children: [
                                // Section - header
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                    text: "Silahkan Daftar",
                                    style: blackBold16,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "\nAkun Guru",
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                // Section - name
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                          0.25,
                                        ),
                                        offset: Offset.zero,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                    controller: nameController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          20,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: columbiaBlue,
                                      suffixIcon: const Icon(
                                        Icons.email,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      hintText: "Nama Lengkap",
                                      hintStyle: blackW30012italic,
                                    ),
                                    maxLines: 1,
                                    style: blackW30012italic,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                // Section - email
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                          0.25,
                                        ),
                                        offset: Offset.zero,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          20,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: columbiaBlue,
                                      suffixIcon: const Icon(
                                        Icons.email,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      hintText: "Email",
                                      hintStyle: blackW30012italic,
                                    ),
                                    maxLines: 1,
                                    style: blackW30012italic,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                // Section - password
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                          0.25,
                                        ),
                                        offset: Offset.zero,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Obx(
                                    () => TextField(
                                      controller: passwordController,
                                      obscureText:
                                          controller.showPassword.value,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: columbiaBlue,
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            controller.showPassword.value =
                                                !(controller
                                                    .showPassword.value);
                                          },
                                          child: Icon(
                                            controller.showPassword.value !=
                                                    false
                                                ? Icons.lock
                                                : Icons.lock_open,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                        ),
                                        hintText: "Kata Sandi",
                                        hintStyle: blackW30012italic,
                                      ),
                                      maxLines: 1,
                                      style: blackW30012italic,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                // Section - confirm password
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                          0.25,
                                        ),
                                        offset: Offset.zero,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Obx(
                                    () => TextField(
                                      controller: confirmPasswordController,
                                      obscureText:
                                          controller.showConfirmPassword.value,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: columbiaBlue,
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            controller
                                                    .showConfirmPassword.value =
                                                !(controller
                                                    .showConfirmPassword.value);
                                          },
                                          child: Icon(
                                            controller.showConfirmPassword
                                                        .value !=
                                                    false
                                                ? Icons.lock
                                                : Icons.lock_open,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                        ),
                                        hintText: "Konfirmasi Kata Sandi",
                                        hintStyle: blackW30012italic,
                                      ),
                                      maxLines: 1,
                                      style: blackW30012italic,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                // Section - card identity (optional)
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                          0.25,
                                        ),
                                        offset: Offset.zero,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                    controller: cardIdentityController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          20,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: columbiaBlue,
                                      suffixIcon: const Icon(
                                        Icons.person,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      hintText: "Nomor KTP",
                                      hintStyle: blackW30012italic,
                                    ),
                                    maxLines: 1,
                                    style: blackW30012italic,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                // Section - register button
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                          0.25,
                                        ),
                                        offset: Offset.zero,
                                        blurRadius: 5,
                                      ),
                                    ],
                                    color: columbiaBlue,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      10,
                                    ),
                                    child: InkWell(
                                      onTap: () {},
                                      child: const AutoSizeText(
                                        "Daftar",
                                        style: blackBold16,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),

                                // Section - login button
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Sudah punya akun?",
                                      style: blackW30012,
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Masuk",
                                        style: pictonBlueBold12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // Section - teacher register button
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                20,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  0.25,
                                ),
                                offset: Offset.zero,
                                blurRadius: 5,
                              ),
                            ],
                            color: blackGray,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                              10,
                            ),
                            child: InkWell(
                              onTap: () {
                                controller.selectedUserType.value = "Murid";
                              },
                              child: const AutoSizeText(
                                "Daftar sebagai Murid",
                                style: blackBold12,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),

                        // Section - islamify
                        const Text(
                          "Islamify",
                          style: blackBold16,
                          textAlign: TextAlign.center,
                        ),

                        // Section - description
                        const Text(
                          "Solusi pemudah hijrah 😁🙏",
                          style: blackW30012,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
