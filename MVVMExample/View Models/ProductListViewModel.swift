//
//  ProductListViewModel.swift
//  MVVMExample
//
//  Created by Supraj Kovvuri on 11/27/25.
//

import Foundation
import Combine

@MainActor
class ProductListViewModel: ObservableObject {
    
    @Published var products: [ProductViewModel] = []
    
    let webservice: Webservice
    
    init(webservice: Webservice) {
        self.webservice = webservice
    }
    
    func populateProducts() async{
        do{
            let products = try await webservice.getProducts()
            self.products = products.map(ProductViewModel.init)
        } catch{
            print(error)
        }
    }
    
}

struct ProductViewModel: Identifiable {
    
    private let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var id: Int{
        product.id
    }
    
    var title: String{
        product.title
    }
    
    var price: Double{
        product.price
    }
}
