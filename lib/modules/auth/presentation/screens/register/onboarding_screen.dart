import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_mate/shared/styles/colors.dart';
import 'package:country_code_picker/country_code_picker.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final TextEditingController _phoneController = TextEditingController();
  String _selectedCountryCode = "+1"; // Mã vùng mặc định (ví dụ +1)
  final RegExp _phoneRegex = RegExp(r'^\d{7,15}$');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/onboarding.png",
      "title": "Discover Your Ideal Consultant!",
      "description":
          "Diverse range of categories and connect with experienced consultants."
    },
    {
      "image": "assets/images/onboarding.png",
      "title": " Instant Bookings,Hassle-Free",
      "description":
          "You can easily book video or audio calls with your chosen consultant ."
    },
    {
      "image": "assets/images/onboarding.png",
      "title": "Secure Payments for Peace of Mind",
      "description":
          "Make payments with confidence, knowing that your information is well-protected!"
    }
  ];
  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onboardingData.length,
              onPageChanged: (index) {
                setState(() {});
              },
              itemBuilder: (context, index) {
                return OnboardingPage(
                  image: _onboardingData[index]["image"]!,
                  title: _onboardingData[index]["title"]!,
                  description: _onboardingData[index]["description"]!,
                );
              },
            ),
          ),
          const SizedBox(height: 24),

          // Ô nhập số điện thoại
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Form(
              key: _formKey,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      CountryCodePicker(
                        onChanged: (country) {
                          setState(() {
                            _selectedCountryCode = country.dialCode!;
                          });
                        },
                        initialSelection: 'US',
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        favorite: const ['+1', '+84'],
                        textStyle:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      // Divider
                      Container(
                        height: 24,
                        width: 1,
                        color: Colors.grey.shade400,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(fontSize: 16),
                          decoration: const InputDecoration(
                            hintText: "Enter your mobile number",
                            border: InputBorder
                                .none, // The container already provides a border
                            isDense: true, // Makes the input field more compact
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your mobile number';
                            }
                            if (!_phoneRegex.hasMatch(value.trim())) {
                              return 'Invalid phone number format';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  )),
            ),
          ),

          const SizedBox(height: 16),

          // Nút Continue
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String phoneNumber =
                      _selectedCountryCode + _phoneController.text.trim();
                  // Proceed with phoneNumber or pass it to the next screen
                  context.push('/verify-phone');
                } else {
                  // Optionally, show a SnackBar or other UI to indicate validation error
                }
              },
              child: const Text(
                "Continue",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // OR
          const Text("or", style: TextStyle(fontSize: 14, color: Colors.grey)),

          const SizedBox(height: 16),

          // Nút đăng nhập bằng Google, Apple, Facebook
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.g_mobiledata, size: 32),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.apple, size: 32),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.facebook, size: 32),
              ),
            ],
          ),

          const SizedBox(height: 24),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "By continuing you agree to the Terms of Service and Privacy Policy",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.84,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    image,
                    width: double.infinity,
                  ),
                ),
                // Lớp màu tối Gradient
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          // ignore: deprecated_member_use
                          Colors.black.withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
