//
//  PopularPlaceView.swift
//  AirBnb
//
//  Created by Zeynep Sevgi on 2.08.2023.
//

import SwiftUI

struct PopularPlaceView: View {
    let destintions : [Destination] = [
        .init(name: "Mikonos", country: "Yunanistan", imageName: "yunanistan"),
        .init(name: "Mikonos", country: "Yunanistan", imageName: "yunanistan"),
        .init(name: "Mikonos", country: "Yunanistan", imageName: "yunanistan"),

    
    ]
    @State private var categoryResponse:CategoryResponse?=nil
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular places")
                    .font(.system(size: 13, weight:.semibold))
                Spacer()
                Text("...")
            }.padding(.horizontal)
                .foregroundColor(Color.pink)
                .padding(.top)
            
            ScrollView(.vertical) {
                VStack(spacing: 19) {
                    ForEach(destintions,id: \.self) { destination in
                        VStack(alignment: .center) {
                            
                            ZStack {
                                Image(systemName: destination.imageName)
                                    .resizable()
                                    .scaledToFill()
                                Button(action: {}) {
                                    Image(systemName: "heart")
                                        .foregroundColor(Color.white)
                                        .frame(width: 165,height: 121,alignment: .topTrailing)
                                }

                            }
                            
                            HStack {
                                Spacer()
                            }
                            
                            Spacer()
                            
                            Text("Mikonos")
                                .font(.system(size: 12,weight: .semibold))
                                .padding(.horizontal, 12)
                            Text("Yunanistan")
                                .font(.system(size: 13,weight: .semibold))
                                .foregroundColor(Color.gray)
                                .padding(.horizontal, 12)
                                .padding(.bottom,8)
                            
                        }
                        .frame(width: 190,height: 200)
                        .background(Color(.init(white: 0.9, alpha: 1 )))
                        .cornerRadius(5)
                        .shadow(color: .gray, radius: 4, x:4.0, y: 2)
                        .padding(.leading)
                    }
                }.padding(.horizontal)
            }
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
