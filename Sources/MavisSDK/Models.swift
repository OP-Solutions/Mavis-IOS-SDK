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

public enum AugmentationType: String, Codable{
    case Image
    case Object
}
