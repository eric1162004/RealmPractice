//
//  ProductContentView.swift
//  RealmPractice
//
//  Created by Chun Hong Cheung on 2022-03-16.
//

import SwiftUI

struct ProductContentView: View {
    
    @EnvironmentObject var productVM: ProductViewModel
    
    var body: some View {
        // wrap with a navigation view
        NavigationView {
            VStack{
                // a view to add a task
                ProductListView()
//                AddProductView()
            }
//            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ProductListView: View {
    
    // use a task view model
    @EnvironmentObject private var productVM: ProductViewModel
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            NavigationLink (destination: AddProductView()){
                Image(systemName: "plus")
            }
        
            // comment row
            ScrollView(.horizontal){
                HStack(spacing:10){
                    ForEach($productVM.products){ item in
                        CardView(card: Card(
                            prompt: item.title.wrappedValue, answer: String(item.price.wrappedValue)))
                    }
                }
            }
            
            // show comment of the day
            if $productVM.products.count > 0,
               let item = $productVM.products[0] {
                CardView(
                    card: Card(prompt: "Product of the day", answer: item.title.wrappedValue),
                    width: 290,
                    height: 150
                )
            }
            
            Spacer()
            
        }
        .navigationBarTitle("StoreFront")
        .padding()
        .background(.gray)
        
    }
}

struct AddProductView: View {
    
    // store a task title input by the user
    @State private var productTitle: String = ""
    @State private var productPrice: String = ""
    
    // toggle to return to the main navigation view
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // use a task view model
    @EnvironmentObject private var productVM: ProductViewModel
    
    var body: some View {
        VStack{
            VStack(spacing: 20) {
                // text field to take task tile
                TextField("Title", text: $productTitle)

                TextField("Price", text: $productPrice)
            }
            
            Button {
                productVM.addProduct(
                    title: productTitle,
                    price: Float(productPrice) ?? 0)
            } label: {
                Text("Submit")
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 4)
            }
        }
        .navigationTitle("Add an item")
        .padding()
    }
}

struct Card {
    let prompt: String
    let answer: String
}

struct CardView: View {
    let card: Card
    var width: CGFloat = 150.0
    var height: CGFloat = 150.0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
            
            VStack {
                Text(card.prompt)
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                
                Spacer()
                
                Text(card.answer)
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: width, height: height)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 0.5)
        )
    }
}


struct ProductContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductContentView()
    }
}
