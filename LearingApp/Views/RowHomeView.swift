//
//  RowHomeView.swift
//  LearingApp
//
//  Created by Fredrik Nilsson on 2022-10-30.
//

import SwiftUI

struct RowHomeView: View {
    
    var image:String
    var title:String
    var description:String
    var count:String
    var time:String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                .cornerRadius(10)
                .shadow(radius: 10)
            HStack(spacing: 10) {
                Image(image).resizable().frame(width: 130, height: 130)
                    .clipShape(Circle()).padding()
                VStack(alignment: .leading, spacing:10) {
                    Text(title).font(.title3).bold()
                    Text(description).font(.caption).padding(.bottom,30)
                    HStack {
                        Image(systemName: "text.book.closed").frame(width:15, height: 15)
                        Text(count).font(Font.system(size: 10))
                        Spacer()
                        Image(systemName: "clock")
                            .frame(width:15, height: 15)
                        Text(time)
                            .font(Font.system(size: 10))
                    }.padding(.trailing)
                }
                
            }
        }.padding()

    }
}

struct RowHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RowHomeView(image: "swift", title: "Learn Swift", description: "some description", count: "20 lessons", time: "3 hours")
    }
}
