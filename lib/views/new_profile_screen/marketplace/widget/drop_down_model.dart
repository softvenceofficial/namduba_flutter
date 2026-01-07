class TransportMode {
  final String id;
  final String name;

  TransportMode({required this.id, required this.name});
}

final List<TransportMode> transportModes = [
  TransportMode(id: "1", name: "Car"),
  TransportMode(id: "2", name: "Bus"),
  TransportMode(id: "3", name: "Train"),
  TransportMode(id: "4", name: "Airplane"),
];

class DestinationModel {
  final String id;
  final String name;

  const DestinationModel({
    required this.id,
    required this.name,
  });
}

final List<DestinationModel> destinations = [
  DestinationModel(id: "1", name: "Home"),
  DestinationModel(id: "2", name: "Office"),
  DestinationModel(id: "3", name: "Airport"),
];

class TravelOrigin {
  final String id;
  final String name;

  const TravelOrigin({
    required this.id,
    required this.name,
  });
}

final List<TravelOrigin> travelOrigins = [
  TravelOrigin(id: "1", name: "Bangladesh"),
  TravelOrigin(id: "2", name: "India"),
  TravelOrigin(id: "3", name: "United States"),
  TravelOrigin(id: "4", name: "United Kingdom"),
  TravelOrigin(id: "5", name: "Canada"),
];

class TravelDestination {
  final String id;
  final String name;

  TravelDestination({required this.id, required this.name});
}

final List<TravelDestination> travelDestinations = [
  TravelDestination(id: "1", name: "France"),
  TravelDestination(id: "2", name: "Germany"),
  TravelDestination(id: "3", name: "Japan"),
  TravelDestination(id: "4", name: "Australia"),
  TravelDestination(id: "5", name: "Brazil"),
];
