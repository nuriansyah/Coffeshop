//
//  CoffeShopDetailUIView.swift
//  CoffeShop Finder
//
//  Created by Nuriansyah Malik on 19/11/22.
//

import SwiftUI

struct CoffeShopDetailUIView: View {
    let coffeShopDetails: Coffeeshop
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(colors: [.clear, .accentColor], startPoint: .leading, endPoint: .trailing)
                    .ignoresSafeArea()
                VStack (alignment: .center){
                    Image(coffeShopDetails.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 250,height: 250)
                            .clipShape(Circle())
                            .overlay {
                                ZStack {
                                    Circle()
                                        .opacity(0.8)
                                    
                                    VStack {
                                        Image(systemName: "person.crop.circle.fill.badge.plus").renderingMode(.original).foregroundColor(.blue) 
                                            .font(.system(size: 80))
                                            .foregroundColor(.blue)
                                        
                                        Text("\(coffeShopDetails.name)")
                                    }
                                    .foregroundColor(.white)
                                    .font(.system(.title2, design: .rounded))
                                    .fontWeight(.bold)
                                }
                                
                        }
                    Text("\(coffeShopDetails.review)")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding()
                    HStack{
                        Image(systemName: "mappin.and.ellipse")
                        Text("\(coffeShopDetails.location)")
                    }
                    .font(.title3)
                    .fontWeight(.medium)
                    
                }
                
            }
        }
    }
}

struct CoffeShopDetailUIView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeShopDetailUIView(coffeShopDetails: Coffeeshop(image: "kilogram", name: "Kopi Gandapoera", location: "Jl. Gandapura No. 14, Kota Bandung", review: "Taste of kopi gula aren is good and the place so comfortable for WFC 😍"))
    }
}
