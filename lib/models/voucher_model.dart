class VoucherModel {
  final int? id;
  final String? title;
  final String? expired;
  final String? description;
  final String? img;
  final String? balance;
  bool isClaim = false;

  VoucherModel({
    this.id,
    this.title,
    this.expired,
    this.description,
    this.img,
    this.balance,
  });
}
