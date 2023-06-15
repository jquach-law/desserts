//
//  DessertData.swift
//  Desserts
//
//  Created by user241379 on 6/12/23.
//

import Foundation


func getDessertList(endpoint: String) async throws -> [Dessert]{
    
    guard let url = URL(string: endpoint) else {
        throw GetError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw GetError.invalidResponse
    }
    
    do {
        let decoder = JSONDecoder()
        let mealsJSON = try decoder.decode(Meals.self, from: data)
        return mealsJSON.meals
    } catch {
        throw GetError.invalidData
    }
}

enum GetError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

