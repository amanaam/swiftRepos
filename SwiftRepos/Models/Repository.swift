import Foundation

let url = "https://api.github.com/search/repositories?q=language:swift&sort=stars&order=desc"

struct Repositories: Codable {
 let items: [Repository]
 let totalCount: Int
 let incompleteResults: Bool
 // make sure this conforms to Codable...
  enum CodingKeys : String, CodingKey {
      case totalCount = "total_count"
      case incompleteResults = "incomplete_results"
      case items = "items"
    }
}


struct Repository: Codable {
  let id: Int
  let name: String
  let htmlURL: String
  let itemDescription: String?
  
  enum CodingKeys : String, CodingKey {
      case id
      case name
      case itemDescription = "description"
      case htmlURL = "html_url"
    }
}
