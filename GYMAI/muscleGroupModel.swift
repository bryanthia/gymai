//
//  muscleGroupModel.swift
//  GYMAI
//
//  Created by Bryan Thia on 13/10/2024.
//

import Foundation

struct MuscleGroup: Identifiable {
    let id = UUID()
    let name: String
    var isToggled: Bool
    var exercises: [String]?
}
