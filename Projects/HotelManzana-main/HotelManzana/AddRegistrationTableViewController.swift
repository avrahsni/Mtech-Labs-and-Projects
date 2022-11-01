//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Ryan Plitt on 10/26/22.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var checkinDateLabel: UILabel!
    @IBOutlet weak var checkinDatePicker: UIDatePicker!
    @IBOutlet weak var checkoutDateLabel: UILabel!
    @IBOutlet weak var checkoutDatePicker: UIDatePicker!
    
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    @IBOutlet weak var numberOfNightsLabel: UILabel!
    @IBOutlet weak var numberOfNightsDetails: UILabel!
    
    @IBOutlet weak var roomCostLabel: UILabel!
    @IBOutlet weak var RoomTypeDetails: UILabel!
    
    @IBOutlet weak var WifiCostLabel: UILabel!
    @IBOutlet weak var wifiDetails: UILabel!
    
    @IBOutlet weak var totalCostLabel: UILabel!
    
    
    
    var senderIdentifier: String = "";
    
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    let checkinDatePickerIndexPath = IndexPath(row: 1, section: 1)
    let checkoutDatePickerIndexPath = IndexPath(row: 3, section: 1)
    
    let checkinDateLabelIndexPath = IndexPath(row: 0, section: 1)
    let checkoutDateLabelIndexPath = IndexPath(row: 2, section: 1)
    
    var isCheckinDatePickerVisible: Bool = false {
        didSet {
            checkinDatePicker.isHidden = !isCheckinDatePickerVisible
        }
    }
    
    var isCheckoutDatePickerVisible: Bool = false {
        didSet {
            checkoutDatePicker.isHidden  = !isCheckoutDatePickerVisible
        }
    }
    
    var roomType: RoomType?
    
    var registration: Registration? {
        
        guard let roomType = roomType else {return nil}
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkinDate = checkinDatePicker.date
        let checkoutDate = checkoutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        
        return Registration(firstName: firstName, lastName: lastName, emailAddress: email, checkInDate: checkinDate, checkOutDate: checkoutDate, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren, roomType: roomType, wifi: hasWifi)
    }
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        let selectRoomTypeController = SelectRoomTypeTableViewController(coder: coder)
        selectRoomTypeController?.delegate = self
        selectRoomTypeController?.roomType = roomType
        return selectRoomTypeController
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: ViewController Life Cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        isDetailView = RegistrationTableViewController().findDetailView()
        
        print("isDetailView: \(isDetailView)")
//        if isDetailView {
//            IndexPath().section(5).
//        }
//        print("senderIdentifier: \(senderIdentifier)")
        
        let midnight = Calendar.current.startOfDay(for: Date())
        checkinDatePicker.minimumDate = midnight
        checkinDatePicker.date = midnight
        
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
    }
    
    // MARK: Helper Methods
    
    func updateDateViews() {
        checkinDateLabel.text = checkinDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        checkoutDateLabel.text = checkoutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        
        checkoutDatePicker.minimumDate = Calendar.current.date(byAdding:
           .day, value: 1, to: checkinDatePicker.date)
    }
    
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        } else {
            roomTypeLabel.text = "Not Set"
        }
    }
    
    // MARK: tableview delegate methods
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkinDatePickerIndexPath where isCheckinDatePickerVisible == false: return 0
        case checkoutDatePickerIndexPath where isCheckoutDatePickerVisible == false: return 0
        case IndexPath(row: 0, section: 5) where !isDetailView: return 0
        case IndexPath(row: 1, section: 5) where !isDetailView: return 0
        case IndexPath(row: 2, section: 5) where !isDetailView: return 0
        case IndexPath(row: 3, section: 5) where !isDetailView: return 0
        default: return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkinDatePickerIndexPath: return 216
        case checkoutDatePickerIndexPath: return 216
        default: return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath == checkinDateLabelIndexPath && isCheckoutDatePickerVisible == false {
            isCheckinDatePickerVisible.toggle()
        } else if indexPath == checkoutDateLabelIndexPath && isCheckinDatePickerVisible == false {
            isCheckoutDatePickerVisible.toggle()
        } else if indexPath == checkinDateLabelIndexPath || indexPath == checkoutDateLabelIndexPath {
            isCheckinDatePickerVisible.toggle()
            isCheckoutDatePickerVisible.toggle()
        } else {
            return
        }
            
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    // MARK: SelectRoom Type delegate methods
    
    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    // MARK: IBActions
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        print("DONE TAPPED")
        print("First Name: \(String(describing: firstNameTextField.text))")
        print("Last Name: \(String(describing: lastNameTextField.text))")
        print("Email: \(String(describing: emailTextField.text))")
        print("Check-in: \(checkinDatePicker.date)")
        print("Check-out: \(checkoutDatePicker.date)")
        print("numberOfAdults: \(Int(numberOfAdultsStepper.value))")
        print("numberOfChildren: \(Int(numberOfChildrenStepper.value))")
        print("wifi: \(wifiSwitch.isOn)")
        print("roomType: \(String(describing: roomType?.name))")
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        updateDateViews()
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        updateNumberOfGuests()
    }
    
    @IBAction func wifiSwitchChanged(_ sender: Any) {
        //implemented later
    }

}
