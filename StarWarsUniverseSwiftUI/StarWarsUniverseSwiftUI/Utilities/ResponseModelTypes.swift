//
//  ResponseModelTypes.swift
//  StarWarsUniverseSwiftUI
//
//  Created by Viacheslav Markov on 31.05.2023.
//

import Foundation

final class ResponseModelTypes {
    static let vehicleModel = VehicleModel(
        name: "",
        model: "",
        urlString: "",
        averageHeight: "",
        averageLifespan: "",
        designation: "",
        eyeColors: "",
        films: [],
        hairColors: "",
        homeWorld: "",
        language: "",
        people: [],
        skinColors: ""
    )
    
    static let specieModel = SpecieModel(
        name: "",
        classification: "",
        urlString: "",
        cargoCapacity: "",
        consumables: "",
        costInCredits: "",
        crew: "",
        films: [],
        people: [],
        length: "",
        manufacturer: "",
        maxAtmospheringSpeed: "",
        passengers: "",
        vehicleClass: ""
    )
    
    static let starShipModel = StarShipModel(
        name: "",
        model: "",
        urlString: "",
        manufacturer: "",
        costInCredits: "",
        length: "",
        maxAtmospheringSpeed: "",
        crew: "",
        passengers: "",
        cargoCapacity: "",
        hyperdriveRating: "",
        starshipClass: "",
        pilots: [],
        films: []
    )
    
    static let planetModel = PlanetModel(
        name: "",
        climate: "",
        urlString: "",
        rotationPeriod: "",
        orbitalPeriod: "",
        diameter: "",
        gravity: "",
        terrain: "",
        surfaceWater: "",
        population: "",
        residents: [],
        films: []
    )
    
    static let peopleModel = PeopleModel(
        name: "name",
        gender: "",
        urlString: "",
        height: "",
        mass: "",
        films: [],
        species: [],
        vehicles: [],
        starships: [],
        hairColor: "",
        skinColor: "",
        eyeColor: "",
        birthYear: "",
        homeWorld: ""
    )
    
    static let filmModel = FilmModel(
        name: "name",
        urlString: "",
        openingCrawl: "",
        episodeId: 0,
        producer: "",
        releaseDate: "",
        characters: [],
        planets: [],
        starships: [],
        species: []
    )
    
    static let peopleResponse = PeopleResponse(
        count: 0,
        next: "",
        previous: "",
        results: [peopleModel]
    )
    
    static let planetsResponse = PlanetsResponse(
        count: 0,
        next: "",
        previous: "",
        results: [planetModel]
    )
    
    static let starShipResponse = StarShipResponse(
        count: 0,
        next: "",
        previous: "",
        results: [starShipModel]
    )
    
    static let specieResponse = SpecieResponse(
        count: 0,
        next: "",
        previous: "",
        results: [specieModel]
    )
    
    static let vehicleResponse = VehicleResponse(
        count: 0,
        next: "",
        previous: "",
        results: [vehicleModel]
    )
}
