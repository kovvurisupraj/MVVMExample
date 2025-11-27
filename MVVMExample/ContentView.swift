//
//  ContentView.swift
//  MVVMExample
//
//  Created by Supraj Kovvuri on 11/27/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ProductListViewModel(webservice: Webservice())
    
    var body: some View {
        List(vm.products){
            product in Text(product.title)
        }.task {
            await vm.populateProducts()
        }
    }
}

#Preview {
    ContentView()
}
