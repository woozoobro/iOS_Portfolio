//
//  TypealiasBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 우주형 on 2023/01/30.
//

import SwiftUI

/*
struct MoviewModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MoviewModel

struct TypealiasBootcamp: View {
    
//    @State var item: MoviewModel = MoviewModel(title: "Title", director: "Joe", count: 5)
    @State var item: TVModel = TVModel(title: "TV Title", director: "Emily", count: 10)
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}
*/

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypealiasBootcamp: View {
    //@State var item: MovieModel = MovieModel(title: "Title", director: "Joe", count: 5)
    @State var item: TVModel = TVModel(title: "TV Title", director: "Emmily", count: 10)
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct TypealiasBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TypealiasBootcamp()
    }
}
