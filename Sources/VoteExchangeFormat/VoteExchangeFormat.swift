import Foundation
public struct GroupData: Codable, Hashable{
    public init(name: String, availableVotes: Set<VoteMetadata>, canDeleteVotes: Bool) {
        self.name = name
        self.availableVotes = availableVotes
        self.canDeleteVotes = canDeleteVotes
    }
    
    public let name: String
    public let availableVotes: Set<VoteMetadata>
    public let canDeleteVotes: Bool
}

public struct VoteMetadata: Codable, Hashable{
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
    
    
    public enum Kind: String, Codable, Hashable{
        case AlternativeVote = "Alternative vote"
        case SimMajVote = "Simple majority vote"
        case YNVote = "Yes no vote"
    }
}


public struct ExtendedVoteData: Codable, Hashable{
    public init(metadata: VoteMetadata, options: [ExchangeOption], validatorKeys: [String]) {
        self.metadata = metadata
        self.options = options
        self.validatorKeys = validatorKeys
    }
    
    public let metadata: VoteMetadata
    public let options: [ExchangeOption]
    public let validatorKeys: [String]
    
    public var allowsBlanks: Bool {
        !validatorKeys.contains("NoBlanks")
    }
}

public struct ExchangeOption: Codable, Hashable{
    public init(name: String, uuid: UUID) {
        self.name = name
        self.uuid = uuid
    }
    
    public let name: String
    public let uuid: UUID
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

public enum APIPaths: Codable, Hashable{
    case join
    case getdata
    case getvote(id: UUID)
    case postvote(id: UUID)
    
    public func relativeStringValue() -> String{
        switch self {
        case .join:
            return "join"
        case .getdata:
            return "getdata"
        case .getvote(let id):
            return "getvote/\(id.uuidString)"
        case .postvote(let id):
            return "postvote/\(id.uuidString)"
        }
    }
}
