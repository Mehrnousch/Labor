//
//  LabBookView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 13.08.22.
//

import UIKit

class LabBookView: UIView {
    
    var list: [String] = []
    let LabBookTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = true
        tableView.allowsMultipleSelection = false
        tableView.isScrollEnabled = true
        tableView.layer.masksToBounds = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(LabBookTableViewCell.self, forCellReuseIdentifier: "LabBookTableViewCell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }

    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        LabBookTableView.delegate = self
        LabBookTableView.dataSource = self
        
        LabBookTableView.reloadData()
    }
    
    func layout() {
        addSubview(LabBookTableView)
        NSLayoutConstraint.activate([
            LabBookTableView.topAnchor.constraint(equalTo: topAnchor),
            LabBookTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            LabBookTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            LabBookTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Delegate & DataSource
extension LabBookView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabBookTableViewCell", for: indexPath) as! LabBookTableViewCell
//        let cellRow = list[indexPath.row]

        return cell
    }
}

