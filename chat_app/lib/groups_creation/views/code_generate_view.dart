import 'package:chat_app/groups_creation/cubits/group_code_cubit/group_code_cubit.dart';
import 'package:chat_app/groups_creation/group_enum.dart';
import 'package:chat_app/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CodeGenerateView extends StatefulWidget {
  const CodeGenerateView({super.key});

  @override
  State<CodeGenerateView> createState() => _CodeGenerateViewState();
}

class _CodeGenerateViewState extends State<CodeGenerateView> {

  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroupCodeCubit, GroupCodeState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
            return const CodeGenerateField(hintText: 'Generate Group Code');
          case Status.loading:
            return const CodeGenerateField(hintText: 'Loading');
          case Status.success:
            return CodeGenerateField(controller: controller);
          case Status.failed:
            return const CodeGenerateField(hintText: 'Failed');
        }
      },
      listener: (context, state) {
        if (state.status == Status.success) {
          controller.text = state.groupCode!;
        } else if (state.status == Status.failed) {
          context.snackBar(state.message!);
        }
      },
    );
  }
}

class CodeGenerateField extends StatelessWidget {
  const CodeGenerateField({super.key, this.hintText, this.controller});

  final String? hintText;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () {
            context.read<GroupCodeCubit>().generateGroupCode();
          },
          child: const Icon(Icons.create),
        ),
        floatingLabelStyle: const TextStyle(fontSize: 17.0),
        labelText: "Group Code",
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
        labelStyle: const TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }
}
