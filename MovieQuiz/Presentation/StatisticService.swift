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
            if let dateTimestamp = storage.object(forKey: "bestGameDate") as? TimeInterval {
                let date = Date(timeIntervalSinceReferenceDate: dateTimestamp)
                return GameResult(correct: correct, total: total, date: date)
            }else{
                return GameResult(correct: correct, total: total, date: Date())
            }
        }
        set {
            storage.set(newValue.correct, forKey: "bestGameCorrect")
            storage.set(newValue.total, forKey: "bestGameTotal")
            storage.set(newValue.date.timeIntervalSinceReferenceDate, forKey: "bestGameDate")
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
