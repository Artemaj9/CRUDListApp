//
//  AddView.swift
//  TodoList
//
//  Created by Artem on 22.06.2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack() {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.brightness(0.3))
                    .cornerRadius(10)
                    .padding(.top)
                
                Button (action: {
                    saveButtonPressed()
                    
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.mint)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!! 🤬😱😈"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
