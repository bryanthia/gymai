//
//  LandingView.swift
//  GYMAI
//
//  Created by Bryan Thia on 12/10/2024.
//

import SwiftUI

struct LandingView: View {
    @ObservedObject var viewModel = WorkoutViewModel()

    @State private var showMuscleGroups = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.2).ignoresSafeArea()
                VStack(
                    alignment: .center
                ){
                    VStack (alignment: .leading){
                        Text("Welcome to GYMAI 💪")
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("Which muscle groups are you training today?")
                            .font(.body)
                    }
                    .padding(.top, 50)
                    .padding(.horizontal)
                    Button(
                        action: {
                            withAnimation { // Use withAnimation to wrap the state change
                                showMuscleGroups.toggle()
                            }
                        }) {
                            Text("Select Muscle Groups")
                                .opacity(showMuscleGroups ? 0 : 1)
                                .animation(nil, value: showMuscleGroups)
                            
                        }
                        .padding(.top, 40)
                    VStack {
                        Text("Muscle Groups Selected:").font(.title3)
                            .padding(.bottom, 10)
                        ForEach(viewModel.muscleGroups) {muscleGroup in
                            if (muscleGroup.isToggled == true) {
                                Text(muscleGroup.name)
                                    .font(.headline)
                            }
                        }
                    }
                    .padding(.top, 20)
                    Spacer()
                    NavigationLink {
                        WorkoutSummaryView(viewModel: viewModel)} label: {Text("Start your workout")
                            .font(.title3)
                    }.frame(maxWidth: 250, maxHeight: 40)
                    
                    Spacer()
                
                }
                
                //        .sheet(isPresented: $showMuscleGroups, content: {
                //            muscleGroupSelectionScreen(muscleGroups: muscleGoups)
                //        })
                ZStack {
                    if showMuscleGroups {
                        muscleGroupSelectionScreen(
                            muscleGroups: $viewModel.muscleGroups,
                            showMuscleGroups: $showMuscleGroups
                        )
                        .padding(.top, 430)
                        .transition(.move(edge: .bottom))
                        .animation(.spring(), value: showMuscleGroups)
                    }
                }
                .ignoresSafeArea()
                .zIndex(2.0)
            }
        }
    }
}

struct muscleGroupSelectionScreen: View {
    @Binding var muscleGroups: [MuscleGroup]
    @Binding var showMuscleGroups: Bool
    
    var body: some View {
        VStack {
            List {
                ForEach($muscleGroups) {$muscleGroup in
                    Toggle(isOn: $muscleGroup.isToggled, label: {
                        Text(muscleGroup.name)
                    })
                }
            }
            Button(action: {
                withAnimation{
                    showMuscleGroups.toggle()
                }
            }, label: {
                Text("Done")
            })
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 5)
            .padding(.bottom, 15)
        }.background(.white)
        
        
    }
    
}

#Preview {
    LandingView()
}
