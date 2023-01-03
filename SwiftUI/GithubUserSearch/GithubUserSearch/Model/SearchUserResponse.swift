//
//  SearchUserResponse.swift
//  GithubUserSearch
//
//  Created by 우주형 on 2023/01/03.
//

import Foundation

struct SearchUserResponse: Decodable {
    var items: [SearchResult]
}
