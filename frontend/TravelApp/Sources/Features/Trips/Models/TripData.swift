//
//  TripData.swift
//  TravelApp
//
//  Created by Rachel Pratt on 11/2/23.
//

import Foundation

var trips: [Trip] = loadTrip("tripData.json")


func loadTrip<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        print("Couldn't find \(filename) in main bundle.")
        return [] as! T
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        print("Couldn't load \(filename) from main bundle:\n\(error)")
        return [] as! T
    }


    do {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return try decoder.decode(T.self, from: data)
    } catch {
        print("Couldn't parse \(filename) as \(T.self):\n\(error)")
        return [] as! T
    }
}
