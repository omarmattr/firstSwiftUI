//
//  FormView.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 07/08/2022.
//

import SwiftUI

struct FormView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var birthdate = Date()
    @State var sendNews = false
    @State var numOfLike = 20
    
    
    var body: some View {
        NavigationView {
            Form{
                Section("Personal information") {
                    TextField("First Name",text: $firstName)
                    TextField("Last Name",text: $lastName)
                    DatePicker("Birthdate", selection:$birthdate ,displayedComponents: .date)
                    
                }
                Section("Actions") {
                    Toggle("Send News", isOn: $sendNews).toggleStyle(SwitchToggleStyle(tint: .brown))
                    Stepper("number of likes" , value: $numOfLike,in: 0...100)
                    Text("you have a (\(numOfLike)) likes")
                    Link("Trem of serves",destination: URL(string:"https://google.com")!).foregroundColor(.brown)
                    
                }
            }
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup {
                    Button("save") {
                        hideKeyboard()
                    }
                }
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
extension View{
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),to:nil,
                                        from:nil,for:nil)
    }
}
