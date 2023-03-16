import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:passdi_app/app/ui/global_widgets/custom_cicular_progress_ind.dart';
import 'package:passdi_app/utils/colors.dart';
import 'package:passdi_app/utils/size_box_int.dart';

import './controllers/location_controller.dart';

export './bindings/location_binding.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocationController controller = Get.find<LocationController>();

    return Stack(
      children: [
        Obx(() => GoogleMap(
            initialCameraPosition: controller.initialCameraPosition,
            onMapCreated: controller.onMapCreated,
            markers: controller.markers.value,
            compassEnabled: true,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomControlsEnabled: true,
            padding: EdgeInsets.symmetric(vertical: 150.sp),
            onLongPress: (latLng) {
              controller.addMarker(latLng);
              controller.defaultPosition = latLng;
            })),
        Column(
          children: [
            15.heightSP,
            Row(
              children: [
                20.widthSP,
                Expanded(
                  child: SafeArea(
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            AppTextField(
                              controller: controller.searchCtrl,
                              textFieldType: TextFieldType.NAME,
                              onChanged: (p0) {
                                controller.searchLocations(p0);
                              },
                              suffix: const Icon(Icons.search),
                              decoration: const InputDecoration(
                                hintText: 'Buscar',
                                border: InputBorder.none,
                              ),
                            ),
                            // SearchMapPlaceWidget(
                            //   onSelected: controller.onSelected,
                            //   // iconColor: primaryColor,
                            //   placeholder: 'Buscar',
                            //   bgColor: Colors.white,
                            //   // textColor: primaryColor,
                            //   language: 'es',
                            //   apiKey: 'AIzaSyDXoLtHhTfSbbECk91kqNL8l3Dtof1GKd8',
                            // ),
                            Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ...controller.placemarks.map(
                                    (element) => AppButton(
                                      enableScaleAnimation: false,
                                      margin: EdgeInsets.zero,
                                      elevation: 0,
                                      onTap: () {
                                        hideKeyboard(context);
                                        controller.selectedLocation();
                                      },
                                      child: Text(
                                        '${element.locality} ${element.country}',
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                20.widthSP,
              ],
            ),
            const Spacer(),
            Obx(() {
              return Visibility(
                visible: controller.showButton,
                child: AppButton(
                  color: completed,
                  onTap: () {
                    controller.setLocation();
                  },
                  child: const Text(
                    'Establecer ubicación',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }),
            150.heightSP,
          ],
        ),
        Obx(
          () => Positioned.fill(
            child: AnimatedOpacity(
              duration: GetNumUtils(1).seconds,
              opacity: controller.loading.value ? 1 : 0,
              child: const CustomCenteredCicularProgressInd(),
            ),
          ),
        ),
      ],
    );
  }
}
