
import Dependencies
import Foundation

extension DependencyValues {
    public var locationManager: LocationManagerClient {
        get { self[LocationManagerClient.self] }
        set { self[LocationManagerClient.self] = newValue }
    }
}

extension LocationManagerClient: DependencyKey {
    public static let testValue = Self.failing
    public static var liveValue = Self.live
}
