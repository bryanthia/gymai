//
//  muscleGroupModel.swift
//  GYMAI
//
//  Created by Bryan Thia on 13/10/2024.
//

import Foundation

struct MuscleGroup: Identifiable {
    let id = UUID().uuidString
    let name: String
    var isToggled: Bool
    var exercises: [Exercise] = [Exercise(name: "Placeholder")]
}

// option 1: make this a class (not advisable)
struct Exercise: Identifiable {
    let id = UUID().uuidString
    let name: String
    var isDone: Bool = false
    var isExpanded: Bool = false
    var sets: [Set] = [
        Set(weight: 10, reps: 12),
        Set(weight: 12.5,reps: 10),
        Set(weight: 15, reps: 8)
    ]
}

struct Set: Identifiable {
    let id = UUID().uuidString
    var weight: CGFloat
    var reps: Int
    var isDone: Bool = false
}
