import 'package:climb_up/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  void changePages(int currentIndex, int value) {
    currentIndex = value;
  }
}
