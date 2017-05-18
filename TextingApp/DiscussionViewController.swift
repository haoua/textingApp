//
//  DiscussionViewController.swift
//  TextingApp
//
//  Created by stagiaire on 17/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit

import JSQMessagesViewController

protocol DiscussionViewControllerDelegate{
    func myVCDidFinish(controller:DiscussionViewController,text:String)
}

struct User {
    let id: String
    let name: String
}

class DiscussionViewController: JSQMessagesViewController {
    
    var selectedName: String!
    weak var delegate:ContactViewController? = nil

    let user1 = User(id: "1", name: "Awa")
    //let user2 = User(id: "2", name: selectedName)
    
    var currentUser: User {
    return user1
    }
    
    //all messages of users1, users2
    var messages = [JSQMessage]()

}

extension DiscussionViewController {
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!){
        let message = JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text)
        
        messages.append(message!)
        
        
        finishSendingMessage()
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        let message = messages[indexPath.row]
        let messageUsername = message.senderDisplayName
        
        return NSAttributedString(string: messageUsername!)
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat{
        return 20
    }
    
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource!{
        let bubbleFactory = JSQMessagesBubbleImageFactory()
        
        let message = messages[indexPath.row]
        
        if currentUser.id == message.senderId {
            return bubbleFactory?.outgoingMessagesBubbleImage(with: .green)
        } else {
            return bubbleFactory?.incomingMessagesBubbleImage(with: .blue)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData!{
        return messages[indexPath.row]
    }
    
}

extension DiscussionViewController{
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        self.senderId = currentUser.id
        self.senderDisplayName = currentUser.name
        
        self.messages = getMessages()
    }
    
}

extension DiscussionViewController {
    func getMessages() -> [JSQMessage]{
    var messages = [JSQMessage]()
        
    //let message1 = JSQMessage(senderId: "1", displayName: "Awa", text: "Hey dude")
    let message2 = JSQMessage(senderId: "2", displayName: selectedName, text: "Yoh man")
        
    //messages.append(message1!)
    messages.append(message2!)
        
        
    self.delegate?.updatedSelectedName(newName: selectedName)
        
    return messages
    }
    

    

    
}
