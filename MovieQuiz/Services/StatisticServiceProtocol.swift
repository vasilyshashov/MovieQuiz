//
//  StatisticServiceProtocol.swift.swift
//  MovieQuiz
//
//  Created by Vasily on 18.12.2025.
//

protocol StatisticServiceProtocol {
    var gamesCount: Int { get }
    var bestGame: GameResult { get }
    var totalAccuracy: Double { get }
    
    func store(correct count: Int, total amount: Int)
    func incrementGamesCount()
}
