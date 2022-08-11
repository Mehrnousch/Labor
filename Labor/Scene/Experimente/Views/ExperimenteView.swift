//
//  ExperimenteView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//


import UIKit

class ExperimenteView: UIView {
    
    var list: [String] = []
    let experimenteTableView: UITableView = {
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
        tableView.register(ExperimenteTableViewCell.self, forCellReuseIdentifier: "ExperimenteTableViewCell")
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
        experimenteTableView.delegate = self
        experimenteTableView.dataSource = self
        
        experimenteTableView.reloadData()
    }
    
    func layout() {
        addSubview(experimenteTableView)
        NSLayoutConstraint.activate([
            experimenteTableView.topAnchor.constraint(equalTo: topAnchor),
            experimenteTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            experimenteTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            experimenteTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Delegate & DataSource
extension ExperimenteView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExperimenteTableViewCell", for: indexPath) as! ExperimenteTableViewCell
//        let cellRow = list[indexPath.row]

        return cell
    }
}
