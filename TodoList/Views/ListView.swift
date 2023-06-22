//
//  ListView.swift
//  TodoList
//
//  Created by Artem on 22.06.2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                        
                        // ListRowView(title: items.t)
                    }
                    .onDelete (perform: listViewModel.deleteItem)
                    .onMove (perform: listViewModel.moveItem)
                    
                }
                .listStyle(.plain)
            }
        }
                // ListRowView(title: "This is the firs title!")
               
                .navigationTitle("Todo List 📝")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                        NavigationLink("Add", destination: AddView())
                    )
            }
    }


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

