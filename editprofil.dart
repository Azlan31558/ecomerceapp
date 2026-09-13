import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // ==========================================================
  // PREMIUM THEME COLORS
  // ==========================================================

  static const Color primary = Color(0xFF111827);
  static const Color accent = Color.fromARGB(255, 23, 212, 155);
  static const Color background = Color(0xFFF8F7F3);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController =
      TextEditingController(text: 'Muhammad Azlan');

  final TextEditingController emailController =
      TextEditingController(text: 'azlan@example.com');

  final TextEditingController phoneController =
      TextEditingController(text: '+92 300 1234567');

  final TextEditingController addressController =
      TextEditingController(text: 'Sahiwal, Punjab, Pakistan');

  bool notifications = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  // ==========================================================
  // SAVE PROFILE
  // ==========================================================

  void saveProfile() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully ✓'),
          duration: Duration(seconds: 2),
          backgroundColor: primary,
        ),
      );

      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          Navigator.pop(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      // ==========================================================
      // APP BAR
      // ==========================================================

      appBar: AppBar(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),

      // ==========================================================
      // BODY
      // ==========================================================

      body: Form(
        key: _formKey,

        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 35),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ==================================================
              // PROFILE HEADER
              // ==================================================

              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [

                    // Avatar
                    Container(
                      width: 112,
                      height: 112,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        gradient: const LinearGradient(
                          colors: [
                            primary,
                            accent,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: accent.withOpacity(.25),
                            blurRadius: 25,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),

                      child: const Icon(
                        Icons.person_rounded,
                        size: 58,
                        color: Colors.white,
                      ),
                    ),

                    // Camera Button
                    Positioned(
                      right: -2,
                      bottom: 2,

                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return const _PhotoOptionsSheet();
                            },
                          );
                        },

                        child: Container(
                          width: 38,
                          height: 38,

                          decoration: BoxDecoration(
                            color: accent,
                            shape: BoxShape.circle,

                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),

                          child: const Icon(
                            Icons.camera_alt_rounded,
                            size: 18,
                            color: primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              const Center(
                child: Text(
                  'Update your profile',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // ==================================================
              // PERSONAL INFORMATION
              // ==================================================

              const Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: primary,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Keep your information up to date',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 18),

              // Name
              _ProfileTextField(
                controller: nameController,
                label: 'Full Name',
                hint: 'Enter your name',
                icon: Icons.person_outline_rounded,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }

                  if (value.trim().length < 3) {
                    return 'Name must be at least 3 characters';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Email
              _ProfileTextField(
                controller: emailController,
                label: 'Email Address',
                hint: 'Enter your email',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }

                  if (!value.contains('@')) {
                    return 'Enter a valid email address';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Phone
              _ProfileTextField(
                controller: phoneController,
                label: 'Phone Number',
                hint: 'Enter your phone number',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your phone number';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Address
              _ProfileTextField(
                controller: addressController,
                label: 'Address',
                hint: 'Enter your address',
                icon: Icons.location_on_outlined,
                maxLines: 2,
              ),

              const SizedBox(height: 28),

              // ==================================================
              // PREFERENCES
              // ==================================================

              const Text(
                'Preferences',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: primary,
                ),
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),

                  border: Border.all(
                    color: accent.withOpacity(.12),
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.04),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),

                child: Row(
                  children: [

                    // Notification Icon
                    Container(
                      width: 42,
                      height: 42,

                      decoration: BoxDecoration(
                        color: accent.withOpacity(.12),
                        borderRadius: BorderRadius.circular(13),
                      ),

                      child: const Icon(
                        Icons.notifications_none_rounded,
                        color: accent,
                      ),
                    ),

                    const SizedBox(width: 13),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [

                          Text(
                            'Notifications',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: primary,
                            ),
                          ),

                          SizedBox(height: 3),

                          Text(
                            'Receive offers and updates',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Switch(
                      value: notifications,

                      activeColor: const Color.fromARGB(255, 39, 184, 20),

                      activeTrackColor:
                          accent.withOpacity(.35),

                      inactiveThumbColor: Colors.grey,

                      onChanged: (value) {
                        setState(() {
                          notifications = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ==================================================
              // SAVE BUTTON
              // ==================================================

              SizedBox(
                width: double.infinity,
                height: 58,

                child: ElevatedButton(
                  onPressed: saveProfile,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: accent,
                    foregroundColor: primary,
                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Icon(
                        Icons.check_circle_outline_rounded,
                        size: 20,
                      ),

                      SizedBox(width: 9),

                      Text(
                        'Save Changes',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ==================================================
              // CANCEL BUTTON
              // ==================================================

              SizedBox(
                width: double.infinity,
                height: 52,

                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  style: OutlinedButton.styleFrom(
                    foregroundColor: primary,

                    side: const BorderSide(
                      color: primary,
                      width: 1,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================================================================
// PROFILE TEXT FIELD
// ================================================================

class _ProfileTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final int maxLines;
  final String? Function(String?)? validator;

  const _ProfileTextField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Padding(
          padding: const EdgeInsets.only(
            left: 4,
            bottom: 7,
          ),

          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Color(0xFF111827),
            ),
          ),
        ),

        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,

          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111827),
          ),

          decoration: InputDecoration(
            hintText: hint,

            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),

            prefixIcon: Icon(
              icon,
              color: const Color.fromARGB(255, 23, 172, 23),
              size: 20,
            ),

            filled: true,
            fillColor: Colors.white,

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 17,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: BorderSide.none,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: BorderSide.none,
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 23, 212, 155),
                width: 1.3,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: const BorderSide(
                color: Colors.redAccent,
              ),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: const BorderSide(
                color: Colors.redAccent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ================================================================
// PHOTO OPTIONS
// ================================================================

class _PhotoOptionsSheet extends StatelessWidget {
  const _PhotoOptionsSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 15, 22, 30),

      decoration: const BoxDecoration(
        color: Color(0xFFF8F7F3),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),

      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [

            Container(
              width: 45,
              height: 5,

              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'Profile Photo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color(0xFF111827),
              ),
            ),

            const SizedBox(height: 18),

            Row(
              children: [

                Expanded(
                  child: _PhotoOption(
                    icon: Icons.camera_alt_rounded,
                    title: 'Camera',

                    onTap: () {
                      Navigator.pop(context);

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Camera option selected',
                          ),
                          backgroundColor:
                              Color(0xFF111827),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _PhotoOption(
                    icon: Icons.photo_library_rounded,
                    title: 'Gallery',

                    onTap: () {
                      Navigator.pop(context);

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Gallery option selected',
                          ),
                          backgroundColor:
                              Color(0xFF111827),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ================================================================
// PHOTO OPTION
// ================================================================

class _PhotoOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _PhotoOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),

          border: Border.all(
            color: Color.fromARGB(255, 23, 212, 155).withOpacity(.15),
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.04),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Column(
          children: [

            Container(
              width: 48,
              height: 48,

              decoration: BoxDecoration(
                color: Color.fromARGB(255, 23, 212, 155).withOpacity(.12),
                borderRadius: BorderRadius.circular(15),
              ),

              child: Icon(
                icon,
                color: Color.fromARGB(255, 23, 212, 155),
              ),
            ),

            const SizedBox(height: 9),

            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Color(0xFF111827),
              ),
            ),
          ],
        ),
      ),
    );
  }
}