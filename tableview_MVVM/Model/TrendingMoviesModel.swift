
import Foundation

struct MarvelResponse: Codable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: MarvelData
}

struct MarvelData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [MarvelSeries]
}

struct MarvelSeries: Codable {
    let id: Int
    let title: String
    let description: String?
    let resourceURI: String
    let urls: [MarvelURL]
    let startYear: Int
    let endYear: Int
    let rating: String
    let type: String
    let modified: String
    let thumbnail: MarvelImage
    let creators: MarvelCreators
    let characters: MarvelCharacters
    let stories: MarvelStories
    let comics: MarvelComics
    let events: MarvelEvents
    let next: MarvelResourceURI?
    let previous: String?
}

struct MarvelURL: Codable {
    let type: String
    let url: String
}

struct MarvelImage: Codable {
    let path: String
    let `extension`: String
}

    struct MarvelResourceURI: Codable {
        let resourceURI: String
        let name: String
    }

struct MarvelCreators: Codable {
    let available: Int
    let collectionURI: String
    let items: [MarvelCreator]
    let returned: Int
}

struct MarvelCreator: Codable {
    let resourceURI: String
    let name: String
    let role: String
}

struct MarvelCharacters: Codable {
    let available: Int
    let collectionURI: String
    let items: [MarvelCharacter]
    let returned: Int
}

struct MarvelCharacter: Codable {
    let resourceURI: String
    let name: String
}

struct MarvelStories: Codable {
    let available: Int
    let collectionURI: String
    let items: [MarvelStory]
    let returned: Int
}

struct MarvelStory: Codable {
    let resourceURI: String
    let name: String
    let type: String
}

struct MarvelComics: Codable {
    let available: Int
    let collectionURI: String
    let items: [MarvelComic]
    let returned: Int
}

struct MarvelComic: Codable {
    let resourceURI: String
    let name: String
}

struct MarvelEvents: Codable {
    let available: Int
    let collectionURI: String
    let items: [MarvelEvent]
    let returned: Int
}

struct MarvelEvent: Codable {
    let resourceURI: String
    let name: String
}


