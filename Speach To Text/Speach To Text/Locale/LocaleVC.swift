//
//  LocaleVC.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit
import Speech

class SelectVoiceType: UIViewController {
    
    static var shared = SelectVoiceType()
    var selectedView: Bool = true
    let locale = LocalizationVariables()
    
    var sectionTitle = [String]()
    var lan = [String]()
    var lanDict = [String: [String]]()
    
    var filter = [String]()

    var selectedIndex: IndexPath?
    
    

    lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.overrideUserInterfaceStyle = .light
        tb.backgroundColor = .clear
        
        return tb
    }()
    
    
    lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.backgroundColor = .clear
        sb.searchBarStyle = .minimal
        
        return sb
    }()
    
    lazy var doneButton = Button(type: .doneButton, locale.buttonDone)
    lazy var cancelButton = Button(type: .doneButton, locale.cancel)
    lazy var chooseVoice = Label(type: .semibold17, locale.selectLang)

    public var key = ""
    public var value = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        lan = ["Dutch (nl-BE)", "English (en-IE)", "English (en-AU)", "Vietnamese (vi-VN)", "English (en-NZ)", "Chinese Wu (wuu-CN)", "English (en-PH)", "Spanish, Latin American (es-419)", "German (de-DE)", "English (en-SG)", "French (fr-CH)", "Romanian (ro-RO)", "Greek (el-GR)", "Slovak (sk-SK)", "French (fr-CA)", "Portuguese (pt-BR)", "Chinese, Simplified (yue-CN)", "Indonesian (id-ID)", "Hindi (hi-Latn)", "Japanese (ja-JP)", "Russian (ru-RU)", "Italian (it-IT)", "Spanish (es-US)", "Hebrew (he-IL)", "English (en-ZA)", "Norwegian (nb-NO)", "Korean (ko-KR)", "Polish (pl-PL)", "English (en-ID)", "Italian (it-CH)", "Hindi (hi-IN)", "Chinese (zh-TW)", "Chinese (zh-HK)", "English (en-CA)", "Portuguese (pt-PT)", "Ukrainian (uk-UA)", "Danish (da-DK)", "Arabic (ar-SA)", "Swedish (sv-SE)", "English (en-GB)", "Spanish (es-MX)","Spanish (es-CL)", "Thai (th-TH)", "Catalan (ca-ES)", "German (de-AT)", "Croatian (hr-HR)", "Hungarian (hu-HU)", "Spanish (es-CO)", "Chinese (zh-CN)", "Czech (cs-CZ)", "Dutch (nl-NL)", "English (en-US)" , "French (fr-BE)", "German (de-CH)", "English (en-SA)", "Spanish (es-ES)", "Finnish (fi-FI)", "Malay (ms-MY)", "French (fr-FR)", "Turkish (tr-TR)", "English (en-IN)", "English (en-AE)"]
        
        lan.sort()
        
        tableView.sectionFooterHeight = 0.0;
        tableView.register(VoiceTableViewCell.self, forCellReuseIdentifier: VoiceTableViewCell.id)
        
        
        
        lanDictUpd()
        
        
        
        filter = lan
        
        setup()
        
        self.tableView.separatorColor = self.tableView.backgroundColor
    }
    
    func lanDictUpd() {
        sectionTitle = Array(Set(lan.compactMap({String($0.prefix(1))})))
        sectionTitle.sort()
        sectionTitle.forEach({lanDict[$0] = [String]()})
        lan.forEach({lanDict[String($0.prefix(1))]?.append($0)})
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

    }
}

extension SelectVoiceType: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

                    filter = searchText.isEmpty ? lan : lan.filter {
                        (item: String) -> Bool in

                        return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
                    }

        tableView.reloadData()
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return filter.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = VoiceTableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.setup(headerValue: filter[indexPath.row])
        
        if filter.count - 1 == indexPath.row {
            cell.separatorInset = UIEdgeInsets(top: 0, left: tableView.bounds.size.width, bottom: 0, right: 0)
        } else  {
            tableView.separatorColor = UIColor.systemGray
            cell.separatorInset = UIEdgeInsets(top: 0, left: 13, bottom: 0, right: 20)
        }
        
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(named: "select")
        
        
        if filter[indexPath.row].slice(from: "(", to: ")") == UserDefaults.standard.value(forKey: "langCode") as? String {
            cell.image.isHidden = false
            cell.backgroundView = backgroundView
            cell.header.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        } else {
            cell.image.isHidden = true
        }
        
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: VoiceTableViewCell.id, for: indexPath) as! VoiceTableViewCell
        
        selectedIndex = indexPath
        
        let str = filter[indexPath.row].slice(from: "(", to: ")")
        print(str) 
        
        UserDefaults.standard.setValue(str, forKey: "langCode")
        UserDefaults.standard.setValue(filter[indexPath.row], forKey: "lan")
        
        
        NotificationCenter.default.post(name: Notification.Name("langOk"), object: nil)
        
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = .clear
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.textColor = UIColor(red: 0.522, green: 0.522, blue: 0.537, alpha: 1)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

                return 0.01

        }
    
}


extension String {
    
    func slice(from: String, to: String) -> String? {
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}


extension Dictionary {
    subscript(i:Int) -> (key:Key,value:Value) {
        get {
            return self[index(startIndex, offsetBy: i)];
        }
    }
}
