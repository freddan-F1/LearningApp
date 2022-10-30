//
//  ContentModel.swift
//  LearingApp
//
//  Created by Fredrik Nilsson on 2022-10-30.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [LearningModule]()
    var styleData:Data?
    
    init() {
        getLocalData()
        
    }
    
    func getLocalData() {
        
        //get jsonUrl and jsonData
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([LearningModule].self, from: jsonData)
            
            self.modules = modules
            
        }
        catch {
            print("Couldn't parse json-data")
        }
        
        let htmlUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            let styleData = try Data(contentsOf: htmlUrl!)
            self.styleData = styleData
        }
        catch {
            print("Couldn't pars style-data")
        }
    }
    
}

