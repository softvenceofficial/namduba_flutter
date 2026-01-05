import 'package:nanduba/providers/chat_provider.dart';

import '../../../../export.dart';

class FilterTextField extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ]),
      child: TextField(
        controller: searchController,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search for oil filters and more',
          hintStyle: GoogleFonts.poppins(
              color: AppColors.grey, fontSize: 12, fontWeight: FontWeight.w400),
          prefixIcon: Container(
              height: 20,
              width: 20,
              alignment: Alignment.center,
              child: SvgPicture.asset(AppSvgs.searchIcon)),
          suffixIcon: GestureDetector(
            onTap: () {},
            child: Container(
                height: 34,
                width: 34,
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.white,
                  size: 20,
                )),
          ),
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.sp),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
