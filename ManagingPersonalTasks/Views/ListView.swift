//
//  ListView.swift
//  ManagingPersonalTasks
//
//  Created by 3bood on 12/11/1444 AH.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewMdel
   
    var body: some View {
        List{
            ForEach(listViewModel.items) { item in
               ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete (perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
        NavigationLink("Add", destination: AddView())
        )
    }
  
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewMdel())
    }
}


