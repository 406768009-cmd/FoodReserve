import 'package:flutter/material.dart';
import 'main_navigation.dart';

/// ============================================================
/// ข้อมูลผู้ใช้งาน
/// ============================================================

class UserData {
  String name;
  String surname;
  String gender;
  DateTime? birthDate;
  String email;
  String phone;
  String address;

  UserData({
    required this.name,
    required this.surname,
    required this.gender,
    required this.birthDate,
    required this.email,
    required this.phone,
    required this.address,
  });
}

/// ข้อมูลสมาชิกปัจจุบัน
UserData? currentUser;

/// ============================================================
/// LOGIN PAGE
/// ============================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;
  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('กรุณากรอกอีเมลและรหัสผ่าน'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainNavigation(),
      ),
    );
  }

  InputDecoration inputDecoration(
      String label,
      IconData icon,
      ) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(
        icon,
        color: const Color(0xFFFF4F81),
      ),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Color(0xFFFF4F81),
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 40),

              Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF7FA5),
                      Color(0xFFFF4F81),
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.restaurant,
                  color: Colors.white,
                  size: 48,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'FoodReserve',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF4F81),
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'ระบบจองร้านอาหาร',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 35),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: inputDecoration(
                  'อีเมล',
                  Icons.email_outlined,
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: passwordController,
                obscureText: hidePassword,
                decoration: inputDecoration(
                  'รหัสผ่าน',
                  Icons.lock_outline,
                ).copyWith(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: Icon(
                      hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    activeColor: const Color(0xFFFF4F81),
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value ?? false;
                      });
                    },
                  ),
                  const Text('จดจำการเข้าสู่ระบบ'),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (dialogContext) {
                          final controller =
                          TextEditingController();

                          return AlertDialog(
                            title: const Text('ลืมรหัสผ่าน'),
                            content: TextField(
                              controller: controller,
                              keyboardType:
                              TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: 'กรอกอีเมล',
                                prefixIcon:
                                Icon(Icons.email_outlined),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(dialogContext);
                                },
                                child: const Text('ยกเลิก'),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  const Color(0xFFFF4F81),
                                ),
                                onPressed: () {
                                  Navigator.pop(dialogContext);

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'ส่งลิงก์รีเซ็ตรหัสผ่านไปยังอีเมลแล้ว',
                                      ),
                                      backgroundColor:
                                      Color(0xFFFF4F81),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'ส่ง',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      'ลืมรหัสผ่าน?',
                      style: TextStyle(
                        color: Color(0xFFFF4F81),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF4F81),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'เข้าสู่ระบบ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'หรือ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ยังไม่มีบัญชี?',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'สมัครสมาชิก',
                      style: TextStyle(
                        color: Color(0xFFFF4F81),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ============================================================
/// REGISTER PAGE
/// ============================================================

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String gender = 'ไม่ระบุ';

  DateTime? birthDate;

  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool acceptTerms = false;

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> selectBirthDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      helpText: 'เลือกวันเกิด',
      cancelText: 'ยกเลิก',
      confirmText: 'ตกลง',
    );

    if (picked != null) {
      setState(() {
        birthDate = picked;
      });
    }
  }

  String get birthDateText {
    if (birthDate == null) {
      return 'เลือกวันเกิด';
    }

    return '${birthDate!.day.toString().padLeft(2, '0')}/'
        '${birthDate!.month.toString().padLeft(2, '0')}/'
        '${birthDate!.year + 543}';
  }

  void register() {
    if (nameController.text.trim().isEmpty ||
        surnameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'กรุณากรอกข้อมูลที่มีเครื่องหมาย * ให้ครบ',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (passwordController.text !=
        confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'รหัสผ่านและยืนยันรหัสผ่านไม่ตรงกัน',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'กรุณายอมรับเงื่อนไขการใช้งาน',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // ⭐ เก็บข้อมูลจากการสมัครสมาชิก
    currentUser = UserData(
      name: nameController.text.trim(),
      surname: surnameController.text.trim(),
      gender: gender,
      birthDate: birthDate,
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      address: addressController.text.trim(),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'สมัครสมาชิกสำเร็จ',
        ),
        backgroundColor: Color(0xFFFF4F81),
      ),
    );

    Future.delayed(
      const Duration(milliseconds: 800),
          () {
        if (mounted) {
          Navigator.pop(context);
        }
      },
    );
  }

  InputDecoration inputDecoration(
      String label,
      IconData icon,
      ) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(
        icon,
        color: const Color(0xFFFF4F81),
      ),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Color(0xFFFF4F81),
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FA),

      appBar: AppBar(
        title: const Text(
          'สมัครสมาชิก',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Center(
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFF7FA5),
                          Color(0xFFFF4F81),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.person_add_alt_1,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'สร้างบัญชี FoodReserve',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'กรอกข้อมูลเพื่อสร้างบัญชีของคุณ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'ข้อมูลส่วนตัว',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: nameController,
              decoration: inputDecoration(
                'ชื่อ *',
                Icons.person_outline,
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: surnameController,
              decoration: inputDecoration(
                'นามสกุล *',
                Icons.person_outline,
              ),
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField<String>(
              value: gender,
              decoration: inputDecoration(
                'เพศ',
                Icons.wc_outlined,
              ),
              items: const [
                DropdownMenuItem(
                  value: 'ไม่ระบุ',
                  child: Text('ไม่ระบุ'),
                ),
                DropdownMenuItem(
                  value: 'ชาย',
                  child: Text('ชาย'),
                ),
                DropdownMenuItem(
                  value: 'หญิง',
                  child: Text('หญิง'),
                ),
                DropdownMenuItem(
                  value: 'อื่น ๆ',
                  child: Text('อื่น ๆ'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  gender = value ?? 'ไม่ระบุ';
                });
              },
            ),

            const SizedBox(height: 15),

            InkWell(
              onTap: selectBirthDate,
              borderRadius: BorderRadius.circular(16),
              child: InputDecorator(
                decoration: inputDecoration(
                  'วันเกิด',
                  Icons.calendar_month_outlined,
                ),
                child: Text(
                  birthDateText,
                  style: TextStyle(
                    color: birthDate == null
                        ? Colors.grey
                        : Colors.black87,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'ข้อมูลการติดต่อ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: inputDecoration(
                'อีเมล *',
                Icons.email_outlined,
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: inputDecoration(
                'เบอร์โทรศัพท์ *',
                Icons.phone_outlined,
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: addressController,
              maxLines: 4,
              decoration: inputDecoration(
                'ที่อยู่',
                Icons.location_on_outlined,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'ตั้งค่าบัญชี',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: passwordController,
              obscureText: hidePassword,
              decoration: inputDecoration(
                'รหัสผ่าน *',
                Icons.lock_outline,
              ).copyWith(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: Icon(
                    hidePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: confirmPasswordController,
              obscureText: hideConfirmPassword,
              decoration: inputDecoration(
                'ยืนยันรหัสผ่าน *',
                Icons.lock_reset_outlined,
              ).copyWith(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hideConfirmPassword =
                      !hideConfirmPassword;
                    });
                  },
                  icon: Icon(
                    hideConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                '* รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: CheckboxListTile(
                value: acceptTerms,
                activeColor: const Color(0xFFFF4F81),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                controlAffinity:
                ListTileControlAffinity.leading,
                title: const Text(
                  'ฉันยอมรับเงื่อนไขการใช้งานและนโยบายความเป็นส่วนตัว',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    acceptTerms = value ?? false;
                  });
                },
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4F81),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'สมัครสมาชิก',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'มีบัญชีอยู่แล้ว? เข้าสู่ระบบ',
                  style: TextStyle(
                    color: Color(0xFFFF4F81),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}