import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamify/app/routes/app_pages.dart';
import 'package:islamify/core/theme/colors.dart';
import 'package:islamify/core/theme/text_theme.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  @override
  final LoginController controller = Get.put(
    LoginController(),
  );
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Determine the current theme mode (light or dark)
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: blackGray,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Obx(
        () {
          if (controller.selectedUserType.value == "Murid") {
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Stack(
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
                          blurRadius: isDarkMode ? 0 : 10,
                        ),
                      ],
                      color: azureishWhite,
                    ),
                  ),

                  // Section - login
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
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

                          // Section - login container
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
                                  blurRadius: isDarkMode ? 0 : 10,
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
                                    text: TextSpan(
                                      text: "Selamat datang",
                                      style: isDarkMode
                                          ? whiteBold16
                                          : blackBold16,
                                      children: const <TextSpan>[
                                        TextSpan(
                                          text: "\nMasuk ke akun Anda",
                                        )
                                      ],
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
                                          blurRadius: isDarkMode ? 0 : 5,
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
                                          blurRadius: isDarkMode ? 0 : 5,
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

                                  // Section - login button
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
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
                                          blurRadius: isDarkMode ? 0 : 5,
                                        ),
                                      ],
                                      color: columbiaBlue,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                        10,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Routes.HOME;
                                        },
                                        child: const AutoSizeText(
                                          "Masuk",
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

                                  // Section - register button
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Belum punya akun?",
                                        style: blackW30012,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Routes.HOME;
                                        },
                                        child: const Text(
                                          "Daftar",
                                          style: pictonBlueW30012,
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

                          // Section - teacher login button
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
                                  blurRadius: isDarkMode ? 0 : 5,
                                ),
                              ],
                              color: azureishWhite,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                10,
                              ),
                              child: InkWell(
                                onTap: () {
                                  controller.selectedUserType.value = "Guru";
                                },
                                child: const AutoSizeText(
                                  "Masuk sebagai Guru",
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
              ),
            );
          } else {
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Stack(
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
                          blurRadius: isDarkMode ? 0 : 10,
                        ),
                      ],
                      color: azureishWhite,
                    ),
                  ),

                  // Section - login
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
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

                          // Section - login container
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
                                  blurRadius: isDarkMode ? 0 : 10,
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
                                    text: TextSpan(
                                      text: "Selamat datang",
                                      style: isDarkMode
                                          ? whiteBold16
                                          : blackBold16,
                                      children: const <TextSpan>[
                                        TextSpan(
                                          text: "\nMasuk ke akun Anda",
                                        )
                                      ],
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
                                          blurRadius: isDarkMode ? 0 : 5,
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
                                          blurRadius: isDarkMode ? 0 : 5,
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

                                  // Section - login button
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
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
                                          blurRadius: isDarkMode ? 0 : 5,
                                        ),
                                      ],
                                      color: columbiaBlue,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                        10,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Routes.HOME;
                                        },
                                        child: const AutoSizeText(
                                          "Masuk",
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

                                  // Section - register button
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Belum punya akun?",
                                        style: blackW30012,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Routes.HOME;
                                        },
                                        child: const Text(
                                          "Daftar",
                                          style: pictonBlueW30012,
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

                          // Section - teacher login button
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
                                  blurRadius: isDarkMode ? 0 : 5,
                                ),
                              ],
                              color: azureishWhite,
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
                                  "Masuk sebagai Murid",
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
              ),
            );
          }
        },
      ),
    );
  }
}
