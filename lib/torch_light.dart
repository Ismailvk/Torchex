import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class TorrchLight extends StatefulWidget {
  const TorrchLight({super.key});

  @override
  State<TorrchLight> createState() => _TorrchLightState();
}

class _TorrchLightState extends State<TorrchLight> {
  bool isActive = false;
  TorchController controller = TorchController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Torch'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height / 5),
            isActive
                ? Text(
                    'Flash Light :ON',
                    style:
                        TextStyle(fontSize: 16, color: Colors.orange.shade700),
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
                      ? Colors.orange.withOpacity(0.09)
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
            SizedBox(height: size.height / 5),
            Text('Developed by ISMAIL VK',
                style: TextStyle(color: Colors.grey.shade900))
          ],
        ),
      ),
    );
  }
}
