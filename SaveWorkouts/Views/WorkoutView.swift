//
//  WorkoutView.swift
//  SaveWorkouts
//
//  Created by Oliver Finlayson on 2023-06-05.
//

import SwiftUI

//MARK: Stored Properties

struct WorkoutView: View {
    @State var workoutName: String = ""
    @State var workoutDescription: String = ""
  
    //MARK: Computed Properties
    
    var body: some View {
        VStack {
            TextField("Workout Name", text: $workoutName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Workout description", text: $workoutDescription, axis: .vertical)
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
