//
//  Main.swift
//  MyGame
//
//  Created by kxx: on 2023/02/17.
//

import SwiftUI

struct Main: View {
    
    @State var showScreen: Bool = false
    @EnvironmentObject var vm: MainViewModel
    
    var body: some View {
        VStack {
            headerView
                
            profileImage
            
//            questBtn
            
            Text("Next Quest: ??????")
                .frame(maxWidth: .infinity, alignment: .center)
            
            if vm.quest.count > 0 {
                activities
            } else {
                Spacer()

                emptyView
            }
            Spacer()
        }
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
    
    var questBtn: some View {
        HStack(alignment: .bottom, spacing: 50) {
            Button {
                showScreen.toggle()
            } label: {
                VStack {
                    Image(systemName: "doc")
                    Text("Previous")
                        .font(.subheadline)

                }
                .font(.title3)
                .shadow(radius: 10)
            }

            Button {
                showScreen.toggle()
            } label: {
                VStack {
                    Image(systemName: "trophy")
                    Text("trophy")
                        .font(.subheadline)

                }
                .font(.title3)
                .shadow(radius: 10)
            }
            .fullScreenCover(isPresented: $showScreen) {
                RichestView(showScreen: $showScreen)
            }
            
            
            Button {
                showScreen.toggle()
            } label: {
                VStack {
                    Image(systemName: "xmark.bin")
                    Text("Delete")
                        .font(.subheadline)
                }
                .font(.title3)
                .shadow(radius: 10)
            }
        }
        .padding(.bottom, 20)
        .tint(.black)
    }
    
    var activities: some View {
        List {
            ForEach(vm.getKeys(), id: \.self) { key in
                Section(key) {
                    ForEach(vm.getGroupedQuest()[key]!) { item in
                        Text(item.name)
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

