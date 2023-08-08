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
                                       // .aspectRatio(1, contentMode: .fit)
                                        .frame(width: 200, height: 200)
                                    Text(listing!.name)
                                        .font(.system(size: 12, weight: .semibold))
                                        .padding(.bottom)
                                    Spacer()
                                }
                                .frame(width: 280,height: 250)
                                .background(Color(.init(white: 0.9, alpha: 1 )))
                                .cornerRadius(10)
                                .shadow(color: .pink, radius: 4, x:4.0, y: 2)
                                .padding(.leading)
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
