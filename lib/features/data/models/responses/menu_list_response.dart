import 'dart:convert';

MenuListResponse menuListResponseFromJson(String str) =>
    MenuListResponse.fromJson(json.decode(str));

String menuListResponseToJson(MenuListResponse data) =>
    json.encode(data.toJson());

class MenuListResponse {
  final bool status;
  final MenuResult? result;

  MenuListResponse({
    required this.status,
    this.result,
  });

  factory MenuListResponse.fromJson(Map<String, dynamic> json) =>
      MenuListResponse(
        status: json["Status"],
        result:
            json["Result"] == null ? null : MenuResult.fromJson(json["Result"]),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Result": result?.toJson(),
      };
}

class MenuResult {
  final List<Menu>? menu;
  final List<Category>? categories;
  final List<Item>? items;
  final List<ModifierGroup>? modifierGroups;

  MenuResult({
    this.menu,
    this.categories,
    this.items,
    this.modifierGroups,
  });

  factory MenuResult.fromJson(Map<String, dynamic> json) => MenuResult(
        menu: json["Menu"] == null
            ? []
            : List<Menu>.from(json["Menu"]!.map((x) => Menu.fromJson(x))),
        categories: json["Categories"] == null
            ? []
            : List<Category>.from(
                json["Categories"]!.map((x) => Category.fromJson(x))),
        items: json["Items"] == null
            ? []
            : List<Item>.from(json["Items"]!.map((x) => Item.fromJson(x))),
        modifierGroups: json["ModifierGroups"] == null
            ? []
            : List<ModifierGroup>.from(
                json["ModifierGroups"]!.map((x) => ModifierGroup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Menu": menu == null
            ? []
            : List<dynamic>.from(menu!.map((x) => x.toJson())),
        "Categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "Items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "ModifierGroups": modifierGroups == null
            ? []
            : List<dynamic>.from(modifierGroups!.map((x) => x.toJson())),
      };
}

class Category {
  final String? id;
  final String? menuCategoryId;
  final String? menuId;
  final String? storeId;
  final SubTitle? title;
  final SubTitle? subTitle;
  final List<MenuEntity>? menuEntities;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? createdBy;
  final String? modifiedBy;

  Category({
    this.id,
    this.menuCategoryId,
    this.menuId,
    this.storeId,
    this.title,
    this.subTitle,
    this.menuEntities,
    this.createdDate,
    this.modifiedDate,
    this.createdBy,
    this.modifiedBy,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["ID"],
        menuCategoryId: json["MenuCategoryID"],
        menuId: json["MenuID"],
        storeId: json["StoreID"],
        title: json["Title"] == null ? null : SubTitle.fromJson(json["Title"]),
        subTitle: json["SubTitle"] == null
            ? null
            : SubTitle.fromJson(json["SubTitle"]),
        menuEntities: json["MenuEntities"] == null
            ? []
            : List<MenuEntity>.from(
                json["MenuEntities"]!.map((x) => MenuEntity.fromJson(x))),
        createdDate: json["CreatedDate"] == null
            ? null
            : DateTime.parse(json["CreatedDate"]),
        modifiedDate: json["ModifiedDate"] == null
            ? null
            : DateTime.parse(json["ModifiedDate"]),
        createdBy: json["CreatedBy"],
        modifiedBy: json["ModifiedBy"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "MenuCategoryID": menuCategoryId,
        "MenuID": menuId,
        "StoreID": storeId,
        "Title": title?.toJson(),
        "SubTitle": subTitle?.toJson(),
        "MenuEntities": menuEntities == null
            ? []
            : List<dynamic>.from(menuEntities!.map((x) => x.toJson())),
        "CreatedDate": createdDate?.toIso8601String(),
        "ModifiedDate": modifiedDate?.toIso8601String(),
        "CreatedBy": createdBy,
        "ModifiedBy": modifiedBy,
      };
}

class MenuEntity {
  final String? id;
  final String? type;

  MenuEntity({
    this.id,
    this.type,
  });

  factory MenuEntity.fromJson(Map<String, dynamic> json) => MenuEntity(
        id: json["ID"],
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Type": type,
      };
}

class SubTitle {
  final String? en;

  SubTitle({
    this.en,
  });

  factory SubTitle.fromJson(Map<String, dynamic> json) => SubTitle(
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
      };
}

class Item {
  final String? id;
  final String? menuItemId;
  final String? storeId;
  final SubTitle? title;
  final SubTitle? description;
  final String? imageUrl;
  final PriceInfo? priceInfo;
  final String? externalData;
  final Quantity? quantityInfo;
  final SuspensionRules? suspensionRules;
  final ModifierGroupRules? modifierGroupRules;
  final RewardGroupRules? rewardGroupRules;
  final TaxInfo? taxInfo;
  final int? aggregatedProductRating;
  final int? totalReviews;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final NutrientData? nutrientData;
  final DishInfo? dishInfo;
  final VisibilityInfo? visibilityInfo;
  final ProductInfo? productInfo;
  final BeverageInfo? beverageInfo;
  final List<String>? categoryIDs;
  final List<dynamic>? allergens;
  final MetaData? metaData;

  Item({
    this.id,
    this.menuItemId,
    this.storeId,
    this.title,
    this.description,
    this.imageUrl,
    this.priceInfo,
    this.externalData,
    this.quantityInfo,
    this.suspensionRules,
    this.modifierGroupRules,
    this.rewardGroupRules,
    this.taxInfo,
    this.aggregatedProductRating,
    this.totalReviews,
    this.createdDate,
    this.modifiedDate,
    this.nutrientData,
    this.dishInfo,
    this.visibilityInfo,
    this.productInfo,
    this.beverageInfo,
    this.categoryIDs,
    this.allergens,
    this.metaData,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["ID"],
        menuItemId: json["MenuItemID"],
        storeId: json["StoreID"],
        title: json["Title"] == null ? null : SubTitle.fromJson(json["Title"]),
        description: json["Description"] == null
            ? null
            : SubTitle.fromJson(json["Description"]),
        imageUrl: json["ImageURL"],
        priceInfo: json["PriceInfo"] == null
            ? null
            : PriceInfo.fromJson(json["PriceInfo"]),
        externalData: json["ExternalData"],
        quantityInfo: json["QuantityInfo"] == null
            ? null
            : Quantity.fromJson(json["QuantityInfo"]),
        suspensionRules: json["SuspensionRules"] == null
            ? null
            : SuspensionRules.fromJson(json["SuspensionRules"]),
        modifierGroupRules: json["ModifierGroupRules"] == null
            ? null
            : ModifierGroupRules.fromJson(json["ModifierGroupRules"]),
        rewardGroupRules: json["RewardGroupRules"] == null
            ? null
            : RewardGroupRules.fromJson(json["RewardGroupRules"]),
        taxInfo:
            json["TaxInfo"] == null ? null : TaxInfo.fromJson(json["TaxInfo"]),
        aggregatedProductRating: json["AggregatedProductRating"],
        totalReviews: json["TotalReviews"],
        createdDate: json["CreatedDate"] == null
            ? null
            : DateTime.parse(json["CreatedDate"]),
        modifiedDate: json["ModifiedDate"] == null
            ? null
            : DateTime.parse(json["ModifiedDate"]),
        nutrientData: json["NutrientData"] == null
            ? null
            : NutrientData.fromJson(json["NutrientData"]),
        dishInfo: json["DishInfo"] == null
            ? null
            : DishInfo.fromJson(json["DishInfo"]),
        visibilityInfo: json["VisibilityInfo"] == null
            ? null
            : VisibilityInfo.fromJson(json["VisibilityInfo"]),
        productInfo: json["ProductInfo"] == null
            ? null
            : ProductInfo.fromJson(json["ProductInfo"]),
        beverageInfo: json["BeverageInfo"] == null
            ? null
            : BeverageInfo.fromJson(json["BeverageInfo"]),
        categoryIDs: json["CategoryIDs"] == null
            ? []
            : List<String>.from(json["CategoryIDs"]!.map((x) => x)),
        allergens: json["Allergens"] == null
            ? []
            : List<dynamic>.from(json["Allergens"]!.map((x) => x)),
        metaData: json["MetaData"] == null
            ? null
            : MetaData.fromJson(json["MetaData"]),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "MenuItemID": menuItemId,
        "StoreID": storeId,
        "Title": title?.toJson(),
        "Description": description?.toJson(),
        "ImageURL": imageUrl,
        "PriceInfo": priceInfo?.toJson(),
        "ExternalData": externalData,
        "QuantityInfo": quantityInfo?.toJson(),
        "SuspensionRules": suspensionRules?.toJson(),
        "ModifierGroupRules": modifierGroupRules?.toJson(),
        "RewardGroupRules": rewardGroupRules?.toJson(),
        "TaxInfo": taxInfo?.toJson(),
        "AggregatedProductRating": aggregatedProductRating,
        "TotalReviews": totalReviews,
        "CreatedDate": createdDate?.toIso8601String(),
        "ModifiedDate": modifiedDate?.toIso8601String(),
        "NutrientData": nutrientData?.toJson(),
        "DishInfo": dishInfo?.toJson(),
        "VisibilityInfo": visibilityInfo?.toJson(),
        "ProductInfo": productInfo?.toJson(),
        "BeverageInfo": beverageInfo?.toJson(),
        "CategoryIDs": categoryIDs == null
            ? []
            : List<dynamic>.from(categoryIDs!.map((x) => x)),
        "Allergens": allergens == null
            ? []
            : List<dynamic>.from(allergens!.map((x) => x)),
        "MetaData": metaData?.toJson(),
      };
}

class BeverageInfo {
  final int? caffeineAmount;
  final int? alcoholbyVolume;

  BeverageInfo({
    this.caffeineAmount,
    this.alcoholbyVolume,
  });

  factory BeverageInfo.fromJson(Map<String, dynamic> json) => BeverageInfo(
        caffeineAmount: json["CaffeineAmount"],
        alcoholbyVolume: json["AlcoholbyVolume"],
      );

  Map<String, dynamic> toJson() => {
        "CaffeineAmount": caffeineAmount,
        "AlcoholbyVolume": alcoholbyVolume,
      };
}

class DishInfo {
  final Classifications? classifications;

  DishInfo({
    this.classifications,
  });

  factory DishInfo.fromJson(Map<String, dynamic> json) => DishInfo(
        classifications: json["Classifications"] == null
            ? null
            : Classifications.fromJson(json["Classifications"]),
      );

  Map<String, dynamic> toJson() => {
        "Classifications": classifications?.toJson(),
      };
}

class Classifications {
  final bool? canServeAlone;
  final bool? isVegetarian;
  final int? alcoholicItem;
  final List<dynamic>? dietaryLabelInfo;
  final String? instructionsForUse;
  final List<dynamic>? ingredients;
  final List<dynamic>? additives;
  final String? preparationType;
  final FoolBusinessOperator? foolBusinessOperator;
  final bool? isHighFatSaltSugar;
  final bool? isHalal;
  final int? spiceLevel;

  Classifications({
    this.canServeAlone,
    this.isVegetarian,
    this.alcoholicItem,
    this.dietaryLabelInfo,
    this.instructionsForUse,
    this.ingredients,
    this.additives,
    this.preparationType,
    this.foolBusinessOperator,
    this.isHighFatSaltSugar,
    this.isHalal,
    this.spiceLevel,
  });

  factory Classifications.fromJson(Map<String, dynamic> json) =>
      Classifications(
        canServeAlone: json["CanServeAlone"],
        isVegetarian: json["IsVegetarian"],
        alcoholicItem: json["AlcoholicItem"],
        dietaryLabelInfo: json["DietaryLabelInfo"] == null
            ? []
            : List<dynamic>.from(json["DietaryLabelInfo"]!.map((x) => x)),
        instructionsForUse: json["InstructionsForUse"],
        ingredients: json["Ingredients"] == null
            ? []
            : List<dynamic>.from(json["Ingredients"]!.map((x) => x)),
        additives: json["Additives"] == null
            ? []
            : List<dynamic>.from(json["Additives"]!.map((x) => x)),
        preparationType: json["PreparationType"],
        foolBusinessOperator: json["FoolBusinessOperator"] == null
            ? null
            : FoolBusinessOperator.fromJson(json["FoolBusinessOperator"]),
        isHighFatSaltSugar: json["IsHighFatSaltSugar"],
        isHalal: json["IsHalal"],
        spiceLevel: json["SpiceLevel"],
      );

  Map<String, dynamic> toJson() => {
        "CanServeAlone": canServeAlone,
        "IsVegetarian": isVegetarian,
        "AlcoholicItem": alcoholicItem,
        "DietaryLabelInfo": dietaryLabelInfo == null
            ? []
            : List<dynamic>.from(dietaryLabelInfo!.map((x) => x)),
        "InstructionsForUse": instructionsForUse,
        "Ingredients": ingredients == null
            ? []
            : List<dynamic>.from(ingredients!.map((x) => x)),
        "Additives": additives == null
            ? []
            : List<dynamic>.from(additives!.map((x) => x)),
        "PreparationType": preparationType,
        "FoolBusinessOperator": foolBusinessOperator?.toJson(),
        "IsHighFatSaltSugar": isHighFatSaltSugar,
        "IsHalal": isHalal,
        "SpiceLevel": spiceLevel,
      };
}

class FoolBusinessOperator {
  final String? name;
  final String? address;

  FoolBusinessOperator({
    this.name,
    this.address,
  });

  factory FoolBusinessOperator.fromJson(Map<String, dynamic> json) =>
      FoolBusinessOperator(
        name: json["Name"],
        address: json["Address"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Address": address,
      };
}

class MetaData {
  final String? productId;
  final String? productName;
  final String? unitChartId;
  final String? unitChartName;
  final String? dealProductId;
  final bool? isDealProduct;

  MetaData({
    this.productId,
    this.productName,
    this.unitChartId,
    this.unitChartName,
    this.dealProductId,
    this.isDealProduct,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        productId: json["ProductID"],
        productName: json["ProductName"],
        unitChartId: json["UnitChartID"],
        unitChartName: json["UnitChartName"],
        dealProductId: json["DealProductID"],
        isDealProduct: json["IsDealProduct"],
      );

  Map<String, dynamic> toJson() => {
        "ProductID": productId,
        "ProductName": productName,
        "UnitChartID": unitChartId,
        "UnitChartName": unitChartName,
        "DealProductID": dealProductId,
        "IsDealProduct": isDealProduct,
      };
}

class ModifierGroupRules {
  final List<String>? iDs;
  final List<dynamic>? overrides;

  ModifierGroupRules({
    this.iDs,
    this.overrides,
  });

  factory ModifierGroupRules.fromJson(Map<String, dynamic> json) =>
      ModifierGroupRules(
        iDs: json["IDs"] == null
            ? []
            : List<String>.from(json["IDs"]!.map((x) => x)),
        overrides: json["Overrides"] == null
            ? []
            : List<dynamic>.from(json["Overrides"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "IDs": iDs == null ? [] : List<dynamic>.from(iDs!.map((x) => x)),
        "Overrides": overrides == null
            ? []
            : List<dynamic>.from(overrides!.map((x) => x)),
      };
}

class NutrientData {
  final Calories? calories;
  final Calories? kilojules;
  final NetQuantity? servingSize;
  final int? numberofServings;
  final NumberofServingIntervals? numberofServingIntervals;
  final NetQuantity? netQuantity;
  final Calories? caloriesperServing;
  final Calories? kilojulesperServing;
  final Carbohydrates? fat;
  final Carbohydrates? saturatedFattyAcids;
  final Carbohydrates? carbohydrates;
  final Carbohydrates? sugar;
  final Carbohydrates? protein;
  final Carbohydrates? salt;

  NutrientData({
    this.calories,
    this.kilojules,
    this.servingSize,
    this.numberofServings,
    this.numberofServingIntervals,
    this.netQuantity,
    this.caloriesperServing,
    this.kilojulesperServing,
    this.fat,
    this.saturatedFattyAcids,
    this.carbohydrates,
    this.sugar,
    this.protein,
    this.salt,
  });

  factory NutrientData.fromJson(Map<String, dynamic> json) => NutrientData(
        calories: json["Calories"] == null
            ? null
            : Calories.fromJson(json["Calories"]),
        kilojules: json["Kilojules"] == null
            ? null
            : Calories.fromJson(json["Kilojules"]),
        servingSize: json["ServingSize"] == null
            ? null
            : NetQuantity.fromJson(json["ServingSize"]),
        numberofServings: json["NumberofServings"],
        numberofServingIntervals: json["NumberofServingIntervals"] == null
            ? null
            : NumberofServingIntervals.fromJson(
                json["NumberofServingIntervals"]),
        netQuantity: json["NetQuantity"] == null
            ? null
            : NetQuantity.fromJson(json["NetQuantity"]),
        caloriesperServing: json["CaloriesperServing"] == null
            ? null
            : Calories.fromJson(json["CaloriesperServing"]),
        kilojulesperServing: json["KilojulesperServing"] == null
            ? null
            : Calories.fromJson(json["KilojulesperServing"]),
        fat: json["Fat"] == null ? null : Carbohydrates.fromJson(json["Fat"]),
        saturatedFattyAcids: json["SaturatedFattyAcids"] == null
            ? null
            : Carbohydrates.fromJson(json["SaturatedFattyAcids"]),
        carbohydrates: json["Carbohydrates"] == null
            ? null
            : Carbohydrates.fromJson(json["Carbohydrates"]),
        sugar: json["Sugar"] == null
            ? null
            : Carbohydrates.fromJson(json["Sugar"]),
        protein: json["Protein"] == null
            ? null
            : Carbohydrates.fromJson(json["Protein"]),
        salt:
            json["Salt"] == null ? null : Carbohydrates.fromJson(json["Salt"]),
      );

  Map<String, dynamic> toJson() => {
        "Calories": calories?.toJson(),
        "Kilojules": kilojules?.toJson(),
        "ServingSize": servingSize?.toJson(),
        "NumberofServings": numberofServings,
        "NumberofServingIntervals": numberofServingIntervals?.toJson(),
        "NetQuantity": netQuantity?.toJson(),
        "CaloriesperServing": caloriesperServing?.toJson(),
        "KilojulesperServing": kilojulesperServing?.toJson(),
        "Fat": fat?.toJson(),
        "SaturatedFattyAcids": saturatedFattyAcids?.toJson(),
        "Carbohydrates": carbohydrates?.toJson(),
        "Sugar": sugar?.toJson(),
        "Protein": protein?.toJson(),
        "Salt": salt?.toJson(),
      };
}

class Calories {
  final NumberofServingIntervals? energyInterval;
  final int? displayType;

  Calories({
    this.energyInterval,
    this.displayType,
  });

  factory Calories.fromJson(Map<String, dynamic> json) => Calories(
        energyInterval: json["EnergyInterval"] == null
            ? null
            : NumberofServingIntervals.fromJson(json["EnergyInterval"]),
        displayType: json["DisplayType"],
      );

  Map<String, dynamic> toJson() => {
        "EnergyInterval": energyInterval?.toJson(),
        "DisplayType": displayType,
      };
}

class NumberofServingIntervals {
  final int? lower;
  final int? upper;

  NumberofServingIntervals({
    this.lower,
    this.upper,
  });

  factory NumberofServingIntervals.fromJson(Map<String, dynamic> json) =>
      NumberofServingIntervals(
        lower: json["Lower"],
        upper: json["Upper"],
      );

  Map<String, dynamic> toJson() => {
        "Lower": lower,
        "Upper": upper,
      };
}

class Carbohydrates {
  final Amount? amount;

  Carbohydrates({
    this.amount,
  });

  factory Carbohydrates.fromJson(Map<String, dynamic> json) => Carbohydrates(
        amount: json["Amount"] == null ? null : Amount.fromJson(json["Amount"]),
      );

  Map<String, dynamic> toJson() => {
        "Amount": amount?.toJson(),
      };
}

class Amount {
  final NumberofServingIntervals? interval;
  final Weight? weight;

  Amount({
    this.interval,
    this.weight,
  });

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        interval: json["Interval"] == null
            ? null
            : NumberofServingIntervals.fromJson(json["Interval"]),
        weight: json["Weight"] == null ? null : Weight.fromJson(json["Weight"]),
      );

  Map<String, dynamic> toJson() => {
        "Interval": interval?.toJson(),
        "Weight": weight?.toJson(),
      };
}

class Weight {
  final String? unitType;

  Weight({
    this.unitType,
  });

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        unitType: json["UnitType"],
      );

  Map<String, dynamic> toJson() => {
        "UnitType": unitType,
      };
}

class NetQuantity {
  final String? measurementType;
  final Amount? weightedInterval;
  final VolumenInterval? volumenInterval;
  final CountInterval? countInterval;

  NetQuantity({
    this.measurementType,
    this.weightedInterval,
    this.volumenInterval,
    this.countInterval,
  });

  factory NetQuantity.fromJson(Map<String, dynamic> json) => NetQuantity(
        measurementType: json["MeasurementType"],
        weightedInterval: json["WeightedInterval"] == null
            ? null
            : Amount.fromJson(json["WeightedInterval"]),
        volumenInterval: json["VolumenInterval"] == null
            ? null
            : VolumenInterval.fromJson(json["VolumenInterval"]),
        countInterval: json["CountInterval"] == null
            ? null
            : CountInterval.fromJson(json["CountInterval"]),
      );

  Map<String, dynamic> toJson() => {
        "MeasurementType": measurementType,
        "WeightedInterval": weightedInterval?.toJson(),
        "VolumenInterval": volumenInterval?.toJson(),
        "CountInterval": countInterval?.toJson(),
      };
}

class CountInterval {
  final NumberofServingIntervals? interval;
  final Weight? count;

  CountInterval({
    this.interval,
    this.count,
  });

  factory CountInterval.fromJson(Map<String, dynamic> json) => CountInterval(
        interval: json["Interval"] == null
            ? null
            : NumberofServingIntervals.fromJson(json["Interval"]),
        count: json["Count"] == null ? null : Weight.fromJson(json["Count"]),
      );

  Map<String, dynamic> toJson() => {
        "Interval": interval?.toJson(),
        "Count": count?.toJson(),
      };
}

class VolumenInterval {
  final NumberofServingIntervals? interval;
  final Weight? volume;

  VolumenInterval({
    this.interval,
    this.volume,
  });

  factory VolumenInterval.fromJson(Map<String, dynamic> json) =>
      VolumenInterval(
        interval: json["Interval"] == null
            ? null
            : NumberofServingIntervals.fromJson(json["Interval"]),
        volume: json["Volume"] == null ? null : Weight.fromJson(json["Volume"]),
      );

  Map<String, dynamic> toJson() => {
        "Interval": interval?.toJson(),
        "Volume": volume?.toJson(),
      };
}

class PriceInfo {
  final Price? price;
  final int? corePrice;
  final int? containerDeposit;
  final List<dynamic>? overrides;
  final String? pricebyUnit;

  PriceInfo({
    this.price,
    this.corePrice,
    this.containerDeposit,
    this.overrides,
    this.pricebyUnit,
  });

  factory PriceInfo.fromJson(Map<String, dynamic> json) => PriceInfo(
        price: json["Price"] == null ? null : Price.fromJson(json["Price"]),
        corePrice: json["CorePrice"],
        containerDeposit: json["ContainerDeposit"],
        overrides: json["Overrides"] == null
            ? []
            : List<dynamic>.from(json["Overrides"]!.map((x) => x)),
        pricebyUnit: json["PricebyUnit"],
      );

  Map<String, dynamic> toJson() => {
        "Price": price?.toJson(),
        "CorePrice": corePrice,
        "ContainerDeposit": containerDeposit,
        "Overrides": overrides == null
            ? []
            : List<dynamic>.from(overrides!.map((x) => x)),
        "PricebyUnit": pricebyUnit,
      };
}

class Price {
  final int? deliveryPrice;
  final int? pickupPrice;
  final int? tablePrice;

  Price({
    this.deliveryPrice,
    this.pickupPrice,
    this.tablePrice,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        deliveryPrice: json["DeliveryPrice"],
        pickupPrice: json["PickupPrice"],
        tablePrice: json["TablePrice"],
      );

  Map<String, dynamic> toJson() => {
        "DeliveryPrice": deliveryPrice,
        "PickupPrice": pickupPrice,
        "TablePrice": tablePrice,
      };
}

class ProductInfo {
  final int? targetMarket;
  final String? gtin;
  final String? plu;
  final String? merchantId;
  final String? productType;

  ProductInfo({
    this.targetMarket,
    this.gtin,
    this.plu,
    this.merchantId,
    this.productType,
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json) => ProductInfo(
        targetMarket: json["TargetMarket"],
        gtin: json["Gtin"],
        plu: json["Plu"],
        merchantId: json["MerchantID"],
        productType: json["ProductType"],
      );

  Map<String, dynamic> toJson() => {
        "TargetMarket": targetMarket,
        "Gtin": gtin,
        "Plu": plu,
        "MerchantID": merchantId,
        "ProductType": productType,
      };
}

class Quantity {
  final QuantityClass? quantity;
  final List<Override>? overrides;

  Quantity({
    this.quantity,
    this.overrides,
  });

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
        quantity: json["Quantity"] == null
            ? null
            : QuantityClass.fromJson(json["Quantity"]),
        overrides: json["Overrides"] == null
            ? []
            : List<Override>.from(
                json["Overrides"]!.map((x) => Override.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Quantity": quantity?.toJson(),
        "Overrides": overrides == null
            ? []
            : List<dynamic>.from(overrides!.map((x) => x.toJson())),
      };
}

class Override {
  final String? contextType;
  final String? contextValue;
  final QuantityClass? quantity;

  Override({
    this.contextType,
    this.contextValue,
    this.quantity,
  });

  factory Override.fromJson(Map<String, dynamic> json) => Override(
        contextType: json["ContextType"],
        contextValue: json["ContextValue"],
        quantity: json["Quantity"] == null
            ? null
            : QuantityClass.fromJson(json["Quantity"]),
      );

  Map<String, dynamic> toJson() => {
        "ContextType": contextType,
        "ContextValue": contextValue,
        "Quantity": quantity?.toJson(),
      };
}

class QuantityClass {
  final int? minPermitted;
  final int? maxPermitted;
  final bool? isMinPermittedOptional;
  final int? chargeAbove;
  final int? refundUnder;
  final int? minPermittedUnique;
  final int? maxPermittedUnique;

  QuantityClass({
    this.minPermitted,
    this.maxPermitted,
    this.isMinPermittedOptional,
    this.chargeAbove,
    this.refundUnder,
    this.minPermittedUnique,
    this.maxPermittedUnique,
  });

  factory QuantityClass.fromJson(Map<String, dynamic> json) => QuantityClass(
        minPermitted: json["MinPermitted"],
        maxPermitted: json["MaxPermitted"],
        isMinPermittedOptional: json["IsMinPermittedOptional"],
        chargeAbove: json["ChargeAbove"],
        refundUnder: json["RefundUnder"],
        minPermittedUnique: json["MinPermittedUnique"],
        maxPermittedUnique: json["MaxPermittedUnique"],
      );

  Map<String, dynamic> toJson() => {
        "MinPermitted": minPermitted,
        "MaxPermitted": maxPermitted,
        "IsMinPermittedOptional": isMinPermittedOptional,
        "ChargeAbove": chargeAbove,
        "RefundUnder": refundUnder,
        "MinPermittedUnique": minPermittedUnique,
        "MaxPermittedUnique": maxPermittedUnique,
      };
}

class RewardGroupRules {
  final Reward? reward;

  RewardGroupRules({
    this.reward,
  });

  factory RewardGroupRules.fromJson(Map<String, dynamic> json) =>
      RewardGroupRules(
        reward: json["Reward"] == null ? null : Reward.fromJson(json["Reward"]),
      );

  Map<String, dynamic> toJson() => {
        "Reward": reward?.toJson(),
      };
}

class Reward {
  final String? type;
  final int? defaultValue;
  final int? multiplierValue;
  final int? customValue;
  final bool? isMutiplierRequired;

  Reward({
    this.type,
    this.defaultValue,
    this.multiplierValue,
    this.customValue,
    this.isMutiplierRequired,
  });

  factory Reward.fromJson(Map<String, dynamic> json) => Reward(
        type: json["Type"],
        defaultValue: json["DefaultValue"],
        multiplierValue: json["MultiplierValue"],
        customValue: json["CustomValue"],
        isMutiplierRequired: json["IsMutiplierRequired"],
      );

  Map<String, dynamic> toJson() => {
        "Type": type,
        "DefaultValue": defaultValue,
        "MultiplierValue": multiplierValue,
        "CustomValue": customValue,
        "IsMutiplierRequired": isMutiplierRequired,
      };
}

class SuspensionRules {
  final Suspension? suspension;

  SuspensionRules({
    this.suspension,
  });

  factory SuspensionRules.fromJson(Map<String, dynamic> json) =>
      SuspensionRules(
        suspension: json["Suspension"] == null
            ? null
            : Suspension.fromJson(json["Suspension"]),
      );

  Map<String, dynamic> toJson() => {
        "Suspension": suspension?.toJson(),
      };
}

class Suspension {
  final int? suspendedUntil;
  final bool? isSuspended;
  final String? reason;

  Suspension({
    this.suspendedUntil,
    this.isSuspended,
    this.reason,
  });

  factory Suspension.fromJson(Map<String, dynamic> json) => Suspension(
        suspendedUntil: json["SuspendedUntil"],
        isSuspended: json["IsSuspended"],
        reason: json["Reason"],
      );

  Map<String, dynamic> toJson() => {
        "SuspendedUntil": suspendedUntil,
        "IsSuspended": isSuspended,
        "Reason": reason,
      };
}

class TaxInfo {
  final int? taxrate;
  final int? vatRateInPercentage;

  TaxInfo({
    this.taxrate,
    this.vatRateInPercentage,
  });

  factory TaxInfo.fromJson(Map<String, dynamic> json) => TaxInfo(
        taxrate: json["Taxrate"],
        vatRateInPercentage: json["VATRateInPercentage"],
      );

  Map<String, dynamic> toJson() => {
        "Taxrate": taxrate,
        "VATRateInPercentage": vatRateInPercentage,
      };
}

class VisibilityInfo {
  final VisibilityHours? visibilityHours;

  VisibilityInfo({
    this.visibilityHours,
  });

  factory VisibilityInfo.fromJson(Map<String, dynamic> json) => VisibilityInfo(
        visibilityHours: json["VisibilityHours"] == null
            ? null
            : VisibilityHours.fromJson(json["VisibilityHours"]),
      );

  Map<String, dynamic> toJson() => {
        "VisibilityHours": visibilityHours?.toJson(),
      };
}

class VisibilityHours {
  final String? startDate;
  final String? endDate;

  VisibilityHours({
    this.startDate,
    this.endDate,
  });

  factory VisibilityHours.fromJson(Map<String, dynamic> json) =>
      VisibilityHours(
        startDate: json["StartDate"],
        endDate: json["EndDate"],
      );

  Map<String, dynamic> toJson() => {
        "StartDate": startDate,
        "EndDate": endDate,
      };
}

class Menu {
  final String? id;
  final String? menuId;
  final String? verticalId;
  final String? storeId;
  final SubTitle? title;
  final SubTitle? subTitle;
  final SubTitle? description;
  final MenuAvailability? menuAvailability;
  final List<String>? menuCategoryIDs;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? createdBy;
  final String? modifiedBy;

  Menu({
    this.id,
    this.menuId,
    this.verticalId,
    this.storeId,
    this.title,
    this.subTitle,
    this.description,
    this.menuAvailability,
    this.menuCategoryIDs,
    this.createdDate,
    this.modifiedDate,
    this.createdBy,
    this.modifiedBy,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["ID"],
        menuId: json["MenuID"],
        verticalId: json["VerticalID"],
        storeId: json["StoreID"],
        title: json["Title"] == null ? null : SubTitle.fromJson(json["Title"]),
        subTitle: json["subTitle"] == null
            ? null
            : SubTitle.fromJson(json["subTitle"]),
        description: json["description"] == null
            ? null
            : SubTitle.fromJson(json["description"]),
        menuAvailability: json["MenuAvailability"] == null
            ? null
            : MenuAvailability.fromJson(json["MenuAvailability"]),
        menuCategoryIDs: json["MenuCategoryIDs"] == null
            ? []
            : List<String>.from(json["MenuCategoryIDs"]!.map((x) => x)),
        createdDate: json["CreatedDate"] == null
            ? null
            : DateTime.parse(json["CreatedDate"]),
        modifiedDate: json["ModifiedDate"] == null
            ? null
            : DateTime.parse(json["ModifiedDate"]),
        createdBy: json["CreatedBy"],
        modifiedBy: json["ModifiedBy"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "MenuID": menuId,
        "VerticalID": verticalId,
        "StoreID": storeId,
        "Title": title?.toJson(),
        "SubTitle": subTitle,
        "Description": description,
        "MenuAvailability": menuAvailability?.toJson(),
        "MenuCategoryIDs": menuCategoryIDs == null
            ? []
            : List<dynamic>.from(menuCategoryIDs!.map((x) => x)),
        "CreatedDate": createdDate?.toIso8601String(),
        "ModifiedDate": modifiedDate?.toIso8601String(),
        "CreatedBy": createdBy,
        "ModifiedBy": modifiedBy,
      };
}

class MenuAvailability {
  final Day? sunday;
  final Day? monday;
  final Day? tuesday;
  final Day? wednesday;
  final Day? thursday;
  final Day? friday;
  final Day? saturday;

  MenuAvailability({
    this.sunday,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
  });

  factory MenuAvailability.fromJson(Map<String, dynamic> json) =>
      MenuAvailability(
        sunday: json["Sunday"] == null ? null : Day.fromJson(json["Sunday"]),
        monday: json["Monday"] == null ? null : Day.fromJson(json["Monday"]),
        tuesday: json["Tuesday"] == null ? null : Day.fromJson(json["Tuesday"]),
        wednesday:
            json["Wednesday"] == null ? null : Day.fromJson(json["Wednesday"]),
        thursday:
            json["Thursday"] == null ? null : Day.fromJson(json["Thursday"]),
        friday: json["Friday"] == null ? null : Day.fromJson(json["Friday"]),
        saturday:
            json["Saturday"] == null ? null : Day.fromJson(json["Saturday"]),
      );

  Map<String, dynamic> toJson() => {
        "Sunday": sunday?.toJson(),
        "Monday": monday?.toJson(),
        "Tuesday": tuesday?.toJson(),
        "Wednesday": wednesday?.toJson(),
        "Thursday": thursday?.toJson(),
        "Friday": friday?.toJson(),
        "Saturday": saturday?.toJson(),
      };
}

class Day {
  final String? startTime;
  final String? endTime;

  Day({
    this.startTime,
    this.endTime,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        startTime: json["StartTime"],
        endTime: json["EndTime"],
      );

  Map<String, dynamic> toJson() => {
        "StartTime": startTime,
        "EndTime": endTime,
      };
}

class ModifierGroup {
  final String? id;
  final String? modifierGroupId;
  final SubTitle? title;
  final SubTitle? description;
  final String? storeId;
  final String? displayType;
  final List<ModifierOption>? modifierOptions;
  final Quantity? quantityConstraintsRules;
  final DateTime? createdDate;
  final DateTime? modifiedDate;

  ModifierGroup({
    this.id,
    this.modifierGroupId,
    this.title,
    this.description,
    this.storeId,
    this.displayType,
    this.modifierOptions,
    this.quantityConstraintsRules,
    this.createdDate,
    this.modifiedDate,
  });

  factory ModifierGroup.fromJson(Map<String, dynamic> json) => ModifierGroup(
        id: json["ID"],
        modifierGroupId: json["ModifierGroupID"],
        title: json["Title"] == null ? null : SubTitle.fromJson(json["Title"]),
        description: json["Description"] == null
            ? null
            : SubTitle.fromJson(json["Description"]),
        storeId: json["StoreID"],
        displayType: json["DisplayType"],
        modifierOptions: json["ModifierOptions"] == null
            ? []
            : List<ModifierOption>.from(json["ModifierOptions"]!
                .map((x) => ModifierOption.fromJson(x))),
        quantityConstraintsRules: json["QuantityConstraintsRules"] == null
            ? null
            : Quantity.fromJson(json["QuantityConstraintsRules"]),
        createdDate: json["CreatedDate"] == null
            ? null
            : DateTime.parse(json["CreatedDate"]),
        modifiedDate: json["ModifiedDate"] == null
            ? null
            : DateTime.parse(json["ModifiedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "ModifierGroupID": modifierGroupId,
        "Title": title?.toJson(),
        "Description": description?.toJson(),
        "StoreID": storeId,
        "DisplayType": displayType,
        "ModifierOptions": modifierOptions == null
            ? []
            : List<dynamic>.from(modifierOptions!.map((x) => x.toJson())),
        "QuantityConstraintsRules": quantityConstraintsRules?.toJson(),
        "CreatedDate": createdDate?.toIso8601String(),
        "ModifiedDate": modifiedDate?.toIso8601String(),
      };
}

class ModifierOption {
  final String? id;
  final String? type;

  ModifierOption({
    this.id,
    this.type,
  });

  factory ModifierOption.fromJson(Map<String, dynamic> json) => ModifierOption(
        id: json["Id"],
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Type": type,
      };
}
