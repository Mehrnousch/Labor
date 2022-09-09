//
//  LabsView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//


import UIKit

class LabsView: UIView {
    
    var selectedCell: (Int)-> Void = {_ in}

    var labs: [LabModel] = []
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
    
    func setData(labs: [LabModel]) {
        self.labs = labs
        labsTableView.reloadData()
    }

    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        labsTableView.delegate = self
        labsTableView.dataSource = self
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
        return labs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labsTableViewCell", for: indexPath) as! labsTableViewCell
        let cellData = labs[indexPath.row]
        cell.setData(lab: cellData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! labsTableViewCell
        cell.selectionStyle = .none
        let cellData = labs[indexPath.row]
        selectedCell(cellData.id)
    }
}
