import Foundation
public struct AltVotingData: Codable{
    public init(priorities: [Int : String]? = nil, blank: Bool? = nil) {
        self.priorities = priorities
        self.blank = blank
    }
    
    public var priorities: [Int: String]?
    public var blank: Bool?
}

public struct SimpleMajorityVotingData: Codable{
    public init(selectedOption: String? = nil, blank: Bool? = nil) {
        self.selectedOption = selectedOption
        self.blank = blank
    }
    
    public var selectedOption: String?
    public var blank: Bool?
}

public struct YnVotingData: Codable{
    public init(votes: [String : String]? = nil, blank: Bool? = nil) {
        self.votes = votes
        self.blank = blank
    }
    
    // Representing UUID : Yes/No
    public var votes: [String: String]?
    public var blank: Bool?
}
