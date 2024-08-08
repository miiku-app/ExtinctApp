import 'package:extinct_app/domain/animal/animal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimalViewTitle extends StatelessWidget {
  final Animal animal;
  const AnimalViewTitle({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        animal.name.toUpperCase(),
        style: GoogleFonts.merriweather(
            textStyle: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.w900)),
      ),
      Text(
        "EXTINCT AT ${animal.extinctYear}",
        style: GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.titleMedium),
        textAlign: TextAlign.center,
      )
    ]);
  }
}
