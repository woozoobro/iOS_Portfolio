//
//  SearchUserResponse.swift
//  GithubUserCollectionSearch
//
//  Created by 우주형 on 2022/12/31.
//

import Foundation

struct SearchUserResponse: Decodable {
    var items: [SearchResult]
}
