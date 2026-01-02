import 'package:nanduba/export.dart';

class FavouriteIcon extends StatefulWidget {
  const FavouriteIcon({super.key});

  @override
  FavouriteIconState createState() => FavouriteIconState();
}

class FavouriteIconState extends State<FavouriteIcon> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: _isFavorite
            ? Icon(
                CupertinoIcons.heart_solid,
                key: ValueKey<bool>(_isFavorite),
                color: AppColors.primary,
                size: 2.5.h,
              )
            : Icon(
                CupertinoIcons.heart,
                key: ValueKey<bool>(_isFavorite),
                color: AppColors.primary,
                size: 2.5.h,
              ),
      ),
    );
  }
}


class FavSliderIcon extends StatefulWidget {
  const FavSliderIcon({super.key});

  @override
  State<FavSliderIcon> createState() => _FavSliderIconState();
}

class _FavSliderIconState extends State<FavSliderIcon> {

  bool _isFavorite = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: _isFavorite
            ? Icon(
          CupertinoIcons.heart_solid,
          key: ValueKey<bool>(_isFavorite),
          color: AppColors.primary,
          size: 3.h,
        )
            : Icon(
          CupertinoIcons.heart,
          key: ValueKey<bool>(_isFavorite),
          color: AppColors.primary,
          size: 3.h,
        ),
      ),
    );;
  }
}
