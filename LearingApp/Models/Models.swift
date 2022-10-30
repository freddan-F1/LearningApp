//
//  Models.swift
//  LearingApp
//
//  Created by Fredrik Nilsson on 2022-10-30.
//

import Foundation

struct LearningModule: Decodable, Identifiable {
 
    var id: Int
    var category: String
    var content: ModuleContent
    var test: ModuleTest
}

struct ModuleContent: Decodable, Identifiable {
    
    var id: Int
    var image: String
    var time: String
    var description: String
    var lessons: [ContentLesson]
}

struct ContentLesson: Decodable, Identifiable {
    
    var id: Int
    var title: String
    var video: String
    var duration: String
    var explanation: String
}

struct ModuleTest: Decodable, Identifiable {
    
    var id: Int
    var image: String
    var time: String
    var description: String
    var questions: [TestQuestion]
}

struct TestQuestion: Decodable, Identifiable {
    
    var id: Int
    var content: String
    var correctIndex: Int
    var answers: [String]
}
