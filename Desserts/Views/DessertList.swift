//
//  DessertList.swift
//  Desserts
//
//  Created by user241379 on 6/14/23.
//

import SwiftUI

struct DessertList: View {
    var desserts: [Dessert]
    
    var body: some View {
        NavigationView {
            List(desserts) { dessert in
                NavigationLink {
                    DessertDetail(mealID: dessert.idMeal)
                } label: {
                    DessertRow(dessert: dessert)
                }
            }
            .navigationTitle("Dessert Receipes")
        }
    }
}
