//
//  muscleGroupViewModel.swift
//  GYMAI
//
//  Created by Bryan Thia on 13/10/2024.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    @Published var muscleGroups = [
        MuscleGroup(name: "Shoulders", isToggled: true, exercises: ["Dumbbell Press", "Dumbbell Lateral Raise", "Cable Lateral Raise"]),
        MuscleGroup(name: "Chest", isToggled: true, exercises: ["Bench Press", "Incline Bench Press", "Chest Fly"]),
        MuscleGroup(name: "Triceps", isToggled: true, exercises: ["Straight Bar Pulldown", "Dumbbell Skullcrushers", "Overhead Cable Extensions"]),
        MuscleGroup(name: "Back", isToggled: false),
        MuscleGroup(name: "Biceps", isToggled: false),
        MuscleGroup(name: "Legs", isToggled: false),
        MuscleGroup(name: "Abs", isToggled: false)
    ]
    @Published var selectedGroups: [MuscleGroup] = []
    
    func fetchSelectedMuscleGroups() -> [MuscleGroup] {
        return muscleGroups.filter{$0.isToggled == true}
    }
}
