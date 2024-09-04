class ProductModel {
  int? id;
  String? code;
  String? name;
  int? unitId;
  String? price;
  String? secondaryPrice;
  String? packSize;
  String? stock;
  String? type;
  int? categoryId;
  String? notes;
  String? vat;
  String? status;
  String? sdInv;
  String? vatInv;
  int? unitSupply;
  String? unitSupplyQty;
  int? mushok64Show;
  String? unitName;
  String? unitQty;
  String? categoryName;
  String? stockQty;
  TradeOfferPrimary? tradeOfferPrimary;
  //added by dev to hadle update quantity
  int? productQuantity;
  int? extravalue;

  //updated offer product;
  int? offerproductvalue;

  ProductModel(
      {this.id,
      this.code,
      this.name,
      this.unitId,
      this.price,
      this.secondaryPrice,
      this.packSize,
      this.stock,
      this.type,
      this.categoryId,
      this.notes,
      this.vat,
      this.status,
      this.sdInv,
      this.vatInv,
      this.unitSupply,
      this.unitSupplyQty,
      this.mushok64Show,
      this.unitName,
      this.unitQty,
      this.categoryName,
      this.stockQty,
      this.productQuantity,
      this.tradeOfferPrimary,
      this.extravalue,
      this.offerproductvalue});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    unitId = json['unit_id'];
    price = json['price'];
    secondaryPrice = json['secondary_price'] ?? "00.0";
    packSize = json['pack_size'] ?? "0";
    stock = json['stock'] ?? "00.0";
    type = json['type'];
    categoryId = json['category_id'];
    notes = json['notes'] ?? "";
    vat = json['vat'] ?? "";
    status = json['status'];
    sdInv = json['sd_inv'];
    vatInv = json['vat_inv'];
    unitSupply = json['unit_supply'] ?? 1;
    unitSupplyQty = json['unit_supply_qty'];
    mushok64Show = json['mushok_6_4_show'];
    unitName = json['unit_name'];
    unitQty = json['unit_qty'];
    categoryName = json['category_name'];
    stockQty = json['stockQty'];

    productQuantity = 0;
    offerproductvalue = 1;
    extravalue = 0;
    tradeOfferPrimary = json['trade_offer_primary'] != null
        ? TradeOfferPrimary.fromJson(json['trade_offer_primary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['unit_id'] = unitId;
    data['price'] = price;
    data['secondary_price'] = secondaryPrice;
    data['pack_size'] = packSize;
    data['stock'] = stock;
    data['type'] = type;
    data['category_id'] = categoryId;
    data['notes'] = notes;
    data['vat'] = vat;
    data['status'] = status;
    data['sd_inv'] = sdInv;
    data['vat_inv'] = vatInv;
    data['unit_supply'] = unitSupply;
    data['unit_supply_qty'] = unitSupplyQty;
    data['mushok_6_4_show'] = mushok64Show;
    data['unit_name'] = unitName;
    data['unit_qty'] = unitQty;
    data['category_name'] = categoryName;
    data['stockQty'] = 19.toString();
    data["productQuantity"] = productQuantity;
    data["offerproductvalue"] = offerproductvalue;
    data["extravalue"] = extravalue;
    if (this.tradeOfferPrimary != null) {
      data['trade_offer_primary'] = this.tradeOfferPrimary!.toJson();
    }
    return data;
  }

  // The copyWith method
  ProductModel copyWith(
      {int? id,
      String? code,
      String? name,
      int? unitId,
      String? price,
      String? secondaryPrice,
      String? packSize,
      String? stock,
      String? type,
      int? categoryId,
      String? notes,
      String? vat,
      String? status,
      String? sdInv,
      String? vatInv,
      int? unitSupply,
      String? unitSupplyQty,
      int? mushok64Show,
      String? unitName,
      String? unitQty,
      String? categoryName,
      String? stockQty,
      int? productQuantity,
      int? offerproductvalue,
      int? extravalue,
      TradeOfferPrimary? tradeOfferPrimary}) {
    return ProductModel(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        unitId: unitId ?? this.unitId,
        price: price ?? this.price,
        secondaryPrice: secondaryPrice ?? this.secondaryPrice,
        packSize: packSize ?? this.packSize,
        stock: stock ?? this.stock,
        type: type ?? this.type,
        categoryId: categoryId ?? this.categoryId,
        notes: notes ?? this.notes,
        vat: vat ?? this.vat,
        status: status ?? this.status,
        sdInv: sdInv ?? this.sdInv,
        vatInv: vatInv ?? this.vatInv,
        unitSupply: unitSupply ?? this.unitSupply,
        unitSupplyQty: unitSupplyQty ?? this.unitSupplyQty,
        mushok64Show: mushok64Show ?? this.mushok64Show,
        unitName: unitName ?? this.unitName,
        unitQty: unitQty ?? this.unitQty,
        categoryName: categoryName ?? this.categoryName,
        stockQty: stockQty ?? this.stockQty,
        productQuantity: productQuantity ?? this.productQuantity,
        extravalue: extravalue ?? this.extravalue,
        offerproductvalue: offerproductvalue ?? this.offerproductvalue,
        tradeOfferPrimary: tradeOfferPrimary ?? this.tradeOfferPrimary);
  }
}

class TradeOfferPrimary {
  int? id;
  int? productId;
  String? qty;
  String? offerQty;
  String? effectiveDate;
  String? endDate;
  int? status;
  int? createdBy;
  String? createdAt;
  String? updatedAt;

  TradeOfferPrimary({
    this.id,
    this.productId,
    this.qty,
    this.offerQty,
    this.effectiveDate,
    this.endDate,
    this.status,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  TradeOfferPrimary.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    qty = json['qty'];
    offerQty = json['offer_qty'];
    effectiveDate = json['effective_date'];
    endDate = json['end_date'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['qty'] = this.qty;
    data['offer_qty'] = this.offerQty;
    data['effective_date'] = this.effectiveDate;
    data['end_date'] = this.endDate;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
