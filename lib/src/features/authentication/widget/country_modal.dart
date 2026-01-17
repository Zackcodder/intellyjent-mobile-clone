import 'package:intellyjent/src/core/core.dart';

class CountryModal extends StatefulWidget {
  final bool forPhone;
  const CountryModal({super.key,this.forPhone = false});

  @override
  State<CountryModal> createState() => _CountryModalState();
}

class _CountryModalState extends State<CountryModal> {
  List<Country> _filteredList = [];
  SignUpController sign = Get.put(SignUpController());
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    _filteredList.addAll(sign.countries);
    setState(() {});
    super.initState();
  }

  void _filterSearchResults(String query) {
    List<Country> searchResult = <Country>[];
    final CountryLocalizations? localizations =
        CountryLocalizations.of(context);

    if (query.isEmpty) {
      searchResult.addAll(sign.countries);
    } else {
      searchResult = sign.countries
          .where((c) => c.startsWith(query, localizations))
          .toList();
    }

    setState(() => _filteredList = searchResult);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) {
      return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Get.theme.brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.darkAppBg,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Column(
            children: [
              AppSizing.h28,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select Country",
                      style: AppTextStyle.h5(context)
                          .copyWith(fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left),
                  InkWell(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(Assets.assetsArrowDown))
                ],
              ),
              CustomInputField(
                fieldName: "",
                showBorder: false,
                controller: searchController,
                prefixIcon: SvgPicture.asset(Assets.assetsSearch, width: 20),
                onChange: _filterSearchResults,
              ),
              Expanded(
                child: _filteredList.isEmpty
                    ? Center(
                        child: Text(
                        "Country Not Fount",
                        style: AppTextStyle.h4Regular(context)
                            .copyWith(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ))
                    : ListView.builder(
                        itemCount: _filteredList.length,
                        itemBuilder: (context, index) => Column(
                              children: [
                                if (index == 0) AppSizing.h20,
                                InkWell(
                                    onTap: () => controller
                                        .selectCountry(_filteredList[index]),
                                    child: _buildList(
                                        _filteredList[index], context,forPhone: widget.forPhone)),
                              ],
                            )),
              ),
            ],
          ));
    });
  }
}

Widget _buildList(Country country, BuildContext context,{bool forPhone = false}) => Row(
      children: [
        _emojiText(country),
        AppSizing.w20,
        Text(
          forPhone ? "+${country.phoneCode} (${country.name}) " :country.name,
          style: AppTextStyle.h4Regular(context).copyWith(fontSize: 15),
        ),
        AppSizing.h20
      ],
    );

Widget _emojiText(Country country) => Text(
      country.iswWorldWide
          ? '\uD83C\uDF0D'
          : CountryFlagBuilder.countryCodeToEmoji(country.countryCode),
      style: const TextStyle(
        fontSize: 24,
      ),
    );
