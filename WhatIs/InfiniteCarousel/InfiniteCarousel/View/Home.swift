//
//  Home.swift
//  InfiniteCarousel
//
//  Created by 우주형 on 2023/06/20.
//

import SwiftUI

struct Avatar: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var imageName: String
}

extension Avatar {
    static var allAvatars: [Avatar] = [
        Avatar(title: "개발자", imageName: "developer_avatar"),
        Avatar(title: "디자이너", imageName: "designer_avatar"),
        Avatar(title: "기획자", imageName: "pm_avatar")
    ]
}

struct Home: View {
    /// View Properties
    @State private var currentPage: String = ""
    @State private var listOfPages: [Avatar] = Avatar.allAvatars
    /// Infinite Carousel Properties
    /// 첫번째랑 마지막 페이지 복사해서 앞이랑 뒤에 붙여야함
    @State private var fakedPages: [Avatar] = []
    
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            TabView(selection: $currentPage, content: {
                ForEach(fakedPages) { page in
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .overlay { Text(page.title)}
//                        .fill(page.color.gradient)
                        .frame(width: 300, height: size.height)
                        .tag(page.id.uuidString)
                    /// Caculating Entire Page Scroll Offset
                        .offsetX(currentPage == page.id.uuidString) { rect in
                            let minX = rect.minX
                            let pageOffset = minX - (size.width * CGFloat(fakeIndex(page)))
                            /// Converting Page Offset into Progress
                            let pageProgress = pageOffset / size.width
                            /// Infinte Carousel Logic
                            if -pageProgress < 1.0 {
                                /// Moving to the Last Page
                                /// Which Which is Actually the First Duplicated Page
                                /// Safe Check
                                if fakedPages.indices.contains(fakedPages.count - 1) {
                                    currentPage = fakedPages[fakedPages.count - 1].id.uuidString
                                }
                            }
                            
                            if -pageProgress > CGFloat(fakedPages.count - 1) {
                                /// Moving to the First Page
                                /// Which Which is Actually the Last Duplicated Page
                                /// Safe Check
                                if fakedPages.indices.contains(1) {
                                    currentPage = fakedPages[1].id.uuidString
                                }
                            }
                            
                        }
                }
            })
            .tabViewStyle(.page(indexDisplayMode: .never))
            .overlay(alignment: .bottom) {
                PageControl(totalPages: listOfPages.count, currentPage: originalIndex(currentPage))
                    .offset(y: -15)
            }
        }
        .frame(height: 400)
        /// Creating Some Sample Tab's
        .onAppear {
            guard fakedPages.isEmpty else { return }
//            for color in [Color.red, Color.blue, Color.yellow, Color.black, Color.brown] {
//                listOfPages.append(.init(color: color))
//            }
            
            fakedPages.append(contentsOf: listOfPages)
            if var firstPage = listOfPages.first, var lastPage = listOfPages.last {
                currentPage = firstPage.id.uuidString
                
                /// Updating ID
                firstPage.id = .init()
                lastPage.id = .init()
                
                fakedPages.append(firstPage)
                fakedPages.insert(lastPage, at: 0)
            }
        }
    }
    
    func fakeIndex(_ of: Avatar) -> Int {
        return fakedPages.firstIndex(of: of) ?? 0
    }
    
    func originalIndex(_ id: String) -> Int {
        return listOfPages.firstIndex { page in
            page.id.uuidString == id
        } ?? 0
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
