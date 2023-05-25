//
//  ImageNameType.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 21.01.2023.
//

import Foundation

enum ImageNameType: String {
    //MARK: - Planets
    case bluePlanet
    case greenPlanet
    
    //MARK: - Planets
    case femaleGender
    case maleGender
    case hermaphroditeGender
    case naGender
    case noneGender
    
    //MARK: - Climates
    case aridClimate
    case frigidClimate
    case frozenClimate
    case pollutedClimate
    case superheaterClimate
    case temperateClimate
    case tropicalClimate
    case unknownClimate
    
    //MARK: - StarShips
    case battleStantionShip
    case corvetteShip
    case cruiserShip
    case destroyerShip
    case frigateShip
    case interseptorShip
    case starfighteShip
    case transporterShip
    
    //MARK: - Species
    case amphibian
    case gastropod
    case reptile
    case sentientIcon
    case mammal
    case unknown
    
    //MARK: - Vehicles
    case diggerCrawler
    case skyhopper
    case airspeeder
    case aerialPlatform
    case twinPod
    case juggernaut
    case armoredTransport
    case speederBike
 
    case circleCloseButton
    case emptyImage = ""
    
    case personTabIcon
    case planetTabIcon
    case addButton
    case starshipTabIcon
    case vehicleTabIcon
    case specieTabIcon
    case filmTabIcon
    
    case filmIcon
    
    case episode1
    case episode2
    case episode3
    case episode4
}
