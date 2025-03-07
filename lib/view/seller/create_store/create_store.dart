import 'package:flutter/material.dart';
import 'package:greenfarmer/view/widgets/app_top_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../utils/colors.dart';
import '../../widgets/app_button.dart';

class CreateShopPage extends StatefulWidget {
  const CreateShopPage({super.key});

  @override
  State<CreateShopPage> createState() => _CreateShopPageState();
}

class _CreateShopPageState extends State<CreateShopPage> {
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  String selectedCategory = "Vegetables"; // Default category
  File? shopImage;

  final List<String> categories = [
    "Vegetables",
    "Fruits",
    "Dairy",
    "Poultry",
    "Grains",
  ];

  // Function to pick image from gallery
  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        shopImage = File(pickedFile.path);
      });
    }
  }

  // Function to submit shop details
  void createShop() {
    if (shopNameController.text.isEmpty ||
        locationController.text.isEmpty ||
        shopImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields and upload an image"),
        ),
      );
      return;
    }

    // TODO: Implement API call to create shop
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Shop created successfully!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("Create Your Shop")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 20),
            AppTopBar(title: "Create Your Shop", homeScreen: false),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  // Shop Name Input
                  const Text(
                    "Shop Name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: shopNameController,
                    decoration: const InputDecoration(
                      hintText: "Enter shop name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Category Dropdown
                  const Text(
                    "Category",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  DropdownButtonFormField(
                    value: selectedCategory,
                    items:
                        categories.map((category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                    onChanged:
                        (value) =>
                            setState(() => selectedCategory = value.toString()),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Shop Description
                  const Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: descriptionController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      hintText: "Describe your shop...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Location Input
                  const Text(
                    "Location",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: locationController,
                    decoration: const InputDecoration(
                      hintText: "Enter shop location",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Image Picker
                  const Text(
                    "Shop Image",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: pickImage,
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:
                          shopImage != null
                              ? Image.file(shopImage!, fit: BoxFit.cover)
                              : const Center(
                                child: Text("Tap to upload shop image"),
                              ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Create Shop Button
                  AppButton(
                    //iconn: Icon(Icons.create, color: Colors.white,),
                    onPressed: createShop,
                    backgroundColor: AppColors.kPrimaryColor,
                    buttonWidth: double.maxFinite,
                    buttonText: "Create Shop",
                    buttonTextSize: 18,
                    buttonTextColor: AppColors.whiteColor,
                  ),

                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     onPressed: createShop,
                  //     child: const Text("Create Shop", style: TextStyle(fontSize: 18)),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
