////
////  APIService.swift
////  AirBnb
////
////  Created by Zeynep Sevgi on 4.08.2023.
////

import Foundation
import SwiftUI

struct CategoriesResponse:Decodable, Hashable {
    //let status: Bool
    //let message: String
    //let timestamp: Int32
    let data: [DataModel]?
}
struct DataModel : Decodable, Hashable {
    let id: String
    let title: String
    let image: String
}

struct CategoryResponse: Decodable, Hashable {
    let data : Data
}
struct Data : Decodable, Hashable {
    let homes : [Home]
}

struct Home : Decodable, Hashable {
    let listing : Listing?
}
struct Listing : Decodable, Hashable {
    let name : String
    let contextualPictures: [Picture]
}

struct Picture : Decodable, Hashable {
    let picture : String
}

enum NetworkError : Error {
    case invalidURL
    case invalidURLRequest
    case invalidResponse
}

class APIService {
    
    let headers = [
        "X-RapidAPI-Key": "67849d8aabmshc6b98652cf33692p1a1424jsnff57ff9ff110",
        "X-RapidAPI-Host": "airbnb-search.p.rapidapi.com"
    ]
    
    func getCategories(competion: @escaping(CategoriesResponse?) -> ()){
        
        let demoResponse=CategoriesResponse(data:[DataModel(id: "Tag:8678",
                                                            title: "Rooms", image: "https://a0.muscache.com/pictures/7630c83f-96a8-4232-9a10-0398661e2e6f.jpg"),
                                                  DataModel(id: "Tag:7769",
                                                            title: "Beach", image: "https://a0.muscache.com/pictures/10ce1091-c854-40f3-a2fb-defc2995bcaf.jpg"),
                                                  DataModel(id: "Tag:8661",
                                                            title: "Trending",
                                                            image: "https://a0.muscache.com/pictures/3726d94b-534a-42b8-bca0-a0304d912260.jpg"),
                                                  DataModel(id: "Tag:677",
                                                            title: "Amazing pools",
                                                            image: "https://a0.muscache.com/pictures/3fb523a0-b622-4368-8142-b5e03df7549b.jpg"
                                                           ),
                                                  DataModel(id: "Tag:8536",
                                                            title: "Amazing views",
                                                            image: "https://a0.muscache.com/pictures/3b1eb541-46d9-4bef-abc4-c37d77e3c21b.jpg"
                                                           ),
                                                  DataModel( id: "Tag:8144",
                                                             title: "Lake",
                                                             image: "https://a0.muscache.com/pictures/a4634ca6-1407-4864-ab97-6e141967d782.jpg"
                                                           ),
                                                  DataModel( id: "Tag:8658",
                                                             title: "Play",
                                                             image: "https://a0.muscache.com/pictures/f0c5ca0f-5aa0-4fe5-b38d-654264bacddf.jpg"
                                                           ),
                                                  DataModel(id: "Tag:8662",
                                                            title: "New",
                                                            image: "https://a0.muscache.com/pictures/c0fa9598-4e37-40f3-b734-4bd0e2377add.jpg"
                                                           ),
                                                  DataModel(id: "Tag:7765",
                                                            title: "Skiing",
                                                            image: "https://a0.muscache.com/pictures/c8bba3ed-34c0-464a-8e6e-27574d20e4d2.jpg"
                                                           ),
                                                  DataModel(id: "Tag:8528",
                                                            title: "Design",
                                                            image: "https://a0.muscache.com/pictures/50861fca-582c-4bcc-89d3-857fb7ca6528.jpg"
                                                           ),
                                                  DataModel( id: "Tag:5731",
                                                             title: "Chef's kitchens",
                                                             image: "https://a0.muscache.com/pictures/ddd13204-a5ae-4532-898c-2e595b1bb15f.jpg"
                                                           ),
                                                  DataModel(id: "Tag:789",
                                                            title: "Beachfront",
                                                            image: "https://a0.muscache.com/pictures/bcd1adc0-5cee-4d7a-85ec-f6730b0f8d0c.jpg"
                                                           ),
                                                  DataModel(id: "Tag:4104",
                                                            title: "Countryside",
                                                            image: "https://a0.muscache.com/pictures/6ad4bd95-f086-437d-97e3-14d12155ddfe.jpg"
                                                           ),
                                                  DataModel(id: "Tag:8543",
                                                            title: "Creative spaces",
                                                            image: "https://a0.muscache.com/pictures/8a43b8c6-7eb4-421c-b3a9-1bd9fcb26622.jpg"
                                                           ),
                                                  DataModel(id: "Tag:8521",
                                                            title: "Grand pianos",
                                                            image: "https://a0.muscache.com/pictures/8eccb972-4bd6-43c5-ac83-27822c0d3dcd.jpg"
                                                           ),
                                                  DataModel(id: "Tag:8538",
                                                            title: "Bed & breakfasts",
                                                            image: "https://a0.muscache.com/pictures/5ed8f7c7-2e1f-43a8-9a39-4edfc81a3325.jpg"
                                                           ),
                                                  DataModel(id: "Tag:5348",
                                                            title: "Cabins",
                                                            image: "https://a0.muscache.com/pictures/732edad8-3ae0-49a8-a451-29a8010dcc0c.jpg"
                                                           ),
                                                  DataModel(id: "Tag:8522",
                                                            title: "Lakefront",
                                                            image: "https://a0.muscache.com/pictures/677a041d-7264-4c45-bb72-52bff21eb6e8.jpg"
                                                           ),
                                                  DataModel(id: "Tag:8186",
                                                            title: "Tiny homes",
                                                            image: "https://a0.muscache.com/pictures/35919456-df89-4024-ad50-5fcb7a472df9.jpg"
                                                           ),
                                                  DataModel(id: "Tag:8101",
                                                            title: "Vineyards",
                                                            image: "https://a0.muscache.com/pictures/60ff02ae-d4a2-4d18-a120-0dd274a95925.jpg"
                                                           ),
                                                  DataModel(id: "Tag:8526",
                                                            title: "Surfing",
                                                            image: "https://a0.muscache.com/pictures/957f8022-dfd7-426c-99fd-77ed792f6d7a.jpg"
                                                           ),
                                                  DataModel( id: "Tag:8525",
                                                             title: "Golfing",
                                                             image: "https://a0.muscache.com/pictures/6b639c8d-cf9b-41fb-91a0-91af9d7677cc.jpg"
                                                           ),
                                                  DataModel(id: "Tag:8175",
                                                            title: "Farms",
                                                            image: "https://a0.muscache.com/pictures/aaa02c2d-9f0d-4c41-878a-68c12ec6c6bd.jpg"
                                                           ),
                                                  DataModel(id: "Tag:634",
                                                            title: "Camping",
                                                            image: "https://a0.muscache.com/pictures/ca25c7f3-0d1f-432b-9efa-b9f5dc6d8770.jpg"
                                                           ),
                                                  DataModel(id: "Tag:1073",
                                                            title: "Boats",
                                                            image: "https://a0.muscache.com/pictures/687a8682-68b3-4f21-8d71-3c3aef6c1110.jpg"
                                                           ),
                                                  DataModel(id: "Tag:8115",
                                                            title: "Mansions",
                                                            image: "https://a0.muscache.com/pictures/78ba8486-6ba6-4a43-a56d-f556189193da.jpg"
                                                           ),
                                                  DataModel(id: "Tag:8159",
                                                            title: "Barns",
                                                            image: "https://a0.muscache.com/pictures/f60700bc-8ab5-424c-912b-6ef17abc479a.jpg"
                                                           ),
                                                  DataModel( id: "Tag:5366",
                                                             title: "Ski-in/out",
                                                             image: "https://a0.muscache.com/pictures/757deeaa-c78f-488f-992b-d3b1ecc06fc9.jpg"
                                                           ),
                                                  DataModel( id: "Tag:8226",
                                                             title: "Off-the-grid",
                                                             image: "https://a0.muscache.com/pictures/9a2ca4df-ee90-4063-b15d-0de7e4ce210a.jpg"
                                                           ),
        ])
        
        competion(demoResponse)
        
        //        let request = NSMutableURLRequest(url: NSURL(string: "https://airbnb-search.p.rapidapi.com/categories?query=New%20York%2C%20NY&language_code=en-US")! as URL,
        //                                          cachePolicy: .useProtocolCachePolicy,
        //                                          timeoutInterval: 10.0)
        //        request.httpMethod = "GET"
        //        request.allHTTPHeaderFields = headers
        //
        //        let session = URLSession.shared
        //        session.dataTask(with: request as URLRequest){ data, response, error in
        //            if let error = error {
        //                print(error.localizedDescription)
        //                competion(nil)
        //            } else if let data = data {
        //                //bütün datayı çekip işleme işlemi
        //                if let decodedResponse = try? JSONDecoder().decode(CategoryResponse?.self, from: data) {
        //                    print(decodedResponse)
        //                    competion(decodedResponse)
        //                }
        //
        //            }
        //        }.resume()
        //
    }
    
    
    func getCategory(categoryId:String?,competion: @escaping(CategoryResponse?) -> ()){
      
        let response = CategoryResponse(data: Data(homes: [
            Home(listing: Listing(name: "Luxurious Boutique Studio Red Hook Brooklyn", contextualPictures: [
                Picture(picture: "https://a0.muscache.com/im/pictures/2f6a7d5a-7a23-49bd-a3ec-265edc24ef20.jpg?im_w=720")
            ])),
            Home(listing: Listing(name: "Beautiful Penthouse Suite with skyline views!", contextualPictures: [
                Picture(picture: "https://a0.muscache.com/im/pictures/9e086ee8-2ea0-4c35-82f9-dfff4c9aedbe.jpg?im_w=720")
            ])),
            Home(listing: Listing(name: "Individual Cubicle Room in NYC/Mixed Floor", contextualPictures: [
                Picture(picture: "https://a0.muscache.com/im/pictures/miso/Hosting-53751580/original/ce7a5220-6d08-4cd4-b38b-f7ba877b33e9.jpeg?im_w=720")
            ])),
            Home(listing: Listing(name: "Skyline views in Lower Manhattan", contextualPictures: [
                Picture(picture: "https://a0.muscache.com/im/pictures/miso/Hosting-53843545/original/0d909786-f531-48da-8008-b4ae698c5193.jpeg?im_w=720")
            ])),
            Home(listing: Listing(name: "Master Bedroom with Private Bathroom", contextualPictures: [
                Picture(picture: "https://a0.muscache.com/im/pictures/airflow/Hosting-1467214/original/1fddec62-e0cd-4b2f-a568-21e9feca2f2f.jpg?im_w=720")
            ])),
            Home(listing: Listing(name: "Sonder Battery Park | Studio Apartment", contextualPictures: [
                Picture(picture: "https://a0.muscache.com/im/pictures/prohost-api/Hosting-44799007/original/61781941-88e8-49b0-9648-0f94715426f9.jpeg?im_w=720")
            ])),
        ]))
//        let response = CategoryResponse(data:Data(homes: [Home(listing: Listing(name: "Luxurious Boutique Studio Red Hook Brooklyn", contextualPictures: [Picture(picture: "https://a0.muscache.com/im/pictures/2f6a7d5a-7a23-49bd-a3ec-265edc24ef20.jpg?im_w=720")]))]))
        competion(response)
        
        //        let request = NSMutableURLRequest(url: NSURL(string: "https://airbnb-search.p.rapidapi.com/property/search?query=New%20York%2C%20NY")! as URL,
        //                                          cachePolicy: .useProtocolCachePolicy,
        //                                          timeoutInterval: 10.0)
        //        if categoryId != nil{
        //            request.url?.append(queryItems: [URLQueryItem(name: "category", value: categoryId)])
        //        }
        //
        //        print(request.url)
        //        request.httpMethod = "GET"
        //        request.allHTTPHeaderFields = headers
        //
        //        let session = URLSession.shared
        //        session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        //            if let error = error {
        //                print(error.localizedDescription)
        //                competion(nil)
        //            } else if let data = data {
        //                //bütün datayı çekip işleme işlemi
        //                let res=try? JSONDecoder().decode(CategoryResponse?.self, from: data)
        //                print(res?.data ?? data)
        //                if let decodedResponse = try? JSONDecoder().decode(CategoryResponse?.self, from: data) {
        //                    print(decodedResponse)
        //                    competion(decodedResponse)
        //                } else {
        //                    competion(nil)
        //                }
        //
        //            }
        //        }).resume()
        
        
    }
}

