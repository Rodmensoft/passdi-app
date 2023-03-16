import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../ui/global_widgets/customed_alert_dialog.dart';

class GeolocatorService {
  Future<Position?> determinePosition() async {
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    const String extraInfo =
        // ignore: lines_longer_than_80_chars
        'Por favor, active los servicios de ubicación para una mejor experiencia. ¿Abrir configuración de la app?';

    if (!serviceEnabled) {
      final bool? active = await customedAlertDialog(
        'Servicios de ubicación desactivados. $extraInfo',
        cancel: true,
      );
      if (active == true) {
        await Geolocator.openLocationSettings();
      }

      if (!serviceEnabled) {
        return null;
      }
    }

    final PermissionStatus resultPermission =
        await Permission.location.request();

    switch (resultPermission) {
      case PermissionStatus.granted:
        return Geolocator.getCurrentPosition();

      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
        return null;
      case PermissionStatus.permanentlyDenied:
        final bool? active = await customedAlertDialog(
          'Servicios de ubicación denegados permanentemente.  $extraInfo',
          cancel: true,
        );
        if (active == true) {
          await Geolocator.openAppSettings();
        }

        return null;
    }
  }
}
