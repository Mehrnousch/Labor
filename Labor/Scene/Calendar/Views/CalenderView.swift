//
//  CalenderView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//


import UIKit

class CalendarView: UIView {
    
    let titleView = LabelBuilder()
        .setText("Please select the desired date:", color: .darkGray, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    let timeList = ["08:00","09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00"]
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
        cv.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        cv.contentInset  = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        cv.allowsMultipleSelection = false
        cv.allowsSelection = true
        cv.isScrollEnabled = true
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    var selectedCell: (String, String)-> Void = {_, _ in}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
    }
    
    private func layout() {
        addSubview(titleView)
        addSubview(calendarCollectionView)
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            calendarCollectionView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 20),
            calendarCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            calendarCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            calendarCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Delegate & DataSource
extension CalendarView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if CalendarInformation.shared.calendarDate.isEmpty {
            return 0
        } else {
            return CalendarInformation.shared.calendarDate.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if timeList.isEmpty {
            return 0
        } else {
            return timeList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCollectionViewCell", for: indexPath) as! CalendarCollectionViewCell
        let time = timeList[indexPath.row]
        cell.setupCell(data: time)
//        cell.isSelected = false
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
//        cell.isSelected = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! SectionHeader
            
            let date = CalendarInformation.shared.calendarDate[indexPath.section]
            sectionHeader.setupCell(data: date)
            
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 64)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let padding: CGFloat =  200
      let collectionViewSize = calendarCollectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/1.76, height: collectionViewSize/2.4)
    }
    
    func createUnixTimestamp(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) -> Double {
        
        let monthCumulativeCount = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365]
        
        if year > 1969, month > 0, month < 13, day > 0, day < 32, hour > -1, hour < 24, minute > -1, minute < 60, second > -1, second < 60 {
            let yearsCount = year - 1970
            let leapDaysCount = floor(Double(yearsCount / 4))
            let daysCount = (yearsCount * 365) + Int(leapDaysCount) + monthCumulativeCount[month - 1] + (day - 1)
            let timestamp = (daysCount * 24 * 60 * 60) + (hour * 60 * 60) + (minute * 60) + second
            return Double(timestamp)
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCollectionViewCell", for: indexPath) as! CalendarCollectionViewCell
        cell.cellSelected(selected: true)
        let time = timeList[indexPath.row]
        let date = CalendarInformation.shared.calendarDate[indexPath.section]
        print("\(time)+\(date)")
        
        guard let month = Int(date.components(separatedBy: ".")[1]) else { return }
        guard let day = Int(date.components(separatedBy: ".")[0]) else { return }
        guard let hour = Int(time.replacingOccurrences(of: "0", with: "").replacingOccurrences(of: ":", with: "")) else { return }

        let startTime = createUnixTimestamp(year: CalendarInformation.shared.currentYear, month: month, day: day, hour: hour, minute: 0, second: 0)
        let endTime = createUnixTimestamp(year: CalendarInformation.shared.currentYear, month: month, day: day, hour: hour + 1, minute: 0, second: 0)

        UserDefaultsStorage.shared.startExperiment = String(startTime)
        UserDefaultsStorage.shared.endExperiment = String(endTime)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCollectionViewCell", for: indexPath) as! CalendarCollectionViewCell
        cell.cellSelected(selected: false)
    }
}
