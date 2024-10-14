class Workspace {
  static const String _kWorkspaceId = 'workspace_id';
  static const String _kName = 'name';
  static const String _kAddress = 'address';
  static const String _kCity = 'city';
  static const String _kState = 'state';
  static const String _kPostalCode = 'postal_code';
  static const String _kCapacity = 'capacity';
  static const String _kDesksAvailable = 'desks_available';
  static const String _kAmenities = 'amenities';

  final String workspaceId;
  final String name;
  final String address;
  final String city;
  final String state;
  final String postalCode;
  final int capacity;
  final int desksAvailable;
  final List<String> amenities;

  Workspace({
    required this.workspaceId,
    required this.name,
    required this.address,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.capacity,
    required this.desksAvailable,
    required this.amenities,
  });

  // Factory method to create a Workspace from Firestore document data
  factory Workspace.fromData(Map<String, dynamic> data, String documentId) {
    return Workspace(
      workspaceId: documentId,
      name: data[_kName],
      address: data[_kAddress],
      city: data[_kCity],
      state: data[_kState],
      postalCode: data[_kPostalCode],
      capacity: data[_kCapacity],
      desksAvailable: data[_kDesksAvailable],
      amenities: List<String>.from(data[_kAmenities]),
    );
  }

  // Convert Workspace object to map for storing in Firestore
  Map<String, dynamic> toData() {
    return {
      _kWorkspaceId: workspaceId,
      _kName: name,
      _kAddress: address,
      _kCity: city,
      _kState: state,
      _kPostalCode: postalCode,
      _kCapacity: capacity,
      _kDesksAvailable: desksAvailable,
      _kAmenities: amenities,
    };
  }
}
