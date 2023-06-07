//
//  SaveWorkoutsApp.swift
//  SaveWorkouts
//
//  Created by Oliver Finlayson on 2023-06-03.
//
import Blackbird
import SwiftUI

@main
struct SaveWorkoutsApp: App {
    var body: some Scene {
        WindowGroup {
            WorkoutView()
            
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
