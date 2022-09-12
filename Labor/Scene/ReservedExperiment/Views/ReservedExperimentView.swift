//
//  ExperimenteView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 11.08.22.
//


import UIKit

class ReservedExperimentView: UIView {
    
    let emptyList = LabelBuilder()
        .setText("No laboratory has been reserved please press the plus button above to reserve the desired laboratory.", color: .darkGray, fontSize: AppTheme.label.maximumSize, fontWeight: .regular)
        .build()
    
    var selectedCell: (Int, String)-> Void = {_, _ in}

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
        if reservations.count > 0 {
            experimenteTableView.isHidden = false
            emptyList.isHidden = true
            self.reservations = reservations
            experimenteTableView.reloadData()
        } else {
            experimenteTableView.isHidden = true
            emptyList.isHidden = false
        }
    }

    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        experimenteTableView.delegate = self
        experimenteTableView.dataSource = self
    }
    
    func layout() {
        addSubview(emptyList)
        addSubview(experimenteTableView)
        NSLayoutConstraint.activate([
            emptyList.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            emptyList.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emptyList.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            experimenteTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
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
        selectedCell(cellData.id, cellData.laboratory.name)
    }
}
