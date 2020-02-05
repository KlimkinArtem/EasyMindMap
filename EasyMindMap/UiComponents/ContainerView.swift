//
//  ContainerView.swift
//  EasyMindMap
//
//  Created by Артем Климкин on 05/02/2020.
//  Copyright © 2020 Artem Klimkin. All rights reserved.
//

import UIKit

class ContainerView: UIView {


    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
    }

}
