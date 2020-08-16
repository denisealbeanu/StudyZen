

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeNavBar()
        // Core data initialization
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            // create alert
            let alert = UIAlertController(
                title: "Could note get app delegate",
                message: "Could note get app delegate, unexpected error occurred. Try again later.",
                preferredStyle: .alert)
            
            // add OK action
            alert.addAction(UIAlertAction(title: "OK",
                                          style: .default))
            alert.view.tintColor = .systemPink;



            // show alert
            self.present(alert, animated: true)

            return
        }
        
        view.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.9623551635, blue: 0.8285164548, alpha: 1)
        // As we know that container is set up in the AppDelegates so we need to refer that container.
        // We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // set context in the storage
        ReallySimpleNoteStorage.storage.setManagedContext(managedObjectContext: managedContext)
        
        // Do any additional setup after loading the view, typically from a nib.
        setupReveal()

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    @objc
    func insertNewObject(_ sender: Any) {
        performSegue(withIdentifier: "showCreateNoteSegue", sender: self)
    }
    
    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                //let object = objects[indexPath.row]
                let object = ReallySimpleNoteStorage.storage.readNote(at: indexPath.row)
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return objects.count
        return ReallySimpleNoteStorage.storage.count()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ReallySimpleNoteUITableViewCell

        if let object = ReallySimpleNoteStorage.storage.readNote(at: indexPath.row) {
        cell.noteTitleLabel!.text = object.noteTitle
        cell.noteTextLabel!.text = object.noteText
            cell.noteDateLabel!.text = ReallySimpleNoteDateHelper.convertDate(date: Date.init(seconds: object.noteTimeStamp))
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //objects.remove(at: indexPath.row)
            ReallySimpleNoteStorage.storage.removeNote(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    func customizeNavBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8480329949, green: 0.7161847599, blue: 0.4212287554, alpha: 1)
        self.navigationItem.title = "Daily Log"
        self.navigationController!.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "ChalkboardSE-Bold", size: 19)!,
             NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
    }


}

