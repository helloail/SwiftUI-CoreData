//
//  ContentView.swift
//  SwiftUI-CoreData
//
//  Created by Moh Zinnur Atthufail Addausi on 14/09/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var orderlistVM: OrderListViewModel
    @State private var isPresenting : Bool = false
    
    
    private func delete(at offsets : IndexSet){
        offsets.forEach{index in
            let orderVM = self.orderlistVM.orders[index]
            self.orderlistVM.deleteOrder(orderVM )
        }
    }
    
    
    init(){
        self.orderlistVM = OrderListViewModel()
    }
    var body: some View {
        
        NavigationView{
            List{
                ForEach(self.orderlistVM.orders, id: \.name){ order in
                    HStack{
                        Image(order.type)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                        
                        Text(order.name)
                            .font(.largeTitle)
                            .padding([.leading], 10)
                    }
                    
                }.onDelete(perform:delete)
                
            }
            .sheet(isPresented: $isPresenting, onDismiss: {
                print("ondisimis")
                self.orderlistVM.fetchAllOrder()
            }, content: {
                AddOrderView(isPresenting: self.$isPresenting)
            }) 
                .navigationBarTitle("Orders")
                .navigationBarItems(trailing: Button ("Add New Order"){
                    
                    self.isPresenting = true
                    
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
