//
//  GLTFSceneSource.swift
//  GLTFSceneKit
//
//  Created by magicien on 2017/08/17.
//  Copyright © 2017 DarkHorse. All rights reserved.
//

import SceneKit

enum GLTFSceneSourceError: Error {
    case nilLoader
}


@objcMembers
public class GLTFSceneSource : SCNSceneSource {
    private var loader: GLTFUnarchiver! = nil
    
    public override init() {
        super.init()
    }
    
    public convenience init(path: String, options: [SCNSceneSource.LoadingOption : Any]? = nil, extensions: [String:Codable.Type]? = nil) throws {
        self.init()
        
        let loader = try GLTFUnarchiver(path: path, extensions: extensions)
        self.loader = loader
    }
    
    public convenience init(url: URL, options: [SCNSceneSource.LoadingOption : Any]? = nil, gltfOptions: GLTFLoadOptions = .init()) {
        self.init(url: url, options: options, extensions: nil, gltfOptions: gltfOptions)
    }
    
    public convenience init(url: URL, options: [SCNSceneSource.LoadingOption : Any]?, extensions: [String:Codable.Type]?, gltfOptions: GLTFLoadOptions = .init()) {
        self.init()
        
        do {
            self.loader = try GLTFUnarchiver(url: url, extensions: extensions, options: gltfOptions)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    public override convenience init(data: Data, options: [SCNSceneSource.LoadingOption : Any]? = nil) {
        self.init()
        do {
            self.loader = try GLTFUnarchiver(data: data)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    public convenience init(named name: String, options: [SCNSceneSource.LoadingOption : Any]? = nil, extensions: [String:Codable.Type]? = nil) throws {
        let filePath = Bundle.main.path(forResource: name, ofType: nil)
        guard let path = filePath else {
            throw URLError(.fileDoesNotExist)
        }
        try self.init(path: path, options: options, extensions: extensions)
    }
    
    public override func scene(options: [SCNSceneSource.LoadingOption : Any]? = nil) throws -> SCNScene {
        guard let loader = self.loader else {
            throw GLTFSceneSourceError.nilLoader
        }

        let scene = try loader.loadScene()
        #if SEEMS_TO_HAVE_SKINNER_VECTOR_TYPE_BUG
            let sceneData = NSKeyedArchiver.archivedData(withRootObject: scene)
            let source = SCNSceneSource(data: sceneData, options: nil)!
            let newScene = source.scene(options: nil)!
            return newScene
        #else
            return scene
        #endif
    }
    
    /*
    public func cameraNodes() -> [SCNNode] {
        var cameraNodes = [SCNNode]()
        
        let scene = try self.loader.loadScene()
        scene.rootNode.childNodes
        
        return cameraNodes
    }
     */
}
