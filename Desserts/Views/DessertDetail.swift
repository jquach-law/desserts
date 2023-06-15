//
//  DessertDetail.swift
//  Desserts
//
//  Created by user241379 on 6/14/23.
//

import SwiftUI

struct DessertDetail: View {
    var mealID: String
    let stringURL = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    
    @State private var desserts: [Dessert]?
    
    var body: some View {
        let imageURL = desserts?[0].strMealThumb ?? "image url"
        let dessertName = desserts?[0].strMeal ?? "dessert name"
        let instructions = desserts?[0].strInstructions ?? "desssert instructions"

         ScrollView {
            AsyncImage(url: URL(string: imageURL)) { image in
                image.resizable()
            } placeholder: {
                Rectangle()
                    .foregroundColor(.secondary)
            }
            .ignoresSafeArea(edges: .top)
            .frame(height: 300)
            
            VStack(alignment: .leading) {
                Text(dessertName)
                    .font(.title)
                
                Divider()
                
                Text("Ingredients")
                    .font(.title2)
                    .foregroundColor(.secondary)
                Spacer()
                
                if let desserts {
                    let dessert = desserts[0].toDictionary()
                    ForEach(1...20, id: \.self) { index in
                        if let ingredient = dessert["strIngredient\(index)"] as? String, !ingredient.isEmpty,
                           let measurement = dessert["strMeasure\(index)"] as? String, !measurement.isEmpty {
                            Text("\(measurement) \(ingredient)")
                        }
                    }
                }
                
                Spacer(minLength: 30)
                
                Text("Instructions")
                    .font(.title2)
                    .foregroundColor(.secondary)
                Spacer()
                Text(instructions)
            }
            .padding()
        }
        .task {
            do {
                desserts = try await getDessertList(endpoint: stringURL + mealID)
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

struct DessertDetail_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetail(mealID: "52776")
    }
}
