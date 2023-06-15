//
//  Row.swift
//  Desserts
//
//  Created by user241379 on 6/14/23.
//

import SwiftUI

struct DessertRow: View {
    var dessert: Dessert
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: dessert.strMealThumb)) { image in
                image.resizable()
            } placeholder: {
                Rectangle()
                    .foregroundColor(.secondary)
            }
            .frame(width: 50, height: 50)

            Text(dessert.strMeal)
            
            Spacer()
        }
    }
}
