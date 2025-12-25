//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Vasily on 17.12.2025.
//

protocol QuestionFactoryDelegate: AnyObject {               
    func didReceiveNextQuestion(question: QuizQuestion?)
}
