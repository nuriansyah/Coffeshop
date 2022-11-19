//
//  CoffeShopListUIView.swift
//  CoffeShop Finder
//
//  Created by Nuriansyah Malik on 19/11/22.
//

import SwiftUI

struct CoffeShopListUIView: View {
    @State private var searchText: String = ""
    private var coffeShopSearch: [Coffeeshop] {
        let result = Coffeeshop.CoffeeshopProvider.all()
        
        if searchText.isEmpty{
            return result
        }else{
            return result.filter{
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    private var suggestedCoffeShopSearch: [Coffeeshop]{
        if searchText.isEmpty{
            return []
        }else{
            return coffeShopSearch
        }
    }
    
    var body: some View {
        NavigationStack{
            List(coffeShopSearch) { results in
                NavigationLink(destination:{
                    CoffeShopDetailUIView(coffeShopDetails: results)
                }){
                    HStack{
                        Image(results.image)
                            .resizable()
                            .frame(width: 120, height: 120)
                            .cornerRadius(20)
                            .padding(.trailing)
                        VStack(alignment: .leading, spacing: 10){
                            Text("\(results.name)")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("\(results.location)")
                                .font(.body)
                                .foregroundColor(Color(.gray))
                            Text("Rating: 4/5")
                                .font(.caption)
                                .foregroundColor(Color(.lightGray))
                        }
                    }
                }
            }
            .navigationTitle("CoffeShop")
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search your coffeshop"
            ){
                ForEach(coffeShopSearch) { search in
                    Text("Looking For \(search.name) ?")
                        .searchCompletion(search.name)
                }
            }
        }
        
    }
}

struct CoffeShopListUIView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeShopListUIView()
    }
}
