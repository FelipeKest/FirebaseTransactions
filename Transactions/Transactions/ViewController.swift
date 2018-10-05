//
//  ViewController.swift
//  Transactions
//
//  Created by Felipe Kestelman on 01/10/18.
//  Copyright © 2018 Felipe Kestelman. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func createPosts() {
        let firReference = Firestore.firestore()
        let title = "Bem vindo a aula sobre Transactions!"
        let subTitle =  "FirebaseTransactions"
        let likes = 2
        let post: [String: Any] = ["title": title, "subTitle": subTitle, "likes": likes]
        
        firReference.collection("Posts").addDocument(data: post)
    }
    
    @IBAction func createPostAction(_ sender: Any) {
        createPosts()
    }
    
    func updatePostTransactions(){
        let firReference = Firestore.firestore()
        let postReference = firReference.collection("Posts").document("CVUJ2np4GS48j4MIaXJW")
        
        firReference.runTransaction({ (transaction, errorPointer) -> Any? in
            var postDoc: DocumentSnapshot!
            do {
                try postDoc = transaction.getDocument(postReference)
            } catch let fetchError as NSError {
                errorPointer?.pointee = fetchError
                return nil
            }
            
            guard let oldPost = postDoc.data() else {
                let error = NSError.init(domain: "AppErrorDomain", code: -1, userInfo: [NSLocalizedDescriptionKey: "Erro ao coletar a informacao do post \(String(describing: postDoc))"])
                errorPointer?.pointee = error
                return nil
            }
            let oldLikes = oldPost["likes"] as? Int ?? 0
            transaction.updateData(["likes": oldLikes + 1], forDocument: postReference)
            return nil
        }) { (object, error) in
            if let error = error {
                print("Transaction failed \(error)")
            } else {
                print("Transacao completa")
            }
        }
    }
    

    @IBAction func updateLikesTransaction(_ sender: Any) {
        for _ in 1...5 {
            updatePostTransactions()
        }
    }
}
