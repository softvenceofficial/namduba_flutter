class CarBrandModel {
  final String id;
  final String name;

  CarBrandModel({required this.id, required this.name});
}

final List<CarBrandModel> carBrandList = [
  CarBrandModel(id: '1', name: 'Toyota'),
  CarBrandModel(id: '2', name: 'Honda'),
  CarBrandModel(id: '3', name: 'Ford'),
  CarBrandModel(id: '4', name: 'BMW'),
  CarBrandModel(id: '5', name: 'Mercedes'),
  CarBrandModel(id: '6', name: 'Hyundai'),
];

class CarModel {
  final String id;
  final String name;

  CarModel({required this.id, required this.name});
}

final List<CarModel> carModelList = [
  CarModel(id: '1', name: 'Corolla'),
  CarModel(id: '2', name: 'Camry'),
  CarModel(id: '3', name: 'Civic'),
  CarModel(id: '4', name: 'Accord'),
  CarModel(id: '5', name: 'Mustang'),
  CarModel(id: '6', name: 'X5'),
  CarModel(id: '7', name: 'A4'),
  CarModel(id: '8', name: 'Elantra'),
];

final List<String> carYearList = List.generate(
  27,
  (index) => (2000 + index).toString(),
);

class CarVariantModel {
  final String id;
  final String name;

  CarVariantModel({required this.id, required this.name});
}

// Variants for Corolla
final List<CarVariantModel> corollaVariants = [
  CarVariantModel(id: '1', name: 'L'),
  CarVariantModel(id: '2', name: 'LE'),
  CarVariantModel(id: '3', name: 'XLE'),
  CarVariantModel(id: '4', name: 'SE'),
];

// Variants for Camry
final List<CarVariantModel> camryVariants = [
  CarVariantModel(id: '1', name: 'LE'),
  CarVariantModel(id: '2', name: 'SE'),
  CarVariantModel(id: '3', name: 'XSE'),
  CarVariantModel(id: '4', name: 'TRD'),
];

// Variants for Civic
final List<CarVariantModel> civicVariants = [
  CarVariantModel(id: '1', name: 'LX'),
  CarVariantModel(id: '2', name: 'EX'),
  CarVariantModel(id: '3', name: 'Sport'),
  CarVariantModel(id: '4', name: 'Touring'),
];

class CarTypeModel {
  final String id;
  final String name;

  CarTypeModel({required this.id, required this.name});
}

final List<CarTypeModel> carTypeList = [
  CarTypeModel(id: '1', name: 'Sedan'),
  CarTypeModel(id: '2', name: 'SUV'),
  CarTypeModel(id: '3', name: 'Hatchback'),
  CarTypeModel(id: '4', name: 'Convertible'),
  CarTypeModel(id: '5', name: 'Pickup Truck'),
  CarTypeModel(id: '6', name: 'Minivan'),
];

class ChassisModel {
  final String id;
  final String name;

  ChassisModel({required this.id, required this.name});
}

final List<ChassisModel> chassisList = [
  ChassisModel(id: '1', name: 'Monocoque'),
  ChassisModel(id: '2', name: 'Ladder Frame'),
  ChassisModel(id: '3', name: 'Space Frame'),
  ChassisModel(id: '4', name: 'Tubular Frame'),
];

class EngineModel {
  final String id;
  final String name;

  EngineModel({required this.id, required this.name});
}

final List<EngineModel> engineList = [
  EngineModel(id: '1', name: 'Petrol'),
  EngineModel(id: '2', name: 'Diesel'),
  EngineModel(id: '3', name: 'Hybrid'),
  EngineModel(id: '4', name: 'Electric'),
  EngineModel(id: '5', name: 'CNG'),
];
