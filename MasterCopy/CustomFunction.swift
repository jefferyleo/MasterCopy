//
//  CustomFunction.swift
//  MasterCopy
//
//  Created by aam imac on 12/11/2015.
//  Copyright © 2015 jeffery leo. All rights reserved.
//

import Foundation

public class CustomFunction:NSDate
{
    
    func toShortTimeString() -> String
    {
        //Get Short Time String
        let formatter = NSDateFormatter()
        formatter.timeStyle = .LongStyle
        let timeString = formatter.stringFromDate(self)
        
        //Return Short Time String
        return timeString
    }
    
    public class func getCurrentTime() -> String
    {
        //        let date = NSDate()
        //        let formatter = NSDateFormatter()
        //        formatter.dateFormat = "HH:mm"
        //        formatter.stringFromDate(date)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let dateString = dateFormatter.stringFromDate(NSDate())
        return dateString
    }
    
    public class func getUsername() -> String
    {
        let username = PFUser.currentUser()!["username"] as? String
        return username!
    }
    
    
    public class func isEqual (lhs: NSDate, rhs: NSDate) -> Bool
    {
        return lhs === rhs || lhs.compare(rhs) == .OrderedSame
    }
    
    public class func isLessThan (lhs: NSDate, rhs: NSDate) -> Bool
    {
        return lhs.compare(rhs) == .OrderedAscending
    }
    
    public class func isGreaterThan (lhs: NSDate, rhs: NSDate) -> Bool
    {
        return lhs.compare(rhs) == .OrderedDescending
    }
    
}