import Foundation

public protocol VoteData: Codable, Sendable{
    var blank: Bool? {get}
    static func blank() -> Self
}

public struct AltVotingData: VoteData{
    public init(priorities: [Int : String]? = nil, blank: Bool? = nil) {
        self.priorities = priorities
        self.blank = blank
    }
    
    public var priorities: [Int: String]?
    public var blank: Bool?
    
    public static func blank() -> AltVotingData {
        self.init(priorities: nil, blank: true)
    }
}

public struct SimpleMajorityVotingData: VoteData{
    public init(selectedOption: String? = nil, blank: Bool? = nil) {
        self.selectedOption = selectedOption
        self.blank = blank
    }
    
    public var selectedOption: String?
    public var blank: Bool?
    
    public static func blank() -> SimpleMajorityVotingData {
        self.init(selectedOption: nil, blank: true)
    }
}

public struct YnVotingData: VoteData{
    public init(votes: [String : String]? = nil, blank: Bool? = nil) {
        self.votes = votes
        self.blank = blank
    }
    
    // Representing UUID : Yes/No
    public var votes: [String: String]?
    public var blank: Bool?
    
    public static func blank() -> YnVotingData {
        self.init(votes: nil, blank: true)
    }
}
