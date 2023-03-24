import CoreLocation
import XCTestDynamicOverlay

extension LocationManagerClient {
  public static let failing = LocationManagerClient(
    accuracyAuthorization: XCTUnimplemented("\(Self.self).accuracyAuthorization"),
    authorizationStatus: XCTUnimplemented("\(Self.self).authorizationStatus"),
    delegate: XCTUnimplemented("\(Self.self).delegate"),
    location: XCTUnimplemented("\(Self.self).location"),
    locationServicesEnabled: XCTUnimplemented("\(Self.self).locationServicesEnabled"),
    requestAlwaysAuthorization: XCTUnimplemented("\(Self.self).monitoredRegions"),
    requestWhenInUseAuthorization: XCTUnimplemented("\(Self.self).requestAlwaysAuthorization"),
    requestTemporaryFullAccuracyAuthorization: XCTUnimplemented("\(Self.self).requestLocation"),
    requestLocation: XCTUnimplemented("\(Self.self).requestWhenInUseAuthorization"),
    startUpdatingLocation: XCTUnimplemented(
        "\(Self.self).requestTemporaryFullAccuracyAuthorization"),
    stopUpdatingLocation: XCTUnimplemented("\(Self.self).startMonitoringForRegion"),
    monitoredRegions: XCTUnimplemented("\(Self.self).startUpdatingLocation"),
    startMonitoringForRegion: XCTUnimplemented("\(Self.self).stopMonitoringForRegion"),
    stopMonitoringForRegion: XCTUnimplemented("\(Self.self).stopUpdatingLocation"),
    setProperties: XCTUnimplemented("\(Self.self).setProperties")
  )
}
