//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Vasily on 18.12.2025.
//

// Расширяем при объявлении
import UIKit

final class StatisticService: StatisticServiceProtocol {
    let storage: UserDefaults = .standard
    
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
            let correct = storage.integer(forKey: "bestGameCorrect")
            let total = storage.integer(forKey: "bestGameTotal")
            if let dateValue = storage.object(forKey: "bestGameDate") as? Date {
                return GameResult(correct: correct, total: total, date: dateValue)
            }else{
               return GameResult(correct: 0, total: 0, date: Date())
            }
        }
        set {
            storage.set(newValue.correct, forKey: "bestGameCorrect")
            storage.set(newValue.total, forKey: "bestGameTotal")
            storage.set(newValue.date, forKey: "bestGameDate")
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
       totalQuestionsAsked == 0 ? 0 : Double(totalCorrectAnswers) / Double(totalQuestionsAsked) * 100
    }
    
    func store(correct count: Int, total amount: Int) {
        let newResult = GameResult(correct: count, total: amount, date: Date())
        
        if newResult.isBetterThan(bestGame){
            bestGame = newResult
        }
        
        totalCorrectAnswers += count
        totalQuestionsAsked += amount
    }
    
    func incrementGamesCount(){
        gamesCount += 1
    }
}

