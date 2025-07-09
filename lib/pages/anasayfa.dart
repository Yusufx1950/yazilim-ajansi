import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okanyazilim2/my_scaffold/my_app_bar.dart';
import 'package:okanyazilim2/my_scaffold/my_boottom_menu.dart';
import 'package:okanyazilim2/my_widget/ince_cizgi.dart';
import 'package:okanyazilim2/my_widget/my_calisma_seklimiz.dart';
import 'package:okanyazilim2/my_widget/my_icon_button.dart';
import 'package:okanyazilim2/my_widget/my_image_card.dart';
import 'package:okanyazilim2/my_widget/my_material_button.dart';
import 'package:okanyazilim2/my_widget/my_text.dart';

import '../generated/assets.dart';

class Anasayfa extends StatefulWidget {
  Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Color Cardcolor = Color.fromRGBO(245, 245, 247, 0.96);
  Color _Baslikcolor = Colors.blueAccent.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: MyAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return weblayout();
        },
      ),
    );
  }

  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    _timer = Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (_currentPage < slayts().length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget weblayout() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(Assets.assetsArkaplanboya),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: hizmetlerimiz4(),
                      ),
                    ],
                  ),

                  Container(
                    height: Get.height - 100,
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyIconButton(
                          boyut: 50,
                          onPressed: () {
                            if (_currentPage > 0 &&
                                _currentPage <= slayts().length) {
                              _currentPage--;
                            } else {
                              _currentPage = slayts().length - 1;
                            }
                            _pageController.animateToPage(
                              _currentPage,
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeInOut,
                            );
                          },
                          icon: Icons.arrow_back_ios_new_outlined,
                        ),
                        Container(
                          height: Get.height - 100,
                          width: Get.width - 200,
                          child: PageView(
                            controller: _pageController,
                            children: slayts(),
                          ),
                        ),
                        MyIconButton(
                          boyut: 50,
                          onPressed: () {
                            if (_currentPage < slayts().length) {
                              _currentPage++;
                            } else {
                              _currentPage = 0;
                            }
                            _pageController.animateToPage(
                              _currentPage,
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeInOut,
                            );
                          },
                          icon: Icons.arrow_forward_ios_rounded,
                        ),
                      ],
                    ),
                  ),

                  InceCizgi(),
                  Container(child: Pankartlar()),
                  InceCizgi(),
                  CalismaSeklimiz(),
                ],
              ),
            ),

            MyBoottomMenu(),
          ],
        ),
      ),
    );
  }

  List<Widget> slayts() {
    return [
      slyatWidget(
        "Fikirden Fonksiyona,\nSatır Satır Değer Üretim",
        "Yazılım geliştirme, bir problemi çözmenin en somut yoludur. Kod yazmak; yalnızca teknolojik bir işlem değil, aynı zamanda fikirlerin işlevsel hâle getirildiği yaratıcı bir süreçtir. Biz geliştirmeyi sadece bir hizmet olarak değil, müşterilerimizin vizyonunu teknolojiyle buluşturduğumuz bir yolculuk olarak görüyoruz.",
        Assets.assetsGelistirme,
      ),
      slyatWidget(
        "Yazılımda Güvenlik:\nKoruma, Süreklilik ve Güven İnşası",
        "Dijital çözümler geliştirmek, aynı zamanda sorumluluk almak demektir. Her kod satırı, sadece bir fonksiyon değil; aynı zamanda bir güvenlik testi, bir veri sınavı ve bir etik manifestosudur. Biz güvenliği yalnızca bir teknik gereklilik değil, bir işletme kültürü olarak benimsiyoruz.",
        Assets.assetsGuvenlik,
      ),
      slyatWidget(
        "Algının Kodlandığı,\nGüvenin İnşa Edildiği Sanal Kimlik",
        "Dijital dünyada var olmak artık sadece teknik bir altyapıya sahip olmakla sınırlı değil—aynı zamanda bir karaktere, bir duruşa ve tanınabilir bir kimliğe sahip olmakla ilgili. Dijital kimlik; markanın görünürlüğü, mesaj dili, görsel estetiği ve sistemsel güvenliğiyle oluşturulan bütünsel bir varlıktır. Biz bu kimliği sadece ekranlarda değil, kullanıcıların zihninde inşa ederiz.",
        Assets.assetsKimlik,
      ),
      slyatWidget(
        "Kurumsal Yapılanma:\nSüreklilik,\nGüven ve Ölçeklenebilir\nBaşarı İçin Stratejik Temel",
        "Bir fikrin marka olabilmesi, bir hizmetin sürdürülebilir değer üretebilmesi için sağlam bir kurumsal iskelete ihtiyaç vardır. Kurumsal yapılanma; ekiplerin tanımı, süreçlerin netliği, iş kültürünün oluşturulması ve marka kimliğinin içsel olarak benimsenmesini sağlar. Bu yapı, teknik başarının operasyonel derinlikle desteklenmesini mümkün kılar.",
        Assets.assetsKurumsal,
      ),
      slyatWidget(
        "Otomasyon ve İşlevsellik:\nZamanı Kodla Kontrol Etmek,\nSüreci Akıllıca Yönetmek",
        "Günümüz dijital dünyasında hız, tutarlılık ve kullanıcı memnuniyeti; ancak akıllı sistemlerle mümkün olur. Otomasyon, manuel tekrarlardan kurtulmanın ve insan kaynaklarını daha stratejik alanlara yönlendirmenin anahtarıdır. İşlevsellik ise geliştirilen ürünlerin sadece çalışması değil; etkili, erişilebilir ve sürdürülebilir olmasıdır.",
        Assets.assetsSeyahat,
      ),
    ];
  }

  Widget slyatWidget(String baslik, String metin, String image) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextBaslik(text: baslik),
                Container(
                  width: 300,
                  child: SingleChildScrollView(
                    child: MyText(FontSize: 20, text: metin),
                  ),
                ),
              ],
            ),
          ),
          Flexible(flex: 1, child: MyImageCard(asset: image)),
        ],
      ),
    );
  }

  Widget hizmetlerimiz4() {
    return Container(
      width: Get.width,
      height: Get.height - 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cardItem(
                "Mobil Uygulama",
                "Zarif Tasarım Ve Son Derece Hızlı.",
                Assets.assetsSeyahat,
                0,
              ),
              cardItem(
                "Web Uygulama",
                "Modern Tasarım ve Ödeme Entegrasyonu.",
                Assets.assetsKurumsal,
                1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cardItem(
                "Masaüstü platformu",
                "İhtiyacınız Olan Otomasyon Sistemleri İçin İdeal Ajans.",
                Assets.assetsKimlik,
                2,
              ),
              cardItem(
                "Siber Güvenlikk",
                "Uygulama güvenliği her zaman ön plandadır.",
                Assets.assetsGuvenlik,
                3,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 5,
                ),
                child: MyMaterialButton(
                  text: "Şimdi Başla ->",
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 5,
                ),
                child: MyMaterialButton(
                  text: "Çalışma Düzeni",
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget cardItem(String baslik, String metin, String image, int konum) {
    List<ShapeBorder> borders = [
      OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(0),
        ),
      ),
      OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(0),
          topRight: Radius.circular(20),
        ),
      ),
      OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
    ];

    return Card(
      color: Colors.white,
      elevation: 15,
      shape: borders[konum],
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Column(
              children: [
                MyTextBaslik(text: baslik),
                MyText(text: metin),
              ],
            ),
            Image.asset(height: 150, width: 150, image),
          ],
        ),
      ),
    );
  }

  Widget Pankartlar() {
    double _elevation = 0;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: MyTextBaslik(
            FontSize: 40,
            text: "Hizmetlerimiz",
            renk: _Baslikcolor,
            Font: FontWeight.w900,
          ),
        ),
        Card(
          color: Cardcolor,
          shape: OutlineInputBorder().copyWith(
            borderSide: BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(0),
          ),
          elevation: _elevation,
          child: Container(
            height: 600,
            width: 1200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextBaslik(FontSize: 70, text: "WEB \nTASARIM"),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: MyText(
                            FontSize: 25,
                            text:
                                "Web Tasarım – Dijital Varlığınızın Temel Taşı\n"
                                "Okan Yazılım Ajansı olarak,\n"
                                "markanızın dijital yüzünü modern, kullanıcı dostu ve\n"
                                "mobil uyumlu web tasarımlarla inşa ediyoruz.\n"
                                "Estetikle işlevselliği birleştiriyor,-\n"
                                "ziyaretçilerinizi müşteriye dönüştüren-\n"
                                "akıllı arayüzler tasarlıyoruz.\n"
                                "Çünkü iyi bir web sitesi sadece görünmez, çalışır.",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(Assets.assetsLogosiyah),
                  ),
                ),
              ],
            ),
          ),
        ),

        PankartMetin(
          "Dijital Dünyanın İlk İzlenimi",
          "saniyeler içinde şekillenir. Bu yüzden web siten sadece görsel olarak çarpıcı değil, aynı zamanda kullanıcıya sorunsuz ve sezgisel bir deneyim sunmalıdır. Biz, markanın ruhunu dijital ortama taşırken; estetikle işlevselliği bir arada sunuyor, her tasarımı bir stratejiyle örüyoruz.Responsive tasarım ile tüm cihazlarda tutarlı görünüm, SEO dostu yapılarla maksimum görünürlük ve hızlı yüklenme ile kullanıcı memnuniyeti—hepsi tasarımın temel taşlarıdır. Her web projemizde, kullanıcı davranışlarını analiz ediyor, kullanıcı arayüzlerini hikâyeye dönüştürüyoruz. Çünkü iyi bir tasarım, yalnızca güzel görünmekle kalmaz; ziyaretçiyi harekete geçirir, markaya bağlar, güven yaratır.Bir satır kodun, bir fikirle buluştuğu yerde biz varız. Sen hayalini kur, biz tasarımıyla hayat verelim.",
        ),
        Card(
          color: Cardcolor,
          shape: OutlineInputBorder().copyWith(
            borderSide: BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(0),
          ),
          elevation: _elevation,
          child: Container(
            height: 600,
            width: 1200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextBaslik(
                          Font: FontWeight.bold,
                          FontSize: 60,
                          text: "MARKALAŞMA \nSTRATEJİSİ",
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: MyText(
                            FontSize: 25,
                            text:
                                "Markalaşma Stratejisi – Fikrinizi Kimliğe Dönüştürün\n"
                                "Okan Yazılım Ajansı olarak, markanızı sadece görünür değil,\n"
                                "unutulmaz kılacak stratejiler geliştiriyoruz.\n"
                                "Hedef kitlenizi tanıyor, rakiplerinizi analiz ediyor ve\n"
                                "sizi farklılaştıracak özgün bir marka kimliği inşa ediyoruz.\n"
                                "Çünkü güçlü bir marka, sadece bir logo değil;\n"
                                "bir duruş, bir deneyimdir.",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(Assets.assetsLogosiyah),
                  ),
                ),
              ],
            ),
          ),
        ),

        PankartMetin(
          "Teknolojiyle Şekillenen, Güvenle Büyüyen Bir Marka Kimliği",
          "Markalaşma, yalnızca bir logo veya slogan değil; bir hissin, güvenin ve vaadin dijital evrende temsilidir. Bizim stratejimiz, işletmenizin teknik gücünü sadece anlatmak değil, hissettirmek üzerine kurulu. Çünkü yazılım üretmek bir beceri, ancak marka yaratmak bir duruştur.",
        ),
        Card(
          color: Cardcolor,
          shape: OutlineInputBorder().copyWith(
            borderSide: BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(0),
          ),
          elevation: _elevation,
          child: Container(
            height: 600,
            width: 1200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: MyText(
                            FontSize: 25,
                            text:
                                "İçerik Geliştirme – Mesajınızı Güçlü\n"
                                "Bir Hikâyeye Dönüştürün Okan Yazılım Ajansı \n"
                                "olarak,markanızın dijital dünyada\n"
                                "sesini duyuracak içerikler üretiyoruz.\n"
                                "Blog yazılarından sosyal medya metinlerine,\n"
                                "ürün açıklamalarından SEO uyumlu sayfa içeriklerine\n"
                                "kadar her kelimeyi stratejik bir amaçla kurguluyoruz.\n"
                                "Çünkü bizce içerik, sadece yazı değil;\n"
                                "bir markanın dijital kimliğidir.",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          flex: 1,
                          child: MyTextBaslik(
                            Font: FontWeight.bold,
                            FontSize: 75,
                            text: "\t\t\t\t\t\t\t\t\t\t\tİÇERİK\nGELİŞTİRME",
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Image.asset(Assets.assetsLogosiyah),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        PankartMetin(
          "Hikâyeyi Stratejiye, Kelimeyi Eyleme Dönüştürmek",
          "Günümüzde içerik, sadece bilgilendirme aracı değil—dijital varlığın, markanın ve değerlerinin sürdürülebilir şekilde inşasında temel taşıdır. İyi bir içerik; doğru tonu, etkili yapıyı ve anlamı bir araya getirerek hedef kitlenin zihninde yer edinir. Biz içerik üretimini, algoritmalara göre değil, insanlara dokunarak tasarlıyoruz.",
        ),
        Card(
          color: Cardcolor,
          shape: OutlineInputBorder().copyWith(
            borderSide: BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(0),
          ),
          elevation: _elevation,
          child: Container(
            height: 600,
            width: 1200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 4,
                      ),
                      child: MyTextBaslik(
                        Font: FontWeight.bold,
                        FontSize: 50,
                        text:
                            "ÜRÜN\n"
                            "PAZARLAMA",
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(Assets.assetsLogosiyah),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(Assets.assetsLogosiyah),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: MyText(
                            FontSize: 25,
                            text:
                                "Ürün Pazarlama – Fikri Değere\n"
                                "Değeri Kazanca Dönüştür.\n"
                                "Okan Yazılım Ajansı olarak,"
                                "\nsadece ürünleri değil,onların arkasındaki\n"
                                "vizyonu da pazarlıyoruz.\n"
                                "Hedef kitlenizi analiz ediyor,\n"
                                "ürününüzü doğru konumlandırıyor ve\n"
                                "dijital dünyada görünür kılacak\n"
                                "stratejiler geliştiriyoruz.\n"
                                "Her ürün bir hikâyedir; biz o\n"
                                "hikâyeyi müşterinizin zihnine kazırız.",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        PankartMetin(
          "Koddan Hikâyeye, Hikâyeden Etkiye",
          "Bir ürün geliştirildiğinde yalnızca teknik bir başarı değil, aynı zamanda potansiyel bir çözüm doğar. Bu çözümün hedef kitleye ulaşması ise akıllı ve stratejik bir pazarlama süreci gerektirir. Ürün pazarlama; ihtiyaç analizi, doğru konumlandırma, etkileyici iletişim ve güven oluşturmadan oluşan bütünsel bir yaklaşım ister. Biz bu süreci algoritmalarla değil, içgörüyle tasarlıyoruz.",
        ),
        Card(
          color: Cardcolor,
          shape: OutlineInputBorder().copyWith(
            borderSide: BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(0),
          ),
          elevation: _elevation,
          child: Container(
            height: 600,
            width: 1200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Flexible(
                          flex: 1,
                          child: MyTextBaslik(
                            Font: FontWeight.bold,
                            FontSize: 60,
                            text: "GRAFİK\nTASARIM",
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(Assets.assetsLogosiyah),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(Assets.assetsLogosiyah),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: MyText(
                              FontSize: 25,
                              text:
                                  "Grafik Tasarım – Markanızı Görselleştirin\n"
                                  "Okan Yazılım Ajansı olarak grafik tasarımı,\n"
                                  "markanızın ruhunu yansıtan görsel çözümlere\n"
                                  "dönüştürüyoruz. Logo, afiş, sosyal medya içeriği ve\n"
                                  "UI tasarımlarında estetikle işlevselliği buluşturuyor;\n"
                                  "sizi rakiplerinizden ayıran\n"
                                  "güçlü bir görsel kimlik oluşturuyoruz.",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        PankartMetin(
          "Görselliğin Gücüyle Anlatılan Marka Hikâyesi",
          "Her çizgi bir mesaj taşır, her renk bir duyguyu yansıtır. Grafik tasarım sadece estetik yaratmak değil—markanın düşünce biçimini, değerlerini ve iletişim tonunu görselleştirmektir. Biz tasarımı yalnızca güzel görünmek için değil; etkili olmak, fark edilmek ve hatırlanmak için kullanırız.",
        ),
      ],
    );
  }

  Widget PankartMetin(String baslik, String icerik) {
    return Container(
      width: 1200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: Column(
          children: [
            InceGradiantCizgi(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 0,
              ),
              child: MyTextBaslik(text: baslik, renk: _Baslikcolor),
            ),
            InceGradiantCizgi(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 0,
              ),
              child: MyText(FontSize: 20, text: icerik),
            ),
          ],
        ),
      ),
    );
  }

  Widget CalismaSeklimiz() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Wrap(
        spacing: 8, // Kartlar arası yatay boşluk
        runSpacing: 8, // Satırlar arası dikey boşluk
        children: List.generate(8, (index) {
          return MyCalismaSeklimiz();
        }),
      ),
    );
  }
}
