
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

  //added by dev to hadle update quantity 
  int? productQuantity;

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
      this.productQuantity});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    unitId = json['unit_id'];
    price = json['price'];
    secondaryPrice = json['secondary_price'];
    packSize = json['pack_size'];
    stock = json['stock'];
    type = json['type'];
    categoryId = json['category_id'];
    notes = json['notes'];
    vat = json['vat'];
    status = json['status'];
    sdInv = json['sd_inv'];
    vatInv = json['vat_inv'];
    unitSupply = json['unit_supply'];
    unitSupplyQty = json['unit_supply_qty'];
    mushok64Show = json['mushok_6_4_show'];
    unitName = json['unit_name'];
    unitQty = json['unit_qty'];
    categoryName = json['category_name'];
    stockQty = json['stockQty'];
    productQuantity=0;
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
    data['stockQty'] = stockQty;
    return data;
  }



  // The copyWith method
  ProductModel copyWith({
    int? id,
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
  }) {
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
    );
  }
  
}
