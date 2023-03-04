//
//  User1ViewController.swift
//  TaskUIdesigning
//
//  Created by Mac on 29/11/1944 Saka.
//

import UIKit
import SDWebImage
class User1ViewController: UIViewController {
    @IBOutlet weak var userTableView: UITableView!
    var users = [User]()
       var urlString : String?
       var url : URL?
       var urlRequest : URLRequest?
       var jsonDecoder : JSONDecoder?
       
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.delegate = self
        userTableView.dataSource = self
        let uinibName = UINib(nibName:"UserTableViewCell", bundle: nil)
    self.userTableView.register(uinibName, forCellReuseIdentifier: "UserTableViewCell")
        // Do any additional setup after loading the view.
        
          jsonPassingUsingDecoder()
           }
    func jsonPassingUsingDecoder(){
        urlString = "https://dummyjson.com/users"
        url = URL(string: urlString!)
        urlRequest = URLRequest(url: url!)
    
        URLSession.shared.dataTask(with: urlRequest!){ data,response,error in
            print(data)
            print(response)
            if(error == nil){
                do{
        self.jsonDecoder = JSONDecoder()
        let JsonResponse = try self.jsonDecoder?.decode(DataModel.self, from: data!)
            self.users = JsonResponse!.users
                }catch{
                print(error)
                }
            }
            DispatchQueue.main.async {
                self.userTableView.reloadData()
            }
        }.resume()
}
}
extension User1ViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userTableViewCell = self.userTableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        let eachObject = users[indexPath.row]
        userTableViewCell.firstNameLabel.text = eachObject.firstName
        let urlString = eachObject.image
        let url = URL(string:urlString )
        userTableViewCell.userImages.sd_setImage(with: url)
        
        return userTableViewCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0 
    }
    
}

    



