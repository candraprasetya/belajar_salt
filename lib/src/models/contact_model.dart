part of 'models.dart';

//Nama Model mengugnakan UpperCamelCase
class ContactModel {
  //Nama Property menggunakan lowerCamelCase
  final String name;
  final String imageUrl;
  final String phone;

  ContactModel(this.name, this.imageUrl, this.phone);
}

List<ContactModel> contacts = [
  ContactModel(
      'Maudy Ayunda',
      'https://disk.mediaindonesia.com/thumbs/1800x1200/news/2022/04/20720340df7292e525b8b72ab3c7a980.JPG',
      '+628745676454'),
  ContactModel(
      'Mawar Eva De Jongh',
      'https://parboaboa.com/data/foto_berita/mawar-de-jongh.webp',
      '+628123456789'),
  ContactModel(
      'Keisya Levronka',
      'https://assets.promediateknologi.com/crop/0x0:0x0/x/photo/2022/04/27/794247958.jpg',
      '+628745676454'),
  ContactModel(
      'Kimberly',
      'https://docplayer.info/docs-images/95/123698131/images/58-1.jpg',
      '+628745676454'),
  ContactModel(
      'Pevita Pearce',
      'https://img.okezone.com/content/2022/03/07/33/2557815/biodata-dan-agama-pevita-pearce-artis-cantik-berkelas-yang-dikira-pindah-hindu-vUjsYUR2IQ.jpg',
      '+628745676454'),
  ContactModel(
      'Wulan Guritno',
      'https://asset-a.grid.id/crop/0x0:0x0/945x630/photo/2022/02/14/20201122042404jpg-20220214022803.jpg',
      '+628745676454'),
  ContactModel(
      'Aril Tatum',
      'https://assets.promediateknologi.com/crop/0x0:0x0/750x500/photo/hops/2020/08/capture-20200830-213833.png',
      '+628745676454'),
  ContactModel(
      'Yuki Kato',
      'https://cdn-2.tstatic.net/wartakota/foto/bank/images/yukikato.jpg',
      '+628745676454'),
  ContactModel(
      'Mikha Tambahyong',
      'https://akcdn.detik.net.id/api/wm/2020/08/15/potret-cantik-mikha-tambayong-makin-glowing-dan-bersinar_169.jpeg',
      '+628745676454'),
  ContactModel(
      'Michelle Ziudith',
      'https://img.inews.co.id/media/822/files/inews_new/2022/03/16/michelle_ziudith.jpg',
      '+628745676454'),
];
