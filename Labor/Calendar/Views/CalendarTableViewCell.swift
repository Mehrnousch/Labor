//
//  CalendarTableViewCell.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//


import UIKit

class CalendarTableViewCell: UITableViewCell {

    private let calendarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
//        layout.itemSize = CGSize.init(width: 100, height: 60)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: "CalendarCollectionViewCell")
        cv.contentInset  = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        cv.allowsMultipleSelection = false
        cv.allowsSelection = true
        cv.isScrollEnabled = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .red
        return cv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellStyle()
        layout()
    }
    
    private func cellStyle() {
        contentView.backgroundColor = .white
    }
    
    func setData() {
        
    }
    
    private func layout() {
        contentView.addSubview(calendarCollectionView)
        NSLayoutConstraint.activate([
            calendarCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            calendarCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            calendarCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            calendarCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
