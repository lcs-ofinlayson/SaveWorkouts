//  WorkoutView.swift
//  SaveWorkouts
//
//  Created by Oliver Finlayson on 2023-06-05.
//

import Blackbird
import SwiftUI

//MARK: Stored Properties

struct WorkoutView: View {
    @State var workout = Workout(id: 1, workoutName: "", workoutDescription: "")
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    @BlackbirdLiveModels var models: Blackbird.LiveResults<Workout>

    // Initialize the property to see and get workout results
    init() {
       
        _models = BlackbirdLiveModels({ db in
            try await Workout.read(from: db, sqlWhere: "id > 0")
        })
    }

    //MARK: Computed Properties

    var body: some View {
        VStack {
            // Text field for entering workout name
            TextField("Workout Name", text: $workout.workoutName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            // Text field for entering workout description
            TextField("Workout Description", text: $workout.workoutDescription, axis: .vertical)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Spacer()

            // Button to save the workout
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

            // List to display the saved workouts
            List {
                ForEach(0..<Int(models.results.count), id: \.self) { index in
                    Text("Name: \(models.results[index].workoutName) Description: \(models.results[index].workoutDescription)")
                }
            }

            Spacer()
                .padding()
        }
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
