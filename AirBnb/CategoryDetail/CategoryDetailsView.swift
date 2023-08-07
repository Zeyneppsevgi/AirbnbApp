//
//  CategoryDetailsView.swift
//  AirBnb
//
//  Created by Zeynep Sevgi on 6.08.2023.
//

import SwiftUI

struct CategoryDetailsView: View {
    
    //    let category:String
    let category: DataModel
    
    @ObservedObject var vm: CategoryDetailsViewModel
    init(category: DataModel) {
        self.category=category
        
        self.vm = CategoryDetailsViewModel()
        
        vm.getCategory(categoryId: category.id)
    }
    var body: some View {
        ZStack {
            if vm.isLoading {
                VStack{
                    ActivityIndicatorView()
                    Text("Loading..")
                        .foregroundColor(.white)
                        .font(.system(size: 14,weight: .semibold))
                    
                }.padding()
                    .background(Color.pink)
                    .cornerRadius(30)
                
            } else {
                ScrollView {
                    ForEach(vm.places, id: \.self) { place in
                        VStack( alignment: .leading, spacing: 0){
                            //place.listing.contextualPictures.first?.picture
                            Image("yunanistan")
                                .resizable()
                                .scaledToFill()
                            Text(place.listing.name)
                                .font(.system(size: 12, weight: .semibold))
                                .padding()
                            //.asTile()
                        }.padding()
                    }
                    
                }
            }
        }.navigationBarTitle("Category", displayMode: .inline)
        
    }
}




