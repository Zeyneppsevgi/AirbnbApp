//
//  PopularPlacesViewModel.swift
//  AirBnb
//
//  Created by Zeynep Sevgi on 7.08.2023.
//

import Foundation

class PopularPlacesViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places = [Home]()
    //network code will happen here
    
    func getPopularPlaces(){
     
        APIService().getCategory(categoryId: nil){(categoryResponse) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isLoading = false
                
                if (categoryResponse != nil && categoryResponse?.data != nil && categoryResponse?.data.homes != nil){
                    self.places=(categoryResponse?.data.homes)!
                }
            }
        }
    }
}
