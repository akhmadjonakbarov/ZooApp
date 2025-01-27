class Place {
  final String fsqId;
  final List<Category> categories;
  final List<dynamic> chains;
  final String closedBucket;
  final int distance;
  final Geocodes geocodes;
  final String link;
  final Location location;
  final String name;
  final RelatedPlaces relatedPlaces;
  final String timezone;

  Place({
    required this.fsqId,
    required this.categories,
    required this.chains,
    required this.closedBucket,
    required this.distance,
    required this.geocodes,
    required this.link,
    required this.location,
    required this.name,
    required this.relatedPlaces,
    required this.timezone,
  });

  factory Place.fromMap(Map<String, dynamic> json) {
    return Place(
      fsqId: json['fsq_id'],
      categories: (json['categories'] as List)
          .map((item) => Category.fromJson(item))
          .toList(),
      chains: json['chains'],
      closedBucket: json['closed_bucket'],
      distance: json['distance'],
      geocodes: Geocodes.fromJson(json['geocodes']),
      link: json['link'],
      location: Location.fromJson(json['location']),
      name: json['name'],
      relatedPlaces: RelatedPlaces.fromJson(json['related_places']),
      timezone: json['timezone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fsq_id': fsqId,
      'categories': categories.map((item) => item.toJson()).toList(),
      'chains': chains,
      'closed_bucket': closedBucket,
      'distance': distance,
      'geocodes': geocodes.toJson(),
      'link': link,
      'location': location.toJson(),
      'name': name,
      'related_places': relatedPlaces.toJson(),
      'timezone': timezone,
    };
  }
}

class Category {
  final int id;
  final String name;
  final String shortName;
  final String pluralName;
  final Icon icon;

  Category({
    required this.id,
    required this.name,
    required this.shortName,
    required this.pluralName,
    required this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      shortName: json['short_name'],
      pluralName: json['plural_name'],
      icon: Icon.fromJson(json['icon']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'short_name': shortName,
      'plural_name': pluralName,
      'icon': icon.toJson(),
    };
  }
}

class Icon {
  final String prefix;
  final String suffix;

  Icon({
    required this.prefix,
    required this.suffix,
  });

  factory Icon.fromJson(Map<String, dynamic> json) {
    return Icon(
      prefix: json['prefix'],
      suffix: json['suffix'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prefix': prefix,
      'suffix': suffix,
    };
  }
}

class Geocodes {
  final MainGeocode main;

  Geocodes({required this.main});

  factory Geocodes.fromJson(Map<String, dynamic> json) {
    return Geocodes(
      main: MainGeocode.fromJson(json['main']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'main': main.toJson(),
    };
  }
}

class MainGeocode {
  final double latitude;
  final double longitude;

  MainGeocode({
    required this.latitude,
    required this.longitude,
  });

  factory MainGeocode.fromJson(Map<String, dynamic> json) {
    return MainGeocode(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

class Location {
  final String address;
  final String country;
  final String crossStreet;
  final String formattedAddress;
  final String locality;
  final String region;

  Location({
    required this.address,
    required this.country,
    required this.crossStreet,
    required this.formattedAddress,
    required this.locality,
    required this.region,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address: json['address'],
      country: json['country'],
      crossStreet: json['cross_street'],
      formattedAddress: json['formatted_address'],
      locality: json['locality'],
      region: json['region'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'country': country,
      'cross_street': crossStreet,
      'formatted_address': formattedAddress,
      'locality': locality,
      'region': region,
    };
  }
}

class RelatedPlaces {
  final List<ChildPlace> children;

  RelatedPlaces({required this.children});

  factory RelatedPlaces.fromJson(Map<String, dynamic> json) {
    return RelatedPlaces(
      children: (json['children'] as List)
          .map((item) => ChildPlace.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'children': children.map((item) => item.toJson()).toList(),
    };
  }
}

class ChildPlace {
  final String fsqId;
  final List<Category> categories;
  final String name;

  ChildPlace({
    required this.fsqId,
    required this.categories,
    required this.name,
  });

  factory ChildPlace.fromJson(Map<String, dynamic> json) {
    return ChildPlace(
      fsqId: json['fsq_id'],
      categories: (json['categories'] as List)
          .map((item) => Category.fromJson(item))
          .toList(),
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fsq_id': fsqId,
      'categories': categories.map((item) => item.toJson()).toList(),
      'name': name,
    };
  }
}
