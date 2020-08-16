import UIKit
import FSCalendar


class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    
    var calendar:FSCalendar!
    var formatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        calendar = FSCalendar(frame: CGRect(x: 0.0, y:95, width: self.view.frame.size.width, height: 300.0))
        calendar.scope = .month
        //calendar.locale = Locale(identifier: "ar")
        calendar.scrollDirection = .horizontal
        self.view.addSubview(calendar)
        
        calendar.appearance.titleFont = UIFont(name: "ChalkboardSE-Regular", size: 18) //Changes numbers
        calendar.appearance.headerTitleFont = UIFont(name: "ChalkboardSE-Bold", size: 22) //Month
        calendar.appearance.weekdayFont = UIFont(name: "ChalkboardSE-Bold", size: 18) //Week
        
        calendar.appearance.todayColor = #colorLiteral(red: 0.5490196078, green: 0.537254902, blue: 0.768627451, alpha: 1) //circle on today's date
        calendar.appearance.titleTodayColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        calendar.appearance.titleDefaultColor = #colorLiteral(red: 0.6509803922, green: 0.6941176471, blue: 0.8823529412, alpha: 1)
        calendar.appearance.headerTitleColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)//month
        calendar.appearance.weekdayTextColor = #colorLiteral(red: 0.5490196078, green: 0.537254902, blue: 0.768627451, alpha: 1)//week
        calendar.appearance.borderRadius = 1
        calendar.appearance.selectionColor = #colorLiteral(red: 0.7450980392, green: 0.5411764706, blue: 0.7490196078, alpha: 1)
        self.calendar.calendarHeaderView.backgroundColor = #colorLiteral(red: 0.5490196078, green: 0.537254902, blue: 0.768627451, alpha: 1)
        self.calendar.calendarWeekdayView.backgroundColor = #colorLiteral(red: 0.7195028839, green: 0.7259525503, blue: 0.9192972716, alpha: 1)
        self.calendar.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9333333333, blue: 1, alpha: 1)
        
        calendar.dataSource = self
        calendar.delegate = self
        
        setupReveal()
        customizeNavBar()
        
        view.backgroundColor = #colorLiteral(red: 0.887048389, green: 0.8713605896, blue: 0.9383328046, alpha: 1)
    }
    
    func customizeNavBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3407768644, green: 0.3715808404, blue: 0.609811231, alpha: 1)
        self.navigationItem.title = "Calendar"
        self.navigationController!.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "ChalkboardSE-Bold", size: 19)!,
             NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
    }
    
    
    //Mark:- datasource - DO NOT NEED (Disables pressing past dates)
    //    func minimumDate(for calendar: FSCalendar) -> Date {
    //        return Date()
    //    }
    
    //Mark: - delegate
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "dd-MMM-yyyy"
        print("Date Delected = \(formatter.string(from: date))")
    }
}










