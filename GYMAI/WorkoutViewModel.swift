//
//  muscleGroupViewModel.swift
//  GYMAI
//
//  Created by Bryan Thia on 13/10/2024.
//

import Foundation
import SwiftUI

class WorkoutViewModel: ObservableObject {
    @Published var muscleGroups: [MuscleGroup] = [
        MuscleGroup(
            name: "Shoulders",
            isToggled: true,
            exercises: [
                Exercise(name: "Dumbbell Press"),
                Exercise(name: "Dumbbell Lateral Raise"),
                Exercise(name: "Cable Lateral Raise")
            ]
        ),
        MuscleGroup(
            name: "Chest",
            isToggled: true,
            exercises: [
                Exercise(name: "Bench Press"),
                Exercise(name: "Incline Bench Press"),
                Exercise(name: "Chest Fly")
            ]
        ),
        MuscleGroup(
            name: "Triceps",
            isToggled: true,
            exercises: [
                Exercise(name: "Straight Bar Pulldown"),
                Exercise(name: "Dumbbell Skullcrushers"),
                Exercise(name: "Overhead Cable Extensions")
            ]
        ),
        MuscleGroup(name: "Back", isToggled: false),
        MuscleGroup(name: "Biceps", isToggled: false),
        MuscleGroup(name: "Legs", isToggled: false),
        MuscleGroup(name: "Abs", isToggled: false)
    ]
    @Published var selectedGroups: [MuscleGroup] = []
    
}
