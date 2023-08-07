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
    //network code will happen here
    
    func getCategory(categoryId:String){
        print("aaaaaaaaaaaaaaaaaa",categoryId)
        APIService().getCategory(categoryId: categoryId){(categoryResponse) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isLoading = false
                
                if (categoryResponse != nil && categoryResponse?.data != nil){
                    self.places=(categoryResponse?.data)!
                }
            }
        }
    }
}


