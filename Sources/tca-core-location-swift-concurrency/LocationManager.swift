//
//  LocationManager.swift
//  
//
//  Created by Yaroslav Satsyuk on 2023-03-24.
//

import CoreLocation

public struct LocationMananger {
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
    
}
