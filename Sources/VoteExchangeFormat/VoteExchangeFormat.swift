import Foundation
public struct GroupData: Codable{
    public init(name: String, availableVotes: Set<VoteMetaData>, canDeleteVotes: Bool) {
        self.name = name
        self.availableVotes = availableVotes
        self.canDeleteVotes = canDeleteVotes
    }
    
    public let name: String
    public let availableVotes: Set<VoteMetaData>
    public let canDeleteVotes: Bool
}

public struct VoteMetaData: Codable, Hashable{
    public init(id: UUID, name: String, kind: Kind, isOpen: Bool, hasVoted: Bool) {
        self.id = id
        self.name = name
        self.kind = kind
        self.isOpen = isOpen
        self.hasVoted = hasVoted
    }
    
    public let id: UUID
    public let name: String
    public let kind: Kind
    public let isOpen: Bool
    public let hasVoted: Bool
    
    
    public enum Kind: String, Codable{
        case AlternativeVote = "Alternative vote"
        case SinMajVote = "Simple majority vote"
        case YNVote = "Yes no vote"
    }
}

//public struct UserInfo: Codable{
//    public init(constituentID: String, name: String?) {
//        self.constituentID = constituentID
//        self.name = name
//    }
//
//    public let constituentID: String
//    public let name: String?
//}
