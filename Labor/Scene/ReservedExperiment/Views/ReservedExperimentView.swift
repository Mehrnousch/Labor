//
//  ExperimenteView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//


import UIKit

class ReservedExperimentView: UIView {
    
    var selectedCell: (String, String)-> Void = {_ , _ in}

    var reservations: [ReservedModel] = []
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
        tableView.register(ReservedExperimentTableViewCell.self, forCellReuseIdentifier: "ReservedExperimentTableViewCell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    func setData(reservations: [ReservedModel]) {
        self.reservations = reservations
        experimenteTableView.reloadData()
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
extension ReservedExperimentView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReservedExperimentTableViewCell", for: indexPath) as! ReservedExperimentTableViewCell
        let cellData = reservations[indexPath.row]
        cell.setData(reserved: cellData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ReservedExperimentTableViewCell
        cell.selectionStyle = .none
        let cellData = reservations[indexPath.row]
        selectedCell(String(cellData.id), String(cellData.laboratory.id))
    }
}
