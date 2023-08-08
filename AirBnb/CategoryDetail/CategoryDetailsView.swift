//
//  CategoryDetailsView.swift
//  AirBnb
//
//  Created by Zeynep Sevgi on 6.08.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryDetailsView: View {
    
    //    let category:String
    let category: DataModel
    
    @ObservedObject var vm: CategoryDetailsViewModel = CategoryDetailsViewModel()
    init(category: DataModel) {
        self.category=category
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
                        let listing = place.listing
                        if listing != nil {
                            VStack( alignment: .leading, spacing: 0){
                                WebImage(url: URL(string: (listing!.contextualPictures.first!.picture)))
                                    .resizable()
                                    .indicator(.activity)
                                    .aspectRatio(1, contentMode: .fit)
                                Text(listing!.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding()
                            }.padding()
                        }
                    }
                    
                }
            }
        }.navigationBarTitle("Category", displayMode: .inline).onAppear{
            vm.getCategory(categoryId: category.id)
            
        }
        
    }
}




