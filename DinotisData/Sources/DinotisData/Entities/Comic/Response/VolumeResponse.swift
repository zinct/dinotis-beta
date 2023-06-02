//
//  VolumeResponse.swift
//  
//
//  Created by Indra Mahesa on 02/06/23.
//

import Foundation

public struct VolumeResponse: Codable {
    public var error: String?
    public var limit: Int?
    public var offset: Int?
    public var numberOfPageResults: Int?
    public var numberOfTotalResults: Int?
    public var statusCode: Int?
    public var results: [VolumeData]?
    
    enum CodingKeys: String, CodingKey {
        case error, limit, offset
        case numberOfPageResults = "number_of_page_results"
        case numberOfTotalResults = "number_of_total_results"
        case statusCode = "status_code"
        case results
    }
    
    public init(
        error: String?,
        limit: Int?,
        offset: Int?,
        numberOfPageResults: Int?,
        numberOfTotalResults: Int?,
        statusCode: Int?,
        results: [VolumeData]?
    ) {
        self.error = error
        self.limit = limit
        self.offset = offset
        self.numberOfPageResults = numberOfPageResults
        self.numberOfTotalResults = numberOfTotalResults
        self.statusCode = statusCode
        self.results = results
    }
}
    
public struct VolumeData: Codable, Hashable {
    public static func == (lhs: VolumeData, rhs: VolumeData) -> Bool {
        return lhs.id.orZero() == rhs.id.orZero()
    }
    

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.orZero())
    }
    
    public var apiDetailURL: String?
    public var countOfIssues: Int?
    public var dateAdded, dateLastUpdated: String?
    public var description: String?
    public var id: Int?
    public var image: VolumeImageField?
    public var name: String?
    public var siteDetailURL: String?
    public var startYear: String?
    
    enum CodingKeys: String, CodingKey {
        case apiDetailURL = "api_detail_url"
        case countOfIssues = "count_of_issues"
        case dateAdded = "date_added"
        case dateLastUpdated = "date_last_updated"
        case description
        case id, image
        case name
        case siteDetailURL = "site_detail_url"
        case startYear = "start_year"
    }
    
    public init(
        apiDetailURL: String,
        countOfIssues: Int,
        dateAdded: String,
        dateLastUpdated: String,
        description: String,
        id: Int,
        image: VolumeImageField,
        name: String,
        siteDetailURL: String,
        startYear: String
    ) {
        self.apiDetailURL = apiDetailURL
        self.countOfIssues = countOfIssues
        self.dateAdded = dateAdded
        self.dateLastUpdated = dateLastUpdated
        self.description = description
        self.id = id
        self.image = image
        self.siteDetailURL = name
        self.startYear = startYear
    }
}

public struct VolumeImageField: Codable {
    public var iconURL, mediumURL, screenURL, screenLargeURL: String?
    public var smallURL, superURL, thumbURL, tinyURL: String?
    public var originalURL: String?
    public var imageTags: String?
    
    enum CodingKeys: String, CodingKey {
        case iconURL = "icon_url"
        case mediumURL = "medium_url"
        case screenURL = "screen_url"
        case screenLargeURL = "screen_large_url"
        case smallURL = "small_url"
        case superURL = "super_url"
        case thumbURL = "thumb_url"
        case tinyURL = "tiny_url"
        case originalURL = "original_url"
        case imageTags = "image_tags"
    }
}

