//
//  File.swift
//  
//
//  Created by Chris Heinrich on 8/4/21.
//

import Foundation



public enum GLTFOption: Equatable {
    case skipNormalMap // whether to skip loading normal map
    case skipAOMap // whether to skip loading AO map
    case maxTextureSize1k
    case maxTextureSize2k
    case maxTextureSize4k
}

public struct GLTFLoadOptions {
    private(set) var options: [GLTFOption]
    
    public init(_ options: [GLTFOption] = []) {
        self.options = options
    }
    
    var skipNormalMap: Bool {
        return options.contains(.skipNormalMap)
    }
    
    var skipAOMap: Bool {
        return options.contains(.skipAOMap)
    }
    
    var maxTextureSize: Int? {
        // go from smallest to largest
        if options.contains(.maxTextureSize1k) {
            return 1024
        } else if options.contains(.maxTextureSize2k) {
            return 2048
        } else if options.contains(.maxTextureSize4k) {
            return 4096
        }
        return nil
    }
    
}

