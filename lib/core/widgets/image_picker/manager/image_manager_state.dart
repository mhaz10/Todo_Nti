part of 'image_manager_cubit.dart';

@immutable
sealed class ImageManagerState {}

final class ImageManagerInitial extends ImageManagerState {}

final class ImageManagerPickedState  extends ImageManagerState {
  final XFile image;

  ImageManagerPickedState(this.image);
}
