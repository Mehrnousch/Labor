//
//  LabsView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//


import UIKit

class LabsView: UIView {
    
    var list: [String] = []
    let labsTableView: UITableView = {
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
        tableView.register(labsTableViewCell.self, forCellReuseIdentifier: "labsTableViewCell")
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
        labsTableView.delegate = self
        labsTableView.dataSource = self
        
        labsTableView.reloadData()
    }
    
    func layout() {
        addSubview(labsTableView)
        NSLayoutConstraint.activate([
            labsTableView.topAnchor.constraint(equalTo: topAnchor),
            labsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            labsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Delegate & DataSource
extension LabsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labsTableViewCell", for: indexPath) as! labsTableViewCell
//        let cellRow = list[indexPath.row]

        return cell
    }
}
