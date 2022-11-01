//
//  LearningModel.swift
//  LearingApp
//
//  Created by Fredrik Nilsson on 2022-10-30.
//

import Foundation

class LearningModel: ObservableObject {
    
    //Data variables
    @Published var modules = [LearningModule]()
    var styleData:Data?
    //Lesson details
    @Published var lessonDescription = NSAttributedString()
    
    //Navigation control variables
    @Published var currentModule:LearningModule?
    var currentModuleIndex = 0
    
    @Published var currentLesson:ContentLesson?
    var currentLessonIndex = 0
    
    
    
    
    init() {
        getLocalData()
        
    }
    
    //MARK: Data methods
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
    
    //MARK: Navigation control methods
    func setCurrentModule( moduleId:Int) {
        for index in 0..<modules.count {
            if modules[index].id == moduleId {
                currentModuleIndex = index
                break
            }
        }
        currentModule = modules[currentModuleIndex]
    }

    func setCurrentLesson( lessonId:Int) {
        
        //Check if lesson with lessonId exists
        if lessonId < currentModule!.content.lessons.count {
            currentLessonIndex = lessonId
        }
        else {
            currentLessonIndex = 0
        }
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        lessonDescription = AddStyling(htmlString: currentLesson!.explanation)
    }
    
    func HasNextLesson() -> Bool {
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
    }
    
    func NextLesson() {
        currentLessonIndex += 1
        if currentLessonIndex < currentModule!.content.lessons.count {
            
            //Set the next lesson property
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonDescription = AddStyling(htmlString: currentLesson!.explanation)
        }
        else {
            currentLessonIndex = 0
            currentLesson = nil
        }
    }
    
    //MARK: methods for making attributed string
    func AddStyling(htmlString:String) -> NSAttributedString {
        
        var result = NSAttributedString()
        var data = Data()
        
        //Add styledata
        if styleData != nil {
            data.append(self.styleData!)
        }
        //Add html string
        data.append(Data(htmlString.utf8))
        
        //Convert to NSAttributed string
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            
            result = attributedString
        }
        return result
    }
}

