//
//  AddView.swift
//  ManagingPersonalTasks
//
//  Created by 3bood on 12/11/1444 AH.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewMdel
    @State var textField: String = ""
    @State var alertTitle: String = ""
    @State var ShowalertTitle: Bool = false
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type Somthing Here ...", text: $textField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                Button {
                    saveButton()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding(14)
            
        }
        .navigationTitle("Add an item")
        .alert(isPresented: $ShowalertTitle, content: getAlert)
    }
    func saveButton() {
        if TextisApproopriate() {
            listViewModel.addItem(title: textField)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func TextisApproopriate() -> Bool {
        if textField.count < 3 {
            alertTitle = "Your New To Do Item Must Be at Least 3 Charctar!!!😡"
            ShowalertTitle.toggle()
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
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewMdel())
    }
}
