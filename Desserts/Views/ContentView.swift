//
//  ContentView.swift
//  Desserts
//
//  Created by user241379 on 6/12/23.
//

import SwiftUI

struct ContentView: View {
    let stringURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    
    @State private var desserts: [Dessert]?

    var body: some View {
        VStack {
            if let desserts {
                DessertList(desserts: desserts)
            } else {
                Text("No dessert data available.")
            }
        }
        .task {
            do {
                desserts = try await getDessertList(endpoint: stringURL)
            } catch GetError.invalidURL {
                print("invalid URL")
            } catch GetError.invalidResponse {
                print("invalid reponse")
            } catch GetError.invalidData {
                print("invalid data")
            } catch {
                print("unexpected error")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
