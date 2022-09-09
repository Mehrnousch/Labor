//
//  LabBookView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit

class LabBookView: UIView {
    
    var selectedCell: ()-> Void = {}

    var experiments: [ExperimentModel] = []
    let DetailesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.contentInset = UIEdgeInsets(top: 14,left: 0,bottom: 0,right: 0)
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
    
    func setData(experiments: [ExperimentModel]) {
        self.experiments = experiments
        DetailesTableView.reloadData()
    }

    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        DetailesTableView.delegate = self
        DetailesTableView.dataSource = self
    }
    
    func layout() {
        addSubview(DetailesTableView)
        NSLayoutConstraint.activate([
            DetailesTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            DetailesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            DetailesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            DetailesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Delegate & DataSource
extension LabBookView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experiments.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabBookTableViewCell", for: indexPath) as! LabBookTableViewCell
        let cellRow = experiments[indexPath.row]
        cell.setData(experiment: cellRow)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! LabBookTableViewCell
        cell.selectionStyle = .none
        selectedCell()
    }
}
