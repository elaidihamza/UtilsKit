//
//  LogType.swift
//  UtilsKit
//
//  Created by Michael Coqueret on 15/06/2020.
//  Copyright © 2020 iD.apps. All rights reserved.
//

import Foundation

/**
    Log type protocol.
 */
public protocol LogType {
    
    /// Prefix of the full log
    var prefix: String { get }
}
