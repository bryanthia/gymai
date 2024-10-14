//
//  WorkoutSummaryView.swift
//  GYMAI
//
//  Created by Bryan Thia on 13/10/2024.
//

import SwiftUI

struct WorkoutSummaryView: View {
    @ObservedObject var viewModel = WorkoutViewModel()
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Your Last Workout")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            List{
                ForEach($viewModel.muscleGroups) {$muscleGroup in
                    if muscleGroup.isToggled == true {
                        Section(header: Text(muscleGroup.name)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)){
                                ForEach($muscleGroup.exercises) {$exercise in
                                    VStack {
                                        HStack {
                                            Text(exercise.name)
                                                .onTapGesture {
                                                    exercise.isExpanded.toggle()
                                                }
                                            Spacer()
                                            
                                            Toggle(isOn: $exercise.isDone,
                                                   label: {Text("")}
                                            )
                                            .toggleStyle(CustomCheckboxToggleStyle())
                                        }
                                        if exercise.isExpanded {
                                            ForEach(exercise.sets) { oneSet in
                                                Text("Weight: \(String(oneSet.weight)) kg")
                                                    .padding(.leading)
                                            }
                                        }
                                    }
                                    
                                }
                            }
                    }
                }
            }.listStyle(InsetListStyle())

        }.frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(.top, 50)
            .padding(.horizontal)
        Spacer()
    }
    
}

struct CustomCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            // The checkbox image
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    configuration.isOn.toggle() // Toggles the checkbox state
                }
        }
    }
}

#Preview {
    WorkoutSummaryView()
}

