//
//  WorkoutView.swift
//  SaveWorkouts
//
//  Created by Oliver Finlayson on 2023-06-05.
//

import SwiftUI

struct WorkoutView: View {
    @State var workoutName: String = ""
    @State var exerciseName: String = ""
  
    var body: some View {
        VStack {
            TextField("Workout Name", text: $workoutName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Exercise Name", text: $exerciseName, axis: .vertical)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            WorkoutView()
                .navigationTitle("Workout Tracker")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
