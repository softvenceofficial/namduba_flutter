import 'dart:io';
import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class UploadContainer extends StatefulWidget {
  final String svgPath;
  final String title;
  final String subtitle;
  final double height;

  final Function(File? file) onImageSelected;

  const UploadContainer({
    super.key,
    required this.svgPath,
    required this.title,
    required this.subtitle,
    required this.onImageSelected,
    this.height = 109,
  });

  @override
  State<UploadContainer> createState() => _UploadContainerState();
}

class _UploadContainerState extends State<UploadContainer> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      final file = File(image.path);
      setState(() {
        _selectedImage = file;
      });

      /// pass image to parent
      widget.onImageSelected(file);
    }
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPicker(context),
      child: Container(
        alignment: Alignment.center,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.cBEBEBE),
        ),
        child: _selectedImage != null
            ? Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      _selectedImage!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedImage = null;
                        });
                        widget.onImageSelected(null);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    widget.svgPath,
                    color: AppColors.red,
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    widget.title,
                    style: Textfontstyle.TextStyle14w400midgreypoppins.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                      color: AppColors.c5D5D5D,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: Textfontstyle.TextStyle14w400midgreypoppins.copyWith(
                      fontSize: 7.sp,
                      color: AppColors.c5D5D5D,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
