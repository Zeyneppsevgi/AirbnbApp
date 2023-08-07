//
//  CategoriesViewModel.swift
//  AirBnb
//
//  Created by Zeynep Sevgi on 6.08.2023.
//

import SwiftUI

class CategoriesViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var categories = [DataModel]()
    //network code will happen here
    init() {
        APIService().getCategories(){(categoryResponse) in
            if (categoryResponse != nil && categoryResponse?.data != nil){
                self.categories=(categoryResponse?.data)!
                self.isLoading = false
            }
            
        }
        
    }
}

