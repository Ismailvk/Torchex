import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_wake/flutter_screen_wake.dart';
import 'package:torch_controller/torch_controller.dart';

class TorrchLight extends StatefulWidget {
  const TorrchLight({super.key});

  @override
  State<TorrchLight> createState() => _TorrchLightState();
}

class _TorrchLightState extends State<TorrchLight> {
  @override
  void initState() {
    super.initState();
    initBrightness();
  }

  bool isActive = false;
  TorchController controller = TorchController();
  double brightness = 0.0;
  bool isToggle = false;

  Future<void> initBrightness() async {
    double bright;
    try {
      bright = await FlutterScreenWake.brightness;
    } on PlatformException {
      bright = 1.0;
    }
    if (!mounted) return;
    setState(() {
      brightness = bright;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: isActive ? Colors.orange.shade100 : Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height / 12),
              isActive
                  ? Text(
                      'Flash Light :ON',
                      style: TextStyle(
                          fontSize: 16, color: Colors.orange.shade700),
                    )
                  : const Text(
                      'Flash Light :OFF',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
              SizedBox(height: size.height / 12),
              Center(
                child: CircleAvatar(
                  radius: size.width * 0.24,
                  backgroundColor: isActive
                      ? Colors.orange.withOpacity(0.1)
                      : Colors.grey.withOpacity(0.2),
                  child: CircleAvatar(
                    radius: size.width * 0.199,
                    backgroundColor: isActive
                        ? Colors.orange.withOpacity(0.3)
                        : Colors.grey.withOpacity(0.3),
                    child: CircleAvatar(
                      backgroundColor: isActive
                          ? Colors.orange.withOpacity(0.8)
                          : Colors.grey.withOpacity(0.9),
                      radius: size.width * 0.15,
                      child: Transform.scale(
                        scale: 1.5,
                        child: IconButton(
                          onPressed: () {
                            controller.toggle();
                            isActive = !isActive;
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.power_settings_new,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height / 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    AnimatedCrossFade(
                        firstChild: const Icon(
                          Icons.light_mode,
                          color: Colors.orange,
                        ),
                        secondChild: const Icon(
                          Icons.brightness_2,
                          color: Colors.orange,
                        ),
                        crossFadeState: isToggle
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(seconds: 1)),
                    Expanded(
                      child: Slider(
                        thumbColor: Colors.orange.shade400,
                        value: brightness.clamp(0.0, 1.0),
                        onChanged: (value) {
                          setState(() {
                            brightness = value.clamp(0.0, 1.0);
                          });
                          FlutterScreenWake.setBrightness(brightness);
                          if (brightness == 0) {
                            isToggle = false;
                          } else {
                            isToggle = true;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
