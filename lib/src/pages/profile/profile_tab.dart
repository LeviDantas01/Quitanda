import 'package:flutter/material.dart';
import 'package:quitanda/src/pages/comuns_widgets/custom_text_fild.dart';
import 'package:quitanda/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil do ususario"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //email
          CustomTextFild(
            inicialValue: appData.user.email,
            icon: Icons.email,
            label: "Email",
            reedOnly: true,
          ),
          //nome
          CustomTextFild(
            inicialValue: appData.user.nome,
            icon: Icons.person,
            label: "Nome",
            reedOnly: true,
          ),
          //celular
          CustomTextFild(
            inicialValue: appData.user.phone,
            icon: Icons.phone,
            label: "Celular",
            reedOnly: true,
          ),
          //cpf
          CustomTextFild(
            inicialValue: appData.user.cpf,
            icon: Icons.file_copy,
            isSecret: true,
            label: "CPF",
            reedOnly: true,
          ),
          //botaão para atualizar a senha
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.green,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                bool? result = await newUserPassworld();
              },
              child: const Text("Atualizar senha"),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> newUserPassworld() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "Atualizar Senha",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const CustomTextFild(
                      isSecret: true,
                      icon: Icons.lock,
                      label: "Senha Atual",
                    ),
                    const CustomTextFild(
                      isSecret: true,
                      icon: Icons.lock_outlined,
                      label: "Nova senha",
                    ),
                    const CustomTextFild(
                      isSecret: true,
                      icon: Icons.lock_outlined,
                      label: "Confirmar senha",
                    ),
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("Confirmar"),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
