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
                
                ForEach(viewModel.fetchSelectedMuscleGroups()) {muscleGroup in
                    Section(header: Text(muscleGroup.name)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)){
                            ForEach(muscleGroup.exercises ?? [], id:\.self) {exercise in
                                Text(exercise)
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

#Preview {
    WorkoutSummaryView()
}
