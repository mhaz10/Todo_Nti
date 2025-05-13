import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_manager_state.dart';

class ImageManagerCubit extends Cubit<ImageManagerState> {
  ImageManagerCubit() : super(ImageManagerInitial());

  static ImageManagerCubit get(context) => BlocProvider.of(context);

  void pickImage({ImageSource source = ImageSource.gallery}) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      emit(ImageManagerPickedState(image));
    }
  }
}
