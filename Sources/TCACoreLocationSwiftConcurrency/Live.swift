//
//  LocationManagerClient.swift
//  
//
//  Created by Yaroslav Satsyuk on 2023-03-24.
//

import CoreLocation

extension LocationManagerClient {
    public static var live: LocationManagerClient {
        let manager = CLLocationManager()
        
        return LocationManagerClient(
            accuracyAuthorization: { AccuracyAuthorization(manager.accuracyAuthorization) },
            authorizationStatus: { manager.authorizationStatus },
            delegate: {
                AsyncStream { continuation in
                    let delegate = LocationManagerDelegate(continuation: continuation)
                    manager.delegate = delegate
                    continuation.onTermination = { [delegate] _ in
                        _ = delegate
                    }
                }
            },
            location: { manager.location.map(Location.init(rawValue:)) },
            locationServicesEnabled: CLLocationManager.locationServicesEnabled,
            requestAlwaysAuthorization: { manager.requestAlwaysAuthorization() },
            requestWhenInUseAuthorization: { manager.requestWhenInUseAuthorization()  },
            requestTemporaryFullAccuracyAuthorization: { purposeKey in
                try await withCheckedThrowingContinuation { continuation in
                    manager.requestTemporaryFullAccuracyAuthorization(
                        withPurposeKey: purposeKey
                    ) { error in
                        if let error = error {
                            continuation.resume(throwing: error)
                        } else {
                            continuation.resume()
                        }
                    }
                }
            },
            requestLocation: { manager.requestLocation() },
            startUpdatingLocation: { manager.startUpdatingLocation() },
            stopUpdatingLocation: { manager.stopUpdatingLocation() },
            monitoredRegions: {
                Set(manager.monitoredRegions.map(Region.init(rawValue:)))
            },
            startMonitoringForRegion: { region in
                manager.startMonitoring(for: region.rawValue!)
            },
            stopMonitoringForRegion: { region in
                manager.stopMonitoring(for: region.rawValue!)
            },
            setProperties: { properties in
                if let activityType = properties.activityType {
                    manager.activityType = activityType
                }
                
                if let allowsBackgroundLocationUpdates = properties.allowsBackgroundLocationUpdates {
                    manager.allowsBackgroundLocationUpdates = allowsBackgroundLocationUpdates
                }
                
                if let desiredAccuracy = properties.desiredAccuracy {
                    manager.desiredAccuracy = desiredAccuracy
                }
                
                if let distanceFilter = properties.distanceFilter {
                    manager.distanceFilter = distanceFilter
                }
                
                if let pausesLocationUpdatesAutomatically = properties.pausesLocationUpdatesAutomatically {
                    manager.pausesLocationUpdatesAutomatically = pausesLocationUpdatesAutomatically
                }
                
                if let showsBackgroundLocationIndicator = properties.showsBackgroundLocationIndicator {
                    manager.showsBackgroundLocationIndicator = showsBackgroundLocationIndicator
                }
            }
        )
    }
}
