import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:wearther_app/apis/weather_api.dart';
import 'package:wearther_app/models/weather_data.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;
  WeatherData getWeatherData() => weatherData.value;

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission locationPermission;
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    // Now you can use the location services
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;

      // Call api weather
      return FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value!;
        _isLoading.value = false;
      });
    });
  }
}
