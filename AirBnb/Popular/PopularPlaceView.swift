//
//  PopularPlaceView.swift
//  AirBnb
//
//  Created by Zeynep Sevgi on 2.08.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct PopularPlaceView: View {
 
    
    @ObservedObject var vm: PopularPlacesViewModel = PopularPlacesViewModel()
    @State private var categoryResponse:CategoryResponse?=nil
    @State private var isFavorite : [Bool] = Array(repeating: false, count: 90)
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular places")
                    .font(.system(size: 13, weight:.semibold))
                Spacer()
            }.padding(.horizontal)
                .foregroundColor(Color.pink)
                .padding(.top)
            if vm.isLoading {
                VStack{
                    ActivityIndicatorView()
                        .padding(.all)
                    Text("Loading..")
                        .foregroundColor(.white)
                        .font(.system(size: 14,weight: .semibold))
                    
                }.padding()
                    .background(Color.pink)
                    .cornerRadius(30)
                
            } else {
                ScrollView(.vertical) {
                    VStack(spacing: 19) {
                        ForEach(vm.places,id: \.self) { place in
                            let listing = place.listing
                            if listing != nil {
                                VStack(alignment: .center) {
                                    WebImage(url: URL(string: (listing!.contextualPictures.first!.picture)))
                                        .resizable()
                                        .indicator(.activity)
                                        .frame(width: 300, height: 250)
                                    
                                    Text(listing!.name)
                                        .font(.system(size: 10, weight: .semibold))
                                        .padding(.bottom)
                                    
                                    
                                    Spacer()
                                    if let listing = listing, let index = vm.places.firstIndex(of: place) {
                                        Button(action: {
                                            isFavorite[index].toggle()
                                            
                                        }) {
                                            Image(systemName: isFavorite[index] ? "heart.fill" : "heart")
                                                .foregroundColor(isFavorite[index] ? .pink : .black)
                                                .padding(.all, 8)
                                                .background(Color.white)
                                                .clipShape(Circle())
                                                .scaleEffect(isFavorite[index] ? 1.2 : 1.0) // İçi dolu olduğunda büyütmek için
                                                .animation(.spring())
                                        }
                                        .padding(.horizontal, 99.0)
                                        .padding([.top, .trailing], -258.0)
                                    }}
                                .frame(width: 300,height: 250)
                                .background(Color(.init(white: 0.9, alpha: 1 )))
                                .cornerRadius(40)
                                .shadow(color: .pink, radius: 4, x:4.0, y: 2)
                                .padding(.all)
                            }
                        }.padding(.horizontal)
                    }
                    
                }
            }
            
        }.onAppear{
            vm.getPopularPlaces()
        }
    }
}

struct CustomModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.pink)
            .cornerRadius(5)
    }
}

struct PopularPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        PopularPlaceView()
        AirbnbView()
        
    }
}
