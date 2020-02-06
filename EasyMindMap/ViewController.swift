//
//  ViewController.swift
//  EasyMindMap
//
//  Created by Артем Климкин on 05/02/2020.
//  Copyright © 2020 Artem Klimkin. All rights reserved.
//

import UIKit

let mainContainerButton = Button(frame: .zero)

class ViewController: UIViewController {

    let mainContainer = ContainerView(frame: .zero)
    let mainTestContainer = ContainerView(frame: .zero)
    let addButton = Button(frame: .zero)
    let noteButton = Button(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()


        view.backgroundColor = .systemBackground
        configureMainContainer()
        configureMainContainerButton()
        configureAddButton()
        configureNoteButton()
        
        configureTestMainContainer()
    }


    func configureMainContainer(){
        view.addSubview(mainContainer)
        
        let frame = CGRect(x: view.bounds.midX - 60, y: view.bounds.midY, width: 140, height: 60)
        mainContainer.frame = frame
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panContainer(pan:)))
        mainContainer.addGestureRecognizer(pan)
        
        mainContainer.backgroundColor = .systemYellow
    }
    
    func configureTestMainContainer(){
        view.addSubview(mainTestContainer)
        
        let frame = CGRect(x: view.bounds.midX + 160, y: view.bounds.midY, width: 140, height: 60)
        mainTestContainer.frame = frame
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panContainerTest(pan:)))
        mainTestContainer.addGestureRecognizer(pan)
        
        mainTestContainer.backgroundColor = .systemBackground
        mainTestContainer.alpha = 0.1
    }
    
    
    func configureMainContainerButton(){
        mainContainer.addSubview(mainContainerButton)
        let frame = CGRect(x: mainContainer.bounds.minX, y: mainContainer.bounds.minY, width: 120, height: 40)
        mainContainerButton.frame = frame
        
        mainContainerButton.backgroundColor = .systemGreen
        mainContainerButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }


    func configureAddButton(){
        mainContainer.addSubview(addButton)
        
        let frame = CGRect(x: mainContainerButton.bounds.maxX, y: mainContainerButton.bounds.midY, width: 20, height: 20)
        addButton.frame = frame
        
        addButton.addTarget(self, action: #selector(createSecondContainer), for: .touchUpInside)
        addButton.backgroundColor = .systemGray
        addButton.setTitle("+", for: .normal)
    }
    
    func configureNoteButton(){
        mainContainer.addSubview(noteButton)
        
        let y = (mainContainerButton.bounds.midY / 2) * 4
        
        let frame = CGRect(x: mainContainerButton.bounds.maxX - 20, y: y, width: 20, height: 20)
        noteButton.frame = frame
        
        noteButton.addTarget(self, action: #selector(showNote), for: .touchUpInside)
        noteButton.backgroundColor = .systemGray
        noteButton.setTitle("T", for: .normal)
    }

    @objc func createSecondContainer(){
        print(#function)
    }
    
    @objc func showAlert() {
        presentAlert()
    }
    
    @objc func showNote(){
        print(#function)
    }
    
    
    @objc func panContainer(pan: UIPanGestureRecognizer) {
        let location = pan.location(in: view)
            
        mainContainer.center = location
    }
    
    
    @objc func panContainerTest(pan: UIPanGestureRecognizer) {
        let location = pan.location(in: view)
            
        mainTestContainer.center = location
    }
}

