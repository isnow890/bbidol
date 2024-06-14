import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '삐도리',
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 80, color: Colors.white),
          displayMedium: TextStyle(fontSize: 70, color: Colors.white),
          displaySmall: TextStyle(fontSize: 60, color: Colors.white),
          headlineLarge: TextStyle(fontSize: 50, color: Colors.white),
          headlineMedium: TextStyle(fontSize: 42, color: Colors.white),
          headlineSmall: TextStyle(fontSize: 35, color: Colors.white),
          titleLarge: TextStyle(fontSize: 28, color: Colors.white),
          titleMedium: TextStyle(fontSize: 23, color: Colors.white),
          titleSmall: TextStyle(fontSize: 18, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 15, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 13, color: Colors.white),
          bodySmall: TextStyle(fontSize: 11, color: Colors.white),
        ),

        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black12),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ColorTween _colorTween;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _colorTween = ColorTween(
      begin: Colors.blue,
      end: Colors.yellow,
    );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final color = _colorTween.evaluate(_controller);
            return Container(
              width: double.infinity,
              color: color,
            );
          },
        ),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(
                    vertical: BorderSide(
                  color: Colors.grey,
                )),
              ),
              child: new FooterView(
                footer: new Footer(
                  alignment: Alignment.center,
                  backgroundColor: Colors.black,

                  padding: const EdgeInsets.all(1),
                  child: TextButton(
                    onPressed: () async {
                      html.window.open('https://rottenBridge.life', 'new tab');
                    },
                    child: Text(
                      '🎃 2024 썩다리 마스터 (사이트 바로가기) 🎃',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // padding: EdgeInsets.all(5.0),
                ),

                children: <Widget>[
                  Hero(
                    tag: 'backgroundImage',
                    child: Container(
                      height: 340,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          opacity: 0.8,
                          fit: BoxFit.cover,
                          image: AssetImage('asset/tech_background.jpg'),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/bbidol.png',
                                height: 120,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.white,
                                highlightColor: Colors.black,
                                child: Text('삐도리',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '안녕하세요?',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                Text(
                                  '삐도리 다운로드 페이지 입니다.',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                var url = "http://10.20.82.56:8005/Setup.exe";
                                html.AnchorElement anchorElement =
                                    new html.AnchorElement(href: url);
                                anchorElement.download = "url";
                                anchorElement.click();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.all(20)),
                              child: Text('🗂 삐도리 다운로드 (설치)',
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                            ),

                          ],
                        ),
                        const Divider(
                          height: 30,
                        ),
                        _renderTitle(context, '삐도리는..'),
                        _renderProgramList(
                            'emr 켜서 들어가기 넘나 귀찮아서 걍 날로 먹을라고 만든 프로그램 짜집기 용도입니다.\n  전 emr을 자주 사용하진, 않지만 어쩔수 없이 쓸 수 밖에 없는 프로그램들만 몇개 모아두었습니다.',
                            context),
                        _renderTitle(context, '스크린샷 (클릭해도 안커짐 로직 구현 안함.)'),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          'asset/bbidol_image1.png',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Image.asset(
                          'asset/bbidol_image2.png',
                        ),
                        _renderTitle(
                            context, '사용할 수 있는 프로그램들 (귀찮음의 여부에 따라 늘어날 수 있음)'),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Table(
                              columnWidths: {
                                0: FixedColumnWidth(
                                    MediaQuery.of(context).size.width < 700
                                        ? 100.0
                                        : 200.0),
                                1: FixedColumnWidth(
                                    MediaQuery.of(context).size.width < 700
                                        ? 300.0
                                        : 400.0),
                              },
                              border: TableBorder.all(),
                              children: [
                                TableRow(
                                  children: [
                                    _renderTableCell('분류', context, true),
                                    _renderTableCell('프로그램명', context, true),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _renderTableCell('전산당직', context, false),
                                    _renderTableCell('전산당직', context, false),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _renderTableCell('합본', context, false),
                                    _renderTableCell('합본프로그램', context, false),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _renderTableCell('인사', context, false),
                                    _renderTableCell(
                                        '휴가쓰는 프로그램', context, false),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _renderTableCell('WMS', context, false),
                                    _renderTableCell('SR요청관리', context, false),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _renderTableCell('WMS', context, false),
                                    _renderTableCell('주간보고', context, false),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _renderTableCell('WMS', context, false),
                                    _renderTableCell(
                                        '반영요청-모델/META', context, false),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _renderTableCell('WMS', context, false),
                                    _renderTableCell(
                                        '반영요청-튜닝/인덱스', context, false),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _renderTableCell('WMS', context, false),
                                    _renderTableCell(
                                        '반영요청-소스/권한', context, false),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _renderTableCell('WMS', context, false),
                                    _renderTableCell(
                                        '반영요청-컴파일/EQS', context, false),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _renderTableCell('WMS', context, false),
                                    _renderTableCell(
                                        '반영요청-DLL/REB 배포', context, false),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        _renderTitle(context, '그 밖에..'),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      html.window.open(
                                          'https://rottenBridge.life',
                                          'new tab');
                                    },
                                    child: Text(
                                      '- 🎉🎊🎃썩다리의 삶 (https://rottenbridge.life) 식단을 볼 수 잇음',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: Colors.black,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ], //default flex is 2
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

_renderProgramList(name, context) {
  return Column(
    children: [
      const SizedBox(
        height: 5,
      ),
      Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              '- ${name}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
        ],
      )
    ],
  );
}

_renderTableCell(name, context, reverse) {
  return TableCell(
    child: Container(
      padding: EdgeInsets.all(8.0),
      color: reverse == true ? Colors.black : null,
      child: Center(
        child: Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: reverse == true ? null : Colors.black,
                fontWeight: reverse == true ? FontWeight.bold : null,
              ),
        ),
      ),
    ),
  );
}

_renderTitle(context, name) {
  return Column(
    children: [
      const SizedBox(
        height: 20,
      ),
      Text(
        '📌 ${name}',
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
      )
    ],
  );
}
