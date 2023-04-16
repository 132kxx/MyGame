//
//  Main.swift
//  MyGame
//
//  Created by kxx: on 2023/02/17.
//

import SwiftUI

struct Main: View {
    @EnvironmentObject var vm: MainViewModel
    
    @State private var fullScreen: Bool = false
    @State var newItemAlert: Bool = false

    var body: some View {
        VStack {
            headerView
                
            profileImage
                        
            nextQuestBtn

            // activities
            if vm.quest.count > 0 {
                listView
            } else {
                Spacer()

                emptyView
            }
            
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
            .environmentObject(MainViewModel())
    }
}

// MARK: COMPONENT
extension Main {
    var headerView: some View {
        HStack {
            Text("CLASS")
                .fontWeight(.bold)
            Text("CEO")
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
            Spacer()
            
            Text("POWER")
                .fontWeight(.bold)

            Text("\(vm.plusScore())")
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
            }
            .padding(.horizontal, 50)
            .padding(.bottom, 50)
    }
    
    var profileImage: some View {
            Image("person")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 80))
                .frame(width: 250, height: 250)
                .shadow(radius: 10)
                .aspectRatio(contentMode: .fill)
                .padding(.bottom, 40)
                
    }
    
    var nextQuestBtn: some View {
        Button {
            fullScreen.toggle()
        } label: {
            Text("Next Quest: \(vm.quest[0].task)")
                .overlay {
                    if newItemAlert {
                        Circle()
                            .foregroundColor(.red)
                            .frame(height: 10)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .offset(x: 10, y: -10)
                    }
                }
        }
        .fullScreenCover(isPresented: $fullScreen) {
            NextQuestView(fullScreen: $fullScreen)
        }

    }
    
    var listView: some View {
        List {
            ForEach(vm.getDate(), id: \.self) { date in
                Section(date) {
                    let finished = vm.quest.filter { $0.isFinished == true }
                    let array = finished.filter { $0.date == date }
                    ForEach(array) { element in
                        HStack {
                            Text(element.task)
                            Spacer()
                            Text("\(element.score)")
                        }
                        .listRowSeparator(.hidden)
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
    }
    
    var emptyView: some View {
        VStack {
            Text("is Empty")
        }
    }
}
