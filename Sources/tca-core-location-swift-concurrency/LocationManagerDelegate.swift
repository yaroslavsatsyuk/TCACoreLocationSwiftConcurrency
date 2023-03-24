//
//  File.swift
//  
//
//  Created by Yaroslav Satsyuk on 2023-03-24.
//

import CoreLocation

private class LocationManagerDelegate: NSObject, CLLocationManagerDelegate {
    let continuation: AsyncStream<LocationManagerClient.Action>.Continuation
    
    init(continuation: AsyncStream<LocationManagerClient.Action>.Continuation) {
        self.continuation = continuation
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus
    ) {
        self.continuation.yield(.didChangeAuthorization(status))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.continuation.yield(.didFailWithError(LocationManagerClient.Error(error)))
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.continuation.yield(.didUpdateLocations(locations.map(Location.init(rawValue:))))
    }
    
    func locationManager(_ manager: CLLocationManager, didFinishDeferredUpdatesWithError error: Error?
    ) {
        self.continuation.yield(
            .didFinishDeferredUpdatesWithError(error.map(LocationManagerClient.Error.init))
        )
    }
    
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        self.continuation.yield(.didPauseLocationUpdates)
    }
    
    
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        self.continuation.yield(.didResumeLocationUpdates)
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        self.continuation.yield(.didEnterRegion(Region(rawValue: region)))
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        self.continuation.yield(.didExitRegion(Region(rawValue: region)))
    }
    
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion
    ) {
        self.continuation.yield(.didDetermineState(state, region: Region(rawValue: region)))
    }
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error
    ) {
        self.continuation.yield(
            .monitoringDidFail(
                region: region.map(Region.init(rawValue:)),
                error: LocationManagerClient.Error(error)
            )
        )
    }
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        self.continuation.yield(.didStartMonitoring(region: Region(rawValue: region)))
    }
    
}
