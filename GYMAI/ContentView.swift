//
//  ContentView.swift
//  GYMAI
//
//  Created by Bryan Thia on 12/10/2024.
//

import SwiftUI

struct ContentView: View {
    let muscleGroups = [
        "Shoulders",
        "Chest",
        "Triceps",
        "Back",
        "Biceps",
        "Legs",
        "Abs"
    ]

    var body: some View {
        VStack {
            Text("Welcome to GYMAI")
            Spacer()
            Text("Fill in your workouts for today")
            Spacer()
            List(muscleGroups, id: \.self) { muscleGroup in
                Text(
                    muscleGroup
                )
                   }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
