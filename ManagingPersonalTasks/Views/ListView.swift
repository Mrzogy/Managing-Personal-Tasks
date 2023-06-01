//
//  ListView.swift
//  ManagingPersonalTasks
//
//  Created by 3bood on 12/11/1444 AH.
//

import SwiftUI

struct ListView: View {
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first title!", isCompleted: false),
        ItemModel(title: "This is the second title!", isCompleted: true),
        ItemModel(title: "This is the third title!", isCompleted: false)
    ]
    var body: some View {
        List{
            ForEach(items) { item in
               ListRowView(item: item)
    
            }
            .onDelete (perform: deleteItem)
            .onMove(perform: moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
        NavigationLink("Add", destination: AddView())
        )
    }
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int) {
        items .move(fromOffsets: from, toOffset: to)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}


