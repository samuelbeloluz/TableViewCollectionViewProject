//
//  ProductData.swift
//  TableView&CollectionView
//
//  Created by Samuel Montagnini on 28/10/23.
//

import UIKit

//Introducing data to Business Rule.
struct ProductData {
    var productList: [Product] = [Product(products: ["carro01","carro02","carro03","carro04","carro05"], sectionTitle: "Cars:"),
                                  Product(products: ["moto01","moto02","moto03","moto04","moto05"], sectionTitle: "Motorcycles:"),
                                  Product(products: ["caminhao01","caminhao02","caminhao03","caminhao04","caminhao05"], sectionTitle: "Trucks:"),
                                  Product(products: ["bike01","bike02","bike03","bike04","bike05"], sectionTitle: "Bikes:")]

    
    func countProducts() -> Int{
        return productList.count
    }
}
