 //
 //  AddOrderView.swift
 //  SwiftUI-CoreData
 //
 //  Created by Moh Zinnur Atthufail Addausi on 15/09/20.
 //  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
 //
 
 import SwiftUI
 
 struct AddOrderView: View {
    
    @Binding var isPresenting : Bool
    @State var addorderviewmodel = AddOrderViewModel()
    var body: some View {
        
        NavigationView{
            
            Group{
                VStack{
                    TextField("enter name", text: self.$addorderviewmodel.name)
                    Picker(selection: self.$addorderviewmodel.type, label: Text("")){
                        Text("cappuscino").tag("cap")
                        Text("regular").tag("reg")
                        Text("espresso").tag("ex")
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    Button("palce order"){
                        
                        self.addorderviewmodel.save()
                        self.isPresenting = false
                        
                    }.padding(5)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(10 )
    
                }
            }.padding()
        }
        
    }
 }
 
 struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(isPresenting: .constant(false))
    }
 }
