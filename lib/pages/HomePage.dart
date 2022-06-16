import 'package:flutter/material.dart';
import 'package:flutter_biometric_app/helpers/biometric_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showBiometrics = false;
  bool isAuthenticated = false;
  
  @override
  void initState() {
    super.initState();
    isBiometricAvailable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(showBiometrics)
              ElevatedButton(
                child: const Text(
                  'Biometric Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
                onPressed: () async {
                  isAuthenticated = await BiometricHelper().authenticate();
                  setState(() { });
                }, 
              ),
              const SizedBox(height: 50,),
              if(isAuthenticated)
                const Text(
                  'Well done!, Authenticated',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                  ),
                )
          ],
        )
      ),
    );
  }

  isBiometricAvailable() async {
    showBiometrics = await BiometricHelper().hasEnrolledBiometrics();
    setState(() { });
  }
}