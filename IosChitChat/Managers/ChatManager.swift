//
//  ChatManager.swift
//  IosChitChat
//
//  Created by Гар on 06.12.22.
//
import StreamChat
import StreamChatUI
import Foundation

final class ChatManager {
    static let shared = ChatManager()
    
    private var client: ChatClient!
    
    private let tokens = [
        "stevejobs": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic3RldmVqb2JzIn0.LHpUHHOj13pw7NpLMyAw_QBX3-vEIfNuYtj3OO_pm38",
        "markz": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibWFya3oifQ.wLNwpRBMxw2xBlnxtsAsqTXLbEYt6uEgrXOf8Ek47RU",
        "gar": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiZ2FyIn0.A9_dfuWxINrmcM3GKZN7ywhF7qrZLCznyB-yHbQqLQY",
        "ani": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiYW5pIn0.0HaWns_MyWTEdDNl_tfHxZu46hEBDtCU_0SaagmWtuw",
        "maks": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibWFrcyJ9.kDOzz8Fk2xVb5RE8s4l5LZ-NJtZWKySvkavjs9Upwwc"
    ]
    
    func setup() {
        let client = ChatClient(config: .init(apiKey: .init("4rz3szyfcqdr")))
        self.client = client
    }
    
    //Authentication
    
    func signIn(with username: String, completion: @escaping (Bool ) -> Void) {
        guard !username.isEmpty else {
            completion(false)
            return
        }
        
        guard let token = tokens[username.lowercased()] else {
            completion(false)
            return
        }
        
        client.connectUser(
            userInfo: UserInfo(id: username, name: username),
            token: Token(stringLiteral: token)
        ) { error in
            completion(error == nil)
            
        }
        
    }
    
    func signOut() {
        client.disconnect()
        client.logout()
    }
    
    var isSignedIn: Bool {
        return client.currentUserId != nil
    }
    
    var currentUser: String? {
        return client.currentUserId
    }
    
    //ChanelList + Creation
    public func createChanelList() -> UIViewController {
         return UIViewController()
    }
    
    public func createNewChannel(name: String) {
        
    }
}
