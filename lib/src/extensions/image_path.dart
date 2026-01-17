extension ImagePath on String {
  //avatars
  String get asvg => 'assets/avatars/$this.svg';

  //images
  String get svg => 'assets/images/$this.svg';
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get gif => 'assets/images/$this.gif';

  // FOR ICONS
  String get isvg => 'assets/icons/$this.svg';
  String get ipng => 'assets/icons/$this.png';
  String get ijpg => 'assets/icons/$this.jpg';
  String get igif => 'assets/icons/$this.gif';
  
  //illustrations
  String get lsvg => 'assets/illustration/$this.svg';
  String get lpng => 'assets/illustration/$this.png';
  String get ljpg => 'assets/illustration/$this.jpg';
  String get lgif => 'assets/illustration/$this.gif';

  //learn banners
  String get bjpg => 'assets/learn_banners/$this.jpg';
  String get bjpeg => 'assets/learn_banners/$this.jpeg';

  //learn icons
  String get ilsvg => 'assets/icons/learn/$this.svg';

  // tellybucks icons
  String get tbsvg => 'assets/icons/tellybucks/$this.svg';
  String get tbjpg => 'assets/icons/tellybucks/$this.jpg';
  /**
   *
   * Usage- Image.asset("home".png);
   */
}