//
//  Main.swift
//  MyGame
//
//  Created by kxx: on 2023/02/17.
//

import SwiftUI

struct Main: View {
    @EnvironmentObject var vm: MainViewModel
    
    @State var showScreen: Bool = false
    @State var questFieldText: String = "???"
    @State private var fullScreen: Bool = false
    
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

            Text("30")
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
            Text("Next Quest: \(questFieldText)")
                .frame(maxWidth: .infinity, alignment: .center)
                .fullScreenCover(isPresented: $fullScreen) {
                    NextQuestView(questFieldText: $questFieldText, fullScreen: $fullScreen)
                }
        }

    }
    
    var listView: some View {
        List {
            ForEach(vm.getKeys(), id: \.self) { key in
                Section(key) {
                    ForEach(vm.getGroupedQuest()[key]!) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("\(item.score)")
                                .foregroundColor(.blue)
                                .padding(.horizontal,6)
                                .background {
                                    RoundedRectangle(cornerRadius: 5).stroke()
                                        .foregroundColor(.blue)
                                }

                        }
                        }
                    }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
    }
    
    var emptyView: some View {
        VStack {
            Text("is Empty")
        }
    }
}

