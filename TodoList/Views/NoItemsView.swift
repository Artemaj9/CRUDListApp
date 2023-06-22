//
//  NoItemsView.swift
//  TodoList
//
//  Created by Artem on 23.06.2023.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool  = false
    let secondaryAccentColor = Color("SeconadaryAccentColor")
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you pruductive person? I yhink you should click the add button and add a bunch of items to your todo list!")
                    .padding(.bottom,30)
                NavigationLink(destination: AddView()) {
                    Text("Add Something! 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.purple : Color.pink)
                       // .background(Color.mint)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? Color.purple.opacity(0.3) : Color.pink.opacity(0.3),
                    radius: animate ? 30 : 10,
                    x: 0.0,
                    y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear (perform: addAnimation)
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        func addAnimation() {
            guard !animate else {return}
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { withAnimation(
            Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
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
