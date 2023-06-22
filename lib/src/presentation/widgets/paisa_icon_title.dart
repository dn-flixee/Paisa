import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/common.dart';
import '../home/bloc/home_bloc.dart';

class PaisaIconTitle extends StatelessWidget {
  const PaisaIconTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 10,
      leading: Icon(
        Icons.wallet,
        color: context.primary,
        size: 32,
      ),
      title: Text(
        context.loc.appTitle,
        style: GoogleFonts.outfit(
          fontWeight: FontWeight.w600,
          textStyle: context.titleLarge,
          color: context.onBackground,
        ),
      ),
    );
  }
}

class PaisaTitle extends StatelessWidget {
  const PaisaTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<HomeBloc>(context),
      builder: (context, state) {
        String title = PageType.home.name(context);
        if (state is CurrentIndexState) {
          title = state.currentPage.name(context);
        }
        return Text(
          title,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w600,
            textStyle: context.titleLarge,
            color: context.onBackground,
          ),
        );
      },
    );
  }
}

class PaisaIcon extends StatelessWidget {
  const PaisaIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.wallet,
      color: context.primary,
      size: 32,
    );
  }
}
