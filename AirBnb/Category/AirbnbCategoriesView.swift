//
//  AirbnbCategoriesView.swift
//  AirBnb
//
//  Created by Zeynep Sevgi on 3.08.2023.
//

import SwiftUI
import Kingfisher
import SDWebImageSwiftUI


struct AirbnbCategoriesView: View {
    @ObservedObject var vm = CategoriesViewModel()
    
    @State var isPresenting = false
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 4) {
                ForEach(vm.categories, id: \.self) { category in
                    NavigationLink(destination:CategoryDetailsView(category: category)){
                        CategoryView(category: category)
                    }
                }
            }.padding(.horizontal)
        }
    }
}

struct CategoryView:View{
    var category:DataModel
    var body: some View {
        
        VStack(alignment: .center, spacing: 3) {
            // KFImage(URL(string: category.image))
            WebImage(url: URL(string: category.image))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 35, height: 35, alignment: .center)
                .scaledToFit()
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray)
                .frame(width: 60, height: 60)
                .background(Color.white)
                .cornerRadius(64)
            Text(category.title)
                .font(.system(size: 12,weight: .semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }.frame(width: 70)
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        
        CategoryView(category:DataModel(id: "123", title: "title1", image: "image")).padding(.top)
        
    }
}
