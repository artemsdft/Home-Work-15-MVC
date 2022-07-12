//
//  TableViewController.swift
//  Home Work 15 MVC
//
//  Created by Артем Дербин on 12.07.2022.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate {
    typealias DataSource = UITableViewDiffableDataSource<Sections, CellModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Sections, CellModel>
    
    private var firstSection: [CellModel] = CellModel.firstSection
    private var secondSection: [CellModel] = CellModel.secondSections
    private var thirdSection: [CellModel] = CellModel.thirdSection
    private var fourthSection: [CellModel] = CellModel.fourthSections
    private var secondaryText = "Apple ID, ICloud, контент и покупки"
    private lazy var dataSource = createDataSource()
    private lazy var tableView: UITableView = {
        var tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifire)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHierarchy()
        applySnapshot(animatingDifferences: false)
        tableView.delegate = self
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
    }
    
    private func setUpHierarchy() {
        view.addSubview(tableView)
    }
    
    func createDataSource() -> DataSource {
        let dataSource = DataSource(tableView: tableView, cellProvider: { [self](tableView, indexPath, cellModel) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifire, for: indexPath) as? TableViewCell
            cell?.configure(whith: cellModel)
            cell?.accessoryType = .disclosureIndicator
            
            if indexPath.section == 1 && indexPath.row == 0 {
                let switchView = UISwitch()
                cell?.accessoryView = switchView
            }
            
            if indexPath.row == 0 && indexPath.section == 0 {
                var content = cell?.defaultContentConfiguration()
                content?.image = UIImage(named: "avatar")
                content?.imageProperties.cornerRadius = 55
                content?.text = "Артем Дербин"
                content?.textProperties.font = .boldSystemFont(ofSize: 22)
                content?.secondaryText = secondaryText
                cell?.contentConfiguration = content
            }
            return cell
        })
        return dataSource
    }
    
    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections( Sections.allCases )
        snapshot.appendItems(firstSection, toSection: .firstSection)
        snapshot.appendItems(secondSection, toSection: .secondSection)
        snapshot.appendItems(thirdSection, toSection: .thirdSection)
        snapshot.appendItems(fourthSection, toSection: .fourthSection)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 && indexPath.section == 0 {
            return 80
        }
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sections:[[CellModel]] = [firstSection, secondSection, thirdSection, fourthSection]
        let info = sections[indexPath.section][indexPath.item].labelText
        print("Нажата ячейка \(info)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
