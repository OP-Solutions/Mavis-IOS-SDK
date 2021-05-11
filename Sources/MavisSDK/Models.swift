//
//  File.swift
//  
//
//  Created by Lasha Bukhnikashvili on 11.05.21.
//

import Foundation



public struct ArContent : Codable{
    public var name: String
    public var sessionId: String
    public var type: AugmentationType
}


public struct Target : Codable {
    public var name: String
    public var sessionId: String
}

public struct ArContentsInfo : Codable {
    public var name: String
    public var sessionId: String
    public var shownArContents: [ArContent]
}

public struct ArSessionInfo : Codable{
    public var sessionId: String
}

public struct MavisErrorInfo : Codable{
    public var errorMessage: String
    public var sessionId: String
}

public class MavisOptions {
    public var licenseKey : String = ""
    public init(){}
}

public enum AugmentationType{
    case Image
    case Object
}

extension AugmentationType: Codable {
    
    enum Key: CodingKey {
        case rawValue
    }
    
    enum CodingError: Error {
        case unknownValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(Int.self, forKey: .rawValue)
        switch rawValue {
        case 0:
            self = .Image
        case 1:
            self = .Object
        default:
            throw CodingError.unknownValue
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        switch self {
        case .Image:
            try container.encode("Image", forKey: .rawValue)
        case .Object:
            try container.encode("Object", forKey: .rawValue)
        }
    }
    
}
