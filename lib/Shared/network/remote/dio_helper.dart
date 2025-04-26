import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true
      ),
    );
  }
  Future<Response> getData({
    required String url,
    required Map<String,dynamic> query,
}) async {
    return await dio!.get(url,queryParameters:query);
  }
}
// ---- get data method-----
// void getSearchData({
//   required String? value,
// }) {
//   //
//   emit(GetDataLoadingState());
//   DioHelper().getData(
//     url: 'base line',
//     query: {
//       'q': value,
//       'apiKey': api key,
//     },
//   ).then((value) {
//     data = value.data['type of data'];
//     print(search[0]['title']);
//     emit(GetDataSuccesState());
//   }).catchError((onError) {
//     print('Error is : $onError');
//     emit(GetDataErrorState(onError));
//   });
// }
