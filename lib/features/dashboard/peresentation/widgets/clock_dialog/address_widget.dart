import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/theme/animated_fade_widget.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/loading_indicater.dart';

class AddressWidget extends StatefulWidget {
  final double latitude;
  final double longitude;

  const AddressWidget({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  _AddressWidgetState createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  String? _address;
  bool _isLoading = false;
  String? _errorMessage;
  final APIKEY = 'AIzaSyA3LxsmNEJv-yxSF8khxA4LgZwF_k0xePU';
  @override
  void initState() {
    super.initState();
    _fetchAddress();
  }

  Future<void> _fetchAddress() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${widget.latitude},${widget.longitude}&key=${APIKEY}';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'OK' && data['results'].isNotEmpty) {
          setState(() {
            print(data['results'][0]);
            _address = data['results'][0]['formatted_address'];
          });
        } else {
          setState(() {
            _errorMessage = 'No address found.';
          });
        }
      } else {
        setState(() {
          _errorMessage = 'Failed to fetch address. Please try again.';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error occurred while fetching address: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_isLoading)
          Container(
            height: 100.h,
            child: LoadingIndicatorWidget(),
          )
        else if (_errorMessage != null)
          AnimatedFadeWidget(
            onTap: _fetchAddress,
            child: Text(
              _errorMessage!,
              style: TextStyle(color: Colors.red),
            ),
          )
        else if (_address != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 2,
                width: 50.w,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                ),
              ),
              3.toSizedBox,
              Text(
                'Location',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkGrey),
                textAlign: TextAlign.center,
              ),
              Text(
                _address!,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
            ],
          ),
      ],
    );
  }
}
