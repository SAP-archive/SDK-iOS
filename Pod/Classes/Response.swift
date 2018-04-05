//
//  Response.swift
//  Recast.AI Official iOS SDK
//
//  Created by Pierre-Edouard LIEB on 24/03/2016.
//
//  pierre-edouard.lieb@recast.ai

import Foundation
import ObjectMapper

/**
 Class Response
 
Return from the Recast API call
 */
public class Response : Mappable, CustomStringConvertible
{
    public var source : String!
    public var intents : [Intent]?
    public var act : String!
    public var type : String!
    public var sentiment : String!
    public var entities : Entities?
    public var language : String!
    public var version : String!
    public var timestamp : String!
    public var status : Int!
    public var raw : [String : AnyObject] = [:]
    
    private var ACT_ASSERT : String = "assert"
    private var ACT_COMMAND : String = "command"
    private var ACT_WH_QUERY : String = "wh-query"
    private var ACT_YN_QUERY : String = "yn-query"
    
    private var TYPE_ABBREVIATION : String = "abbr:"
    private var TYPE_ENTITY : String = "enty:"
    private var TYPE_DESCRIPTION : String = "desc:"
    private var TYPE_HUMAN : String = "hum:"
    private var TYPE_LOCATION : String = "loc:"
    private var TYPE_NUMBER : String = "num:"
    
    private var SENTIMENT_VERY_POSITIVE : String = "vpositive"
    private var SENTIMENT_POSITIVE : String = "positive"
    private var SENTIMENT_NEUTRAL : String = "neutral"
    private var SENTIMENT_NEGATIVE : String = "negative"
    private var SENTIMENT_VERY_NEGATIVE : String = "vnegative"
    
    /**
     Init class with JSON
     
     */
    required convenience public init?(map: Map) {
        self.init()
        mapping(map: map)
    }
    
    // Mappable
    public func mapping(map: Map) {
        source      <- map["source"]
        intents     <- map["intents"]
        act         <- map["act"]
        type        <- map["type"]
        sentiment   <- map["sentiment"]
        entities    <- map["entities"]
        language    <- map["language"]
        version     <- map["version"]
        timestamp   <- map["timestamp"]
        status      <- map["status"]
    }
    
    /**
     Return raw JSON description
    */
    public var description: String {
        return raw.description
    }
    
    //************ Methods - Global ************
    
    /**
     Get the first intent
     
     */
    public func intent() -> Intent? {
        guard let intent = intents?.first else { return nil }
        return intent
    }
    
    //************ Methods - ACT ************

    /**
     Return true is the ACT is an assert
     
     */
    public func assert() -> Bool? {
        return (act! == ACT_ASSERT)
    }
    
    /**
     Return true is the ACT is an command
     
     */
    public func command() -> Bool? {
        return (act! == ACT_COMMAND)
    }
    
    /**
     Return true is the ACT is an wh_query
     
     */
    public func wh_query() -> Bool? {
        return (act! == ACT_WH_QUERY)
    }
    
    /**
     Return true is the ACT is an yn_query
     
     */
    public func yn_query() -> Bool? {
        return (act! == ACT_YN_QUERY)
    }
  
    //************ Methods - TYPE ************

    /**
     Return true is the TYPE is an Abbreviation
     
     */
    public func isAbbreviation() -> Bool? {
        if (type!.range(of: TYPE_ABBREVIATION) != nil) {
            return true
        }
        return false
    }
    
    /**
     Return true is the TYPE is an Entity
     
     */
    public func isEntity() -> Bool? {
        if (type!.range(of: TYPE_ENTITY) != nil) {
            return true
        }
        return false
    }
    
    /**
     Return true is the TYPE is a Description
     
     */
    public func isDescription() -> Bool? {
        if (type!.range(of: TYPE_DESCRIPTION) != nil) {
            return true
        }
        return false
    }
    
    /**
     Return true is the TYPE is a Human
     
     */
    public func isHuman() -> Bool? {
        if (type!.range(of: TYPE_HUMAN) != nil) {
            return true
        }
        return false
    }
    
    /**
     Return true is the TYPE is a Location
     
     */
    public func isLocation() -> Bool? {
        if (type!.range(of: TYPE_LOCATION) != nil) {
            return true
        }
        return false
    }
    
    /**
     Return true is the TYPE is a Number
     
     */
    public func isNumber() -> Bool? {
        if (type!.range(of: TYPE_NUMBER) != nil) {
            return true
        }
        return false
    }

    //************ Methods - SENTIMENT ************

    /**
     Return true is the SENTIMENT is VPositive
     
     */
    public func isVPositive() -> Bool? {
        return (sentiment == SENTIMENT_VERY_POSITIVE)
    }
    
    /**
     Return true is the SENTIMENT is Positive
     
     */
    public func isPositive() -> Bool? {
        return (sentiment == SENTIMENT_POSITIVE)
    }
    
    /**
     Return true is the SENTIMENT is Neutral
     
     */
    public func isNeutral() -> Bool? {
        return (sentiment == SENTIMENT_NEUTRAL)
    }
    
    /**
     Return true is the SENTIMENT is Negative
     
     */
    public func isNegative() -> Bool? {
        return (sentiment == SENTIMENT_NEGATIVE)
    }
    
    /**
     Return true is the SENTIMENT is VNegative
     
     */
    public func isVNegative() -> Bool? {
        return (sentiment == SENTIMENT_VERY_NEGATIVE)
    }
}
