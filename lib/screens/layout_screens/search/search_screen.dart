import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spinal_health/screens/layout_screens/search/search_cubit/search_cubit.dart';
import 'package:spinal_health/screens/layout_screens/search/search_cubit/search_states.dart';

import '../../../core/app_colors/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var searchCubit = SearchCubit.get(context);

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                onChanged: (value) {
                  searchCubit.filterNames(value);
                },
                // controller: searchCubit.tradingNewsSearchCon,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xffA5A5A5),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xffA5A5A5),
                        )),
                    hintText: "Search",
                    prefixIcon: IconButton(
                      color: const Color(0xffA5A5A5),
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/images/search.svg"),
                    )),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: 128.0,
                            height: 128.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/images/happy-successful-muslim-businesswoman-posing-outside.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                          Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              searchCubit.names[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            const Text(
                              "21 Years Old",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            const Text(
                              "Condition description",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: searchCubit.names.length,
              ),
            ),
            const SizedBox(height: 20,),
          ],
        );
      },
    );
  }
}
