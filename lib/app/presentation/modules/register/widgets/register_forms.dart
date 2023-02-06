import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class FormStep1 extends StatelessWidget {
  const FormStep1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTextField(
          textFieldType: TextFieldType.NAME,
          decoration: const InputDecoration(
            hintText: 'Nombres y Apellidos',
          ),
        ),
        AppTextField(
          textFieldType: TextFieldType.EMAIL,
          decoration: const InputDecoration(
            hintText: 'Email',
          ),
        ),
        AppTextField(
          textFieldType: TextFieldType.PASSWORD,
          decoration: const InputDecoration(
            hintText: 'Clave',
          ),
        ),
        AppTextField(
          textFieldType: TextFieldType.PASSWORD,
          decoration: const InputDecoration(
            hintText: 'Repetir clave',
          ),
        ),
      ],
    );
  }
}

class FormStep2 extends StatelessWidget {
  const FormStep2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTextField(
          textFieldType: TextFieldType.NAME,
          decoration: const InputDecoration(
            hintText: 'Tipo de Documento',
          ),
        ),
        AppTextField(
          textFieldType: TextFieldType.NUMBER,
          decoration: const InputDecoration(
            hintText: 'Número de Documento',
          ),
        ),
        AppTextField(
          textFieldType: TextFieldType.PHONE,
          decoration: const InputDecoration(
            hintText: 'Celular',
          ),
        ),
        AppTextField(
          textFieldType: TextFieldType.NAME,
          decoration: const InputDecoration(
            hintText: 'Género',
          ),
        ),
      ],
    );
  }
}

class FormStep3 extends StatelessWidget {
  const FormStep3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTextField(
          textFieldType: TextFieldType.NAME,
          decoration: const InputDecoration(
            hintText: 'Nacionalidad',
          ),
        ),
        AppTextField(
          textFieldType: TextFieldType.NAME,
          decoration: const InputDecoration(
            hintText: 'Ocupación',
          ),
        ),
        AppTextField(
          textFieldType: TextFieldType.NAME,
          decoration: const InputDecoration(
            hintText: 'Fecha de Nacimiento',
          ),
        ),
        AppTextField(
          textFieldType: TextFieldType.NAME,
          decoration: const InputDecoration(
            hintText: 'Estado Civil',
          ),
        ),
      ],
    );
  }
}
