//
//  ContentView.swift
//  LearingApp
//
//  Created by Fredrik Nilsson on 2022-10-30.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:LearningModel
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                if model.currentModule != nil {
                    
                    ForEach(0..<model.currentModule!.content.lessons.count, id: \.self) {index in
                        
                        RowContentView(index: index)
    
                    }
                }
            }
            .navigationTitle("Learn \(model.currentModule?.category ?? "")").padding(.bottom,30)
        }
    }
}

