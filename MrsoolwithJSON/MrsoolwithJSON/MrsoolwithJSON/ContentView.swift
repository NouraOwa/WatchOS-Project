//
//  ContentView.swift
//  MrsoolwithJSON
//
//  Created by Noura Alowayid on 07/11/1444 AH.
//

import SwiftUI

struct RestaurantModel: Identifiable, Codable{
    var id = UUID().uuidString
    var itemImage : String
    var itemName: String
    var itemRate: String
    var itemPrice: String
    var itemLocation: String
}
//    enum CodingKeys: String, CodingKey {
//        case id
//        case itemImage
//        case itemName
//        case itemRate
//        case itemPrice
//        case itemLocation
//    }
//    init(id: String = UUID().uuidString, itemImage: String, itemName: String, itemRate: String, itemPrice: String, itemLocation: String) {
//        self.id = id
//        self.itemImage = itemImage
//        self.itemName = itemName
//        self.itemRate = itemRate
//        self.itemPrice = itemPrice
//        self.itemLocation = itemLocation
//    }
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.itemImage = try container.decode(String.self, forKey: .itemImage)
//        self.itemName = try container.decode(String.self, forKey: .itemName)
//        self.itemRate = try container.decode(String.self, forKey: .itemRate)
//        self.itemPrice = try container.decode(String.self, forKey: .itemPrice)
//        self.itemLocation = try container.decode(String.self, forKey: .itemLocation)
//
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container (keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(itemImage, forKey: .itemImage)
//        try container.encode(itemName, forKey: .itemName)
//        try container.encode(itemRate, forKey: .itemRate)
//        try container.encode(itemPrice, forKey: .itemPrice)
//        try container.encode(itemLocation, forKey: .itemLocation)
//
//    }

    class CodableViewModel: ObservableObject{
        @Published var restaurant: RestaurantModel? = nil
        init() {
            getData ()
        }
        func getData() {
            guard let data = getJSONData() else {return }
            self.restaurant = try? JSONDecoder () .decode (RestaurantModel.self, from: data)
            
            //        do {
            //            self.restaurant = try JSONDecoder () .decode (RestaurantModel.self, from: data)
            //        } catch let error {
            //                        print ("Error decoding. \(error)")
            //        }
            //        if
            //        let localData = try? JSONSerialization.jsonObject(with: data, options: []),
            //        let dictionary = localData as? [String:Any],
            //        let id = dictionary["id"] as? String,
            //        let itemImage = dictionary["itemImage"] as? String,
            //        let itemName = dictionary["itemName"] as? String,
            //        let itemRate = dictionary["itemRate"] as? String,
            //        let itemPrice = dictionary["itemPrice"] as? String,
            //        let itemLocation = dictionary["itemLocation"] as? String {
            //            let newRestaurant = RestaurantModel(id: id, itemImage: itemImage, itemName: itemName, itemRate: itemRate, itemPrice: itemPrice, itemLocation: itemLocation)
            //            restaurant = newRestaurant
            // }
        }
        func getJSONData () -> Data? {
            let restaurant = RestaurantModel(id: "1234", itemImage: "mac", itemName: "McDonald's", itemRate: "4.1", itemPrice: "Delivery 9 SAR", itemLocation: "3.2 km")
            let jsonData = try? JSONEncoder ( ).encode (restaurant)
                                         
//            let dictionary: [String:Any] = [
//                "id": "1234",
//                "itemImage": "mac",
//                "itemName": "McDonald's",
//                "itemRate": "4.1",
//                "itemPrice": "Delivery 9 SAR",
//                "itemLocation": "3.2 km"
//            ]
//            let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
            return jsonData
        }
    }
    
    
struct ContentView: View {
    @StateObject var vm = CodableViewModel()
    @State private var data: [String: String] = [:]
    
    func update(key: String, value: String) {
        data[key] = value
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(data)
            try data.write(to: URL(fileURLWithPath: "data.json"))
        } catch {
            print(error)
        }
    }
    
    func delete(key: String) {
        data.removeValue(forKey: key)
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(data)
            try data.write(to: URL(fileURLWithPath:"data.json"))
        } catch {
            print(error)
        }
    }
    
    init() {
         data = ["id": "1234", "itemImage": "mac", "itemName": "McDonald's", "itemRate": "4.1", "itemPrice": "Delivery 9 SAR", "itemLocation": "3.2 km"]
     }
    var body: some View {
        VStack {
            if let restaurant = vm.restaurant{
                Text(restaurant.id)
                Text(restaurant.itemImage)
                Text(restaurant.itemName)
                Text(restaurant.itemPrice)
                Text(restaurant.itemLocation)
                Text(restaurant.itemRate)
            }
            List(data.keys.sorted(), id: \.self) { key in
                Text(key)
                    .onTapGesture {
                        update(key: "id", value: "4321")
                    }
            }
            Button(action: {
                delete(key: "itemImage")
            }) {
                Text("Delete")
            }
        }
        .onAppear(perform: read)

        }
    
    func read() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath:"data.json"))
            let decodedData = try decoder.decode([String: String].self, from: data)
            self.data = decodedData
        } catch {
            print(error)
        }
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
