//
//  LocationManager.swift
//  
//
//  Created by Yaroslav Satsyuk on 2023-03-24.
//

import CoreLocation

public struct LocationManager {
    public enum Action: Equatable {
        case didChangeAuthorization(CLAuthorizationStatus)
        case didDetermineState(CLRegionState, region: Region)
        case didEnterRegion(Region)
        case didExitRegion(Region)
        case didFailWithError(Error)
        case didPauseLocationUpdates
        case didResumeLocationUpdates
        case didStartMonitoring(region: Region)
        case didUpdateLocations([Location])
        case monitoringDidFail(region: Region?, error: Error)
    }
    
    public struct Error: Swift.Error, Equatable {
        public let error: NSError
        
        public init(_ error: Swift.Error) {
            self.error = error as NSError
        }
    }
    
    public var accuracyAuthorization: () -> AccuracyAuthorization?
    public var authorizationStatus: () -> CLAuthorizationStatus
    public var delegate: @Sendable () -> AsyncStream<Action>
    public var location: () -> Location?
    public var locationServicesEnabled: () -> Bool
    public var requestAlwaysAuthorization: @Sendable () async -> Void
    public var requestWhenInUseAuthorization: @Sendable () async -> Void
    public var requestTemporaryFullAccuracyAuthorization: @Sendable (String) async throws -> Void
    public var requestLocation: @Sendable () async -> Void
    public var startUpdatingLocation: @Sendable () async -> Void
    public var stopUpdatingLocation: @Sendable () async -> Void
    public var monitoredRegions: () -> Set<Region>
    public var stopMonitoringForRegion: @Sendable (Region) async -> Void
    public var set: @Sendable (LocationManager.Properties) async -> Void
    
    @Sendable public func set(
        activityType: CLActivityType? = nil,
        allowsBackgroundLocationUpdates: Bool? = nil,
        desiredAccuracy: CLLocationAccuracy? = nil,
        distanceFilter: CLLocationDistance? = nil,
        headingFilter: CLLocationDegrees? = nil,
        headingOrientation: CLDeviceOrientation? = nil,
        pausesLocationUpdatesAutomatically: Bool? = nil,
        showsBackgroundLocationIndicator: Bool? = nil
    ) async {
        await self.set(
            Properties(
                activityType: activityType,
                allowsBackgroundLocationUpdates: allowsBackgroundLocationUpdates,
                desiredAccuracy: desiredAccuracy,
                distanceFilter: distanceFilter,
                pausesLocationUpdatesAutomatically: pausesLocationUpdatesAutomatically,
                showsBackgroundLocationIndicator: showsBackgroundLocationIndicator
            )
        )
    }
}

public extension LocationManager {
    struct Properties: Equatable {
        var activityType: CLActivityType? = nil
        var allowsBackgroundLocationUpdates: Bool? = nil
        var desiredAccuracy: CLLocationAccuracy? = nil
        var distanceFilter: CLLocationDistance? = nil
        var pausesLocationUpdatesAutomatically: Bool? = nil
        var showsBackgroundLocationIndicator: Bool? = nil
        
        public init(
            activityType: CLActivityType? = nil,
            allowsBackgroundLocationUpdates: Bool? = nil,
            desiredAccuracy: CLLocationAccuracy? = nil,
            distanceFilter: CLLocationDistance? = nil,
            pausesLocationUpdatesAutomatically: Bool? = nil,
            showsBackgroundLocationIndicator: Bool? = nil
        ) {
            self.activityType = activityType
            self.allowsBackgroundLocationUpdates = allowsBackgroundLocationUpdates
            self.desiredAccuracy = desiredAccuracy
            self.distanceFilter = distanceFilter
            self.pausesLocationUpdatesAutomatically = pausesLocationUpdatesAutomatically
            self.showsBackgroundLocationIndicator = showsBackgroundLocationIndicator
        }
    }
}

