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
                ForEach(viewModel.muscleGroups) {muscleGroup in
                    if muscleGroup.isToggled == true {
                        Section(header: Text(muscleGroup.name)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)){
                                ForEach(muscleGroup.exercises) {exercise in
                                    VStack {
                                        HStack {
                                            Text(exercise.name)
                                                .onTapGesture {
                                                    viewModel.toggleExpanded(muscleGroup: muscleGroup, exercise: exercise)
                                                }
                                            Spacer()
                                            
                                            exercise.isDone ? Image(systemName: "checkmark")
                                                .resizable() // Makes the image resizable
                                                .frame(width: 15, height: 15) // Set the desired size
                                                .foregroundColor(.green)

                                            : Image(systemName: "xmark")
                                                .resizable()
                                                .frame(width: 15, height: 15) // Set the desired size
                                                .foregroundColor(.red)

                                        }
                                        if exercise.isExpanded {
                                            VStack (alignment: .leading) {
                                                ForEach(exercise.sets) { oneSet in
                                                    HStack {
                                                        Text(String(format: "Weight: %.1fkg", oneSet.weight))
                                                            .font(.caption)
                                                        Spacer()
                                                        // $ only works if oneSet is an observable object and isDone is published within that
                                                        Toggle(isOn: Binding(get: {
                                                            oneSet.isDone
                                                        }, set: { newValue in
                                                            viewModel.setDone(isDone: newValue)
                                                        }),
                                                               label: {Text("")}
                                                        )
                                                        .toggleStyle(CustomCheckboxToggleStyle())

                                                    }
                                                }
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

