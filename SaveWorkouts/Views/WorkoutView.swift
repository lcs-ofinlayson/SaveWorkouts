//
//  WorkoutView.swift
//  SaveWorkouts
//
//  Created by Oliver Finlayson on 2023-06-05.
//
import Blackbird    
import SwiftUI

//MARK: Stored Properties

struct WorkoutView: View {
    @State var workout = Workout(workoutName: "", workoutDescription: "")
    @Environment (\.blackbirdDatabase) var db: Blackbird.Database?
    
    //List to store saved results
    
    
    
    //MARK: Computed Properties
    
    var body: some View {
        VStack {
            TextField("Workout Name", text: $workout.workoutName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Workout description", text: $workout.workoutDescription, axis: .vertical)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
            
            Button(action: {
                Task {
                    try await db!.transaction { core in
                        try core.query("INSERT INTO Workout (workoutName, workoutDescription) VALUES (?, ?)",
                                       workout.workoutName, workout.workoutDescription)
                    }
                }
            }, label: {
                Text("Save Workout")
            })
            
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
            
                .environment(\.blackbirdDatabase, AppDatabase.instance)
            
        }
    }
}
