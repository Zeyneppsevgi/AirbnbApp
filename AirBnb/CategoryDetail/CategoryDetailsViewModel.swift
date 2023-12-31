//
//  CategoryDetailsViewModel.swift
//  AirBnb
//
//  Created by Zeynep Sevgi on 6.08.2023.
//

import SwiftUI


class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places = [Home]()
    
    
    func getCategory(categoryId:String){
       // print(categoryId)
        APIService().getCategory(categoryId: categoryId){(categoryResponse) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isLoading = false
                
                if (categoryResponse != nil && categoryResponse?.data != nil && categoryResponse?.data.homes != nil){
                    self.places=(categoryResponse?.data.homes)!
                }
            }
        }
    }
}


