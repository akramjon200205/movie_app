import 'package:flutter/material.dart';
import 'package:fluttery_movies/models/movie_detail_model.dart';
import 'package:fluttery_movies/providers/movie_provider.dart';
import 'package:fluttery_movies/utills/constants.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AdditionalPage extends StatelessWidget {
  AdditionalPage(this.spokenLanguages, this.productionCounetrties, {Key? key})
      : super(key: key);

  List<SpokenLanguages> spokenLanguages;
  List<ProductionCountries> productionCounetrties;

  launchUR(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    List languageNames = List.generate(spokenLanguages.length, (index) {
      return spokenLanguages[index].name;
    });
    List countriesNames = List.generate(productionCounetrties.length, (index) {
      return productionCounetrties[index].name;
    });
    return Consumer<MovieProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Additional Details",
                style: kTextStyle(
                  size: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.black45,
                  size: 20,
                ),
                title: Text(
                  provider.movieDetailModel.releaseDate!,
                  style: kTextStyle(
                    size: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.favorite,
                  color: Colors.black45,
                  size: 20,
                ),
                title: Text(
                  "${provider.movieDetailModel.voteCount!}",
                  style: kTextStyle(
                    size: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.hourglass_bottom,
                  color: Colors.black45,
                  size: 20,
                ),
                title: Text(
                  "${provider.movieDetailModel.runtime!}",
                  style: kTextStyle(
                    size: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.monetization_on_outlined,
                  color: Colors.black45,
                  size: 20,
                ),
                title: Text(
                  "${provider.movieDetailModel.voteCount!}",
                  style: kTextStyle(
                    size: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.language,
                  color: Colors.black45,
                  size: 20,
                ),
                title: Text(
                  languageNames.join(', '),
                  style: kTextStyle(
                    size: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.flag,
                  color: Colors.black45,
                  size: 20,
                ),
                title: Text(
                  countriesNames.join(", "),
                  style: kTextStyle(
                    size: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: GestureDetector(
                  onTap: () {
                    launchUR(provider.movieDetailModel.homepage!);
                  },
                  child: Text(
                    provider.movieDetailModel.homepage!,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        );
      },
    );
  }
}
