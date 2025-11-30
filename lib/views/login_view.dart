import 'package:flutter/material.dart';
import 'main_view.dart'; // CAMBIO: Importamos la portada en vez de la lista

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  void _login() {
    // CAMBIO IMPORTANTE:
    // Navegamos a MainView (Portada), NO a ListViewPage.
    // Usamos pushReplacement para que no puedan volver al login.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color dorado = Color(0xFFB8860B);
    const Color crema = Color(0xFFFFF8E7);

    return Scaffold(
      backgroundColor: crema,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.spa, size: 80, color: dorado),
              const SizedBox(height: 20),
              
              const Text(
                "Perfumería Bloom",
                style: TextStyle(
                  fontSize: 28, 
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B4513)
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Acceso a la colección exclusiva",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))
                  ],
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _userController,
                      decoration: const InputDecoration(
                        labelText: "Usuario",
                        prefixIcon: Icon(Icons.person, color: dorado),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: dorado))
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _passController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Contraseña",
                        prefixIcon: Icon(Icons.lock, color: dorado),
                        border: OutlineInputBorder(),
                         focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: dorado))
                      ),
                    ),
                    const SizedBox(height: 30),
                    
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: dorado,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: _login,
                        child: const Text("ENTRAR", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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