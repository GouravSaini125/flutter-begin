import 'location_fact.dart';

class Location {
  final int id;
  final String name;
  final String imagePath;
  final List<LocationFact> facts;

  Location(this.id, this.name, this.imagePath, this.facts);

  static List<Location> fetchAll() {
    return List<Location>.generate(10, (i) {
      return Location(i + 1, 'name${i + 1}', "assets/images/place.jpg", [
        LocationFact(
          "name${i + 1}",
          "ugdfh sdifhd hdfd fhgdh fhgdf   d  df  jhdgsd gfjshdg fjhsgfjsh ghd gg ",
        ),
        LocationFact(
          "Summary${i + 1}",
          "asda asdadvdd asda hgkhdhshdgf asda sdbvksdsu asda hdfhosdhfo",
        )
      ]);
    });
  }

  static Location fetchByID(int locationID) {
    List<Location> locations = Location.fetchAll();
    for (var i = 0; i < locations.length; i++) {
      if (locations[i].id == locationID) {
        return locations[i];
      }
    }
    return null;
  }
}
