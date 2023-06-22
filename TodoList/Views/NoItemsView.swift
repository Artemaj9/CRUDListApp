//
//  NoItemsView.swift
//  TodoList
//
//  Created by Artem on 23.06.2023.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool  = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you pruductive person? I yhink you should click the add button and add a bunch of items to your todo list!")
                    .padding(.bottom,20)
                NavigationLink(destination: AddView()) {
                    Text("Add Something! 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.mint)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear (perform: addAnimation)
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        func addAnimation() {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { withAnimation(.easeInOut) {
                animate.toggle()
            }
            }
            
        }
    }
struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
