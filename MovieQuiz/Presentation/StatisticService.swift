//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Vasily on 18.12.2025.
//

// Расширяем при объявлении
import UIKit

final class StatisticService: StatisticServiceProtocol {
    private let storage: UserDefaults = .standard
    
    var gamesCount: Int {
        get {
            storage.integer(forKey: "gamesCount")
        }
        set {
            storage.set(newValue, forKey: "gamesCount")
        }
    }
    
    var bestGame: GameResult{
        get {
            storage.integer(forKey: "correct")
            storage.integer(forKey: "total")
            storage.object(forKey: "date") as! Date ?? Date()
            if correctAnswers > correct {
               return GameResult(correct: correctAnswers, total: totalQuestionsAsked, date: Date())
            }
        }
        set {
            storage.set(newValue.correct, forKey: "correct")
            storage.set(newValue.total, forKey: "total")
            storage.set(newValue.date, forKey: "date")
        }
    }
    
    var totalCorrectAnswers: Int {
        get{
            storage.integer(forKey: "totalCorrectAnswers")
        }
        set{
            storage.set(newValue, forKey: "totalCorrectAnswers")
        }
    }
    
    var totalQuestionsAsked: Int{
        get{
            storage.integer(forKey: "totalQuestionsAsked")
        }
        set{
            storage.set(newValue, forKey: "totalQuestionsAsked")
        }
    }
    
    var totalAccuracy : Double{
        if totalQuestionsAsked == 0{
            return 0
        } else {
            return Double(totalCorrectAnswers) / Double(totalQuestionsAsked) * 100
        }
    }
   func store(correct count: Int, total amount: Int) {
       totalCorrectAnswers += count
       totalQuestionsAsked += amount    
    }
}
