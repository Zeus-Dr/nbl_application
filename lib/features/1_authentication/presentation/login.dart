import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nbl/core/themes/text_styles.dart';
import 'package:nbl/core/util/responsive.dart';
import 'package:nbl/core/util/widgets/custom_button.dart';
import 'package:nbl/core/util/widgets/social_icon.dart';
import 'package:nbl/core/util/widgets/text_field.dart';
import 'package:nbl/features/1_authentication/controllers/login_controller.dart';
import 'package:nbl/features/1_authentication/presentation/signup.dart';
import 'package:nbl/features/0_home/presentation/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive res = Responsive(context: context);
    TextStyles styles = TextStyles(res: res);
    LoginController controller = Get.put(LoginController());

    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height / 7, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: res.smallWidget(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Login to your account",
                  style: styles.headline2,
                ),
                const SizedBox(height: 25),
                Form(
                  key: controller.key,
                  child: Column(
                    children: [
                      NormalTextField(
                        controller: controller.email,
                        function: () {},
                        validate: controller.validateEmail,
                        textStyle: styles.bodyText1,
                        hintText: 'jondoe@example.com',
                        labelText: 'Email',
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => PasswordTextField(
                          controller: controller.password,
                          function: () => controller.changeVisibility(),
                          textStyle: styles.bodyText1,
                          validate: controller.validatePassword,
                          hintText: 'jondoe@example.com',
                          labelText: 'Password',
                          isPassword: controller.isVisible.value,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Forgot Password?',
                              style: GoogleFonts.roboto(
                                fontSize: 13,
                                color: Colors.blue,
                              )),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'Sign In',
                        onPressed: () {
                          // if (controller.key.currentState!.validate()) {
                          //   controller.login(
                          //     controller.email.text.trim(),
                          //     controller.password.text.trim(),
                          //   );
                          // }
                          Get.to(() => const HomePage());
                        },
                        textStyle: styles.button,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '-Or Sign In with-',
                        style: styles.bodyText2,
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialIconButton(
                            icon: FontAwesomeIcons.google,
                            iconColor: Colors.green,
                            onPressed: () {
                              // Handle Google login
                            },
                          ),
                          const SizedBox(width: 15),
                          SocialIconButton(
                            icon: FontAwesomeIcons.facebook,
                            iconColor: const Color.fromARGB(255, 31, 1, 163),
                            onPressed: () {
                              // Handle Facebook login
                            },
                          ),
                          const SizedBox(width: 15),
                          SocialIconButton(
                            icon: FontAwesomeIcons.twitter,
                            iconColor: Colors.blue, // Assuming this for Twitter
                            onPressed: () {
                              // Handle Twitter login
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: styles.bodyText2,
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SignUpPage());
                            },
                            child: Text(
                              "SignUp",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
