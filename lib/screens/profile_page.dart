import 'package:flutter/material.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FA),
      appBar: AppBar(
        title: const Text(
          'โปรไฟล์',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // =========================
            // Profile Header
            // =========================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 105,
                        height: 105,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFFF7FA5),
                              Color(0xFFFF4F81),
                            ],
                          ),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),

                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF4F81),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 17,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'ผู้ใช้งาน',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'user@email.com',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // Account Menu
            // =========================
            _menuTitle('บัญชีของฉัน'),

            _menuItem(
              context,
              icon: Icons.person_outline,
              title: 'ข้อมูลส่วนตัว',
              subtitle: 'แก้ไขชื่อ อีเมล เบอร์โทร และข้อมูลส่วนตัว',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PersonalInfoPage(),
                  ),
                );
              },
            ),

            _menuItem(
              context,
              icon: Icons.notifications_none,
              title: 'การแจ้งเตือน',
              subtitle: 'จัดการการแจ้งเตือนของแอป',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
                  ),
                );
              },
            ),

            _menuItem(
              context,
              icon: Icons.settings_outlined,
              title: 'การตั้งค่า',
              subtitle: 'ตั้งค่าการใช้งานแอป',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            _menuTitle('อื่น ๆ'),

            _menuItem(
              context,
              icon: Icons.help_outline,
              title: 'ช่วยเหลือ',
              subtitle: 'คำถามที่พบบ่อยและการช่วยเหลือ',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('ช่วยเหลือ'),
                      content: const Text(
                        'หากพบปัญหาในการใช้งานระบบจองร้านอาหาร '
                            'สามารถติดต่อผู้ดูแลระบบได้',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'ตกลง',
                            style: TextStyle(
                              color: Color(0xFFFF4F81),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),

            _menuItem(
              context,
              icon: Icons.info_outline,
              title: 'เกี่ยวกับแอป',
              subtitle: 'FoodReserve ระบบจองร้านอาหาร',
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'FoodReserve',
                  applicationVersion: '1.0.0',
                  applicationIcon: const Icon(
                    Icons.restaurant,
                    color: Color(0xFFFF4F81),
                    size: 40,
                  ),
                  children: const [
                    Text(
                      'แอปพลิเคชันสำหรับค้นหาร้านอาหาร '
                          'ดูเมนู และจองร้านอาหารได้อย่างสะดวก',
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),

            // =========================
            // Logout
            // =========================
            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return AlertDialog(
                        title: const Text('ออกจากระบบ'),
                        content: const Text(
                          'คุณต้องการออกจากระบบหรือไม่?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                            },
                            child: const Text(
                              'ยกเลิก',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color(0xFFFF4F81),
                            ),
                            onPressed: () {
                              Navigator.pop(dialogContext);

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const LoginPage(),
                                ),
                                    (route) => false,
                              );
                            },
                            child: const Text(
                              'ออกจากระบบ',
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
                icon: const Icon(
                  Icons.logout,
                  color: Color(0xFFFF4F81),
                ),
                label: const Text(
                  'ออกจากระบบ',
                  style: TextStyle(
                    color: Color(0xFFFF4F81),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color(0xFFFF4F81),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // =========================
  // Menu Title
  // =========================
  Widget _menuTitle(String title) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  // =========================
  // Menu Item
  // =========================
  Widget _menuItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required VoidCallback onTap,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 8,
        ),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFFFE5ED),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: const Color(0xFFFF4F81),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }
}

// ============================================================
// หน้าข้อมูลส่วนตัว
// ============================================================

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() =>
      _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final nameController =
  TextEditingController(text: 'ผู้ใช้งาน');

  final surnameController =
  TextEditingController();

  final emailController =
  TextEditingController(text: 'user@email.com');

  final phoneController =
  TextEditingController();

  final addressController =
  TextEditingController();

  String gender = 'ไม่ระบุ';

  DateTime? birthDate;

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  Future<void> selectBirthDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: birthDate ?? DateTime(2000),
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

  void saveProfile() {
    if (nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('กรุณากรอกชื่อ'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('บันทึกข้อมูลส่วนตัวเรียบร้อยแล้ว'),
        backgroundColor: Color(0xFFFF4F81),
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
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
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
          'ข้อมูลส่วนตัว',
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
          children: [
            // รูปโปรไฟล์
            Stack(
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFF7FA5),
                        Color(0xFFFF4F81),
                      ],
                    ),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 65,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF4F81),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            const Text(
              'แก้ไขข้อมูลส่วนตัว',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            // ชื่อ
            TextField(
              controller: nameController,
              decoration: inputDecoration(
                'ชื่อ',
                Icons.person_outline,
              ),
            ),

            const SizedBox(height: 15),

            // นามสกุล
            TextField(
              controller: surnameController,
              decoration: inputDecoration(
                'นามสกุล',
                Icons.person_outline,
              ),
            ),

            const SizedBox(height: 15),

            // เพศ
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

            // วันเกิด
            InkWell(
              onTap: selectBirthDate,
              borderRadius: BorderRadius.circular(15),
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

            const SizedBox(height: 15),

            // Email
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: inputDecoration(
                'อีเมล',
                Icons.email_outlined,
              ),
            ),

            const SizedBox(height: 15),

            // เบอร์โทร
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: inputDecoration(
                'เบอร์โทรศัพท์',
                Icons.phone_outlined,
              ),
            ),

            const SizedBox(height: 15),

            // ที่อยู่
            TextField(
              controller: addressController,
              maxLines: 4,
              decoration: inputDecoration(
                'ที่อยู่',
                Icons.location_on_outlined,
              ),
            ),

            const SizedBox(height: 25),

            // ปุ่มบันทึก
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: saveProfile,
                icon: const Icon(
                  Icons.save_outlined,
                  color: Colors.white,
                ),
                label: const Text(
                  'บันทึกข้อมูล',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4F81),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
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

// ============================================================
// หน้าการแจ้งเตือน
// ============================================================

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() =>
      _NotificationPageState();
}

class _NotificationPageState
    extends State<NotificationPage> {
  bool bookingNotification = true;
  bool promotionNotification = true;
  bool reminderNotification = true;
  bool newsNotification = false;

  Widget notificationSwitch({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE5ED),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xFFFF4F81),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            activeColor: const Color(0xFFFF4F81),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FA),
      appBar: AppBar(
        title: const Text(
          'การแจ้งเตือน',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'ตั้งค่าการแจ้งเตือน',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'เลือกประเภทการแจ้งเตือนที่ต้องการรับ',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 20),

          notificationSwitch(
            icon: Icons.event_available,
            title: 'การจองร้านอาหาร',
            subtitle: 'แจ้งเตือนเมื่อมีการจองหรือยกเลิก',
            value: bookingNotification,
            onChanged: (value) {
              setState(() {
                bookingNotification = value;
              });
            },
          ),

          notificationSwitch(
            icon: Icons.local_offer_outlined,
            title: 'โปรโมชั่น',
            subtitle: 'รับข่าวสารโปรโมชั่นและส่วนลด',
            value: promotionNotification,
            onChanged: (value) {
              setState(() {
                promotionNotification = value;
              });
            },
          ),

          notificationSwitch(
            icon: Icons.alarm_outlined,
            title: 'แจ้งเตือนการจอง',
            subtitle: 'แจ้งเตือนก่อนถึงเวลาที่จอง',
            value: reminderNotification,
            onChanged: (value) {
              setState(() {
                reminderNotification = value;
              });
            },
          ),

          notificationSwitch(
            icon: Icons.campaign_outlined,
            title: 'ข่าวสาร',
            subtitle: 'ข่าวสารและอัปเดตจาก FoodReserve',
            value: newsNotification,
            onChanged: (value) {
              setState(() {
                newsNotification = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

// ============================================================
// หน้าการตั้งค่า
// ============================================================

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() =>
      _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool darkMode = false;
  bool sound = true;

  String language = 'ภาษาไทย';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FA),
      appBar: AppBar(
        title: const Text(
          'การตั้งค่า',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'ทั่วไป',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                SwitchListTile(
                  secondary: const Icon(
                    Icons.dark_mode_outlined,
                    color: Color(0xFFFF4F81),
                  ),
                  title: const Text('โหมดกลางคืน'),
                  subtitle: const Text(
                    'เปลี่ยนรูปแบบหน้าจอเป็นโหมดมืด',
                  ),
                  value: darkMode,
                  activeColor: const Color(0xFFFF4F81),
                  onChanged: (value) {
                    setState(() {
                      darkMode = value;
                    });

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      SnackBar(
                        content: Text(
                          value
                              ? 'เปิดโหมดกลางคืนแล้ว'
                              : 'ปิดโหมดกลางคืนแล้ว',
                        ),
                      ),
                    );
                  },
                ),

                const Divider(height: 1),

                SwitchListTile(
                  secondary: const Icon(
                    Icons.volume_up_outlined,
                    color: Color(0xFFFF4F81),
                  ),
                  title: const Text('เสียง'),
                  subtitle: const Text(
                    'เปิดเสียงแจ้งเตือนของแอป',
                  ),
                  value: sound,
                  activeColor: const Color(0xFFFF4F81),
                  onChanged: (value) {
                    setState(() {
                      sound = value;
                    });
                  },
                ),

                const Divider(height: 1),

                ListTile(
                  leading: const Icon(
                    Icons.language,
                    color: Color(0xFFFF4F81),
                  ),
                  title: const Text('ภาษา'),
                  subtitle: Text(language),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SafeArea(
                          child: Column(
                            mainAxisSize:
                            MainAxisSize.min,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  'เลือกภาษา',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight:
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.check,
                                  color:
                                  Color(0xFFFF4F81),
                                ),
                                title: const Text(
                                  'ภาษาไทย',
                                ),
                                onTap: () {
                                  setState(() {
                                    language =
                                    'ภาษาไทย';
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.language,
                                ),
                                title: const Text(
                                  'English',
                                ),
                                onTap: () {
                                  setState(() {
                                    language =
                                    'English';
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'แอปพลิเคชัน',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.info_outline,
                    color: Color(0xFFFF4F81),
                  ),
                  title: const Text('เกี่ยวกับ FoodReserve'),
                  subtitle: const Text(
                    'เวอร์ชัน 1.0.0',
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                  onTap: () {
                    showAboutDialog(
                      context: context,
                      applicationName: 'FoodReserve',
                      applicationVersion: '1.0.0',
                      applicationIcon: const Icon(
                        Icons.restaurant,
                        color: Color(0xFFFF4F81),
                        size: 40,
                      ),
                      children: const [
                        Text(
                          'ระบบจองร้านอาหาร FoodReserve',
                        ),
                      ],
                    );
                  },
                ),

                const Divider(height: 1),

                ListTile(
                  leading: const Icon(
                    Icons.privacy_tip_outlined,
                    color: Color(0xFFFF4F81),
                  ),
                  title: const Text(
                    'นโยบายความเป็นส่วนตัว',
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'นโยบายความเป็นส่วนตัว',
                          ),
                          content: const Text(
                            'ข้อมูลของผู้ใช้งานจะถูกใช้ '
                                'เพื่อให้บริการระบบจองร้านอาหาร '
                                'และปรับปรุงประสบการณ์การใช้งาน',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'ปิด',
                                style: TextStyle(
                                  color:
                                  Color(0xFFFF4F81),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}