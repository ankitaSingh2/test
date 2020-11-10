//
//  RowFieldConfiguration.swift
//  Techtest
//
//  Created by Ankita on 10/11/20.
//  Copyright © 2020 Ankita. All rights reserved.
//

import Foundation
class RowFieldConfiguration{
    func getallFieldlinkedUp(rows:[[String:Any]]) -> [RowField]{
        var rowFields = [RowField]()
        for dict in rows {
        let tempTitle = dict["title"] as? String
        let tempDescription = dict["description"] as? String
        let tempImageHref = dict["imageHref"] as? String
            let dict = RowField(title: tempTitle, description: tempDescription, imageHref: tempImageHref)
            rowFields.append(dict)
            
        }
        return rowFields
    }
}
// MARK: - row Model
public struct RowField {
    public var title:String?
    public var description:String?
    public var imageHref :String?
}
