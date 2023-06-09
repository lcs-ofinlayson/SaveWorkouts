//
//  Workout.swift
//  SaveWorkouts
//
//  Created by Oliver Finlayson on 2023-06-06.
//
import Blackbird
import Foundation

struct Workout: Identifiable, Codable, BlackbirdModel {
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var workoutName: String
    @BlackbirdColumn var workoutDescription: String
    
}
