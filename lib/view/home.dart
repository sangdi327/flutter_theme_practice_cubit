import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_theme_practice/components/app_font.dart';
import 'package:flutter_theme_practice/components/button.dart';
import 'package:flutter_theme_practice/components/theme_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ThemeDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              HeaderThings(),
              const SizedBox(
                height: 20,
              ),
              DescriptionThings(),
              const SizedBox(
                height: 20,
              ),
              AgreementBoxThings(),
              const SizedBox(
                height: 40,
              ),
              MyButton(
                () {},
                '시작하기',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderThings extends StatelessWidget {
  const HeaderThings({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: SvgPicture.asset(
              'assets/svg/icon_drawer.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
          ),
          Center(
            child: Image.asset('assets/image/card_image.png'),
          )
        ],
      ),
    );
  }
}

class DescriptionThings extends StatelessWidget {
  const DescriptionThings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppFont(
          '원활한 재무 관리를 위한',
          fontSize: 28,
          fontWeight: FontWeight.w100,
          letterSpacing: -0.5,
          height: 1.2,
        ),
        AppFont(
          '모바일 뱅킹',
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
          height: 1.2,
        ),
        SizedBox(
          height: 20,
        ),
        AppFont(
          '재무 워크플로를 간소화하기 위해 예산 책정 앱 및 비용 추적기와 같은 인기 있는 재무 관리 도구 및 서비스와 원활하게 통합됩니다',
          fontSize: 14,
          letterSpacing: -0.5,
          height: 1.2,
        )
      ],
    );
  }
}

class AgreementBoxThings extends StatefulWidget {
  const AgreementBoxThings({super.key});

  @override
  State<AgreementBoxThings> createState() => _AgreementBoxThingsState();
}

class _AgreementBoxThingsState extends State<AgreementBoxThings> {
  bool isCheckedTermsOfUse = false;
  bool isCheckedPrivacyPolicy = false;
  bool isCheckedMarketing = false;

  Widget agreementBox({
    required String condition,
    required bool isChecked,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              isChecked
                  ? 'assets/svg/icon_radio_on.svg'
                  : 'assets/svg/icon_radio_off.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).textTheme.labelMedium!.color!,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: AppFont(
                condition,
                color: isChecked
                    ? Theme.of(context).textTheme.labelMedium!.color
                    : const Color(0xff717171),
                fontSize: 20,
              ),
            ),
            SvgPicture.asset('assets/svg/icon_back.svg'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).cardTheme.color,
      ),
      child: Column(
        children: [
          agreementBox(
            condition: '이용약관',
            isChecked: isCheckedTermsOfUse,
            onTap: () {
              setState(() {
                isCheckedTermsOfUse = !isCheckedTermsOfUse;
              });
            },
          ),
          const Divider(
            height: 1,
          ),
          agreementBox(
            condition: '개인정보 처리방침',
            isChecked: isCheckedPrivacyPolicy,
            onTap: () {
              setState(() {
                isCheckedPrivacyPolicy = !isCheckedPrivacyPolicy;
              });
            },
          ),
          const Divider(
            height: 1,
          ),
          agreementBox(
            condition: '마케팅정보 수신 동의',
            isChecked: isCheckedMarketing,
            onTap: () {
              setState(() {
                isCheckedMarketing = !isCheckedMarketing;
              });
            },
          ),
        ],
      ),
    );
  }
}
