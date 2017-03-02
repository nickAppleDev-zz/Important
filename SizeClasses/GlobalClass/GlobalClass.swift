//
//  Global.swift
//
//

import Foundation
import UIKit
import Device
import FCAlertView
import ISMessages
import AFNetworking
import Localize_Swift

struct Global {
    
    // MARK:  NSUserDefaults Keys
    static let APIBaseURL = ""
    
    // MARK:  Global Variable
    @available(iOS 10.0, *)
    static let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static let presentNavigation = UINavigationController()
    
    static let screenSize = UIScreen.main.bounds
    static var navigationController:UINavigationController = UINavigationController()
    static let kColor_Main: UIColor = UIColor(red: 76.0/255.0, green: 76.0/255.0, blue: 76.0/255.0, alpha: 1.0)

    static let TCalendarColor: CGColor = UIColor(red: 24.0/255.0, green: 122.0/255.0, blue: 167.0/255.0, alpha: 1).cgColor
    
    static var AppName: String = "TDAUX"
    static var isActivated: Bool!
    static var deviceToken: String!
    static var deviceType: String!
    static var deviceName: String!
    static var enteredPincode: String!
    static var categoryTAG: Int!
    static var isReachable: Bool!
    static var badgeNumber: Int!
    static var getFromUserDefaults: UserDefaults = UserDefaults.standard
    static var isHomeActivate: Bool!
    
    // MARK:  NSUserDefaults Keys
    
    struct UserDefaultKey {
        
        static let kAppName                = "TDAUX"
        static let kDeviceType             = "device_type"
        static let kUserStatus             = "status"
        static let kDeviceToken            = "device_token"
        static let kUserPin                = "user_pin"
    }
    
    struct NotificationCenter {
        
        static let BMSInboxPopup            = "BMSInboxPopupTag"
        static let KeyboardShow             = "UIKeyboardWillShow"
        static let KeyboardHide             = "UIKeyboardWillHide"
    }
    
    struct Category {
        static let Agent                = "Agent"
        static let Consultant           = "Consultant"
        static let Contractor           = "Contractor"
        static let Dealer               = "Dealer"
        static let Distributor          = "Distributor"
        static let LogisticPartner      = "Logistic Partner"
        static let OEMManufacturer      = "OEM Manufacturer"
        static let OEMSuppilers         = "OEM Suppliers"
        static let Retailer             = "Retailer"
        static let ServiceProvider      = "Service Provider"
        static let Stockist             = "Stockist"
        static let SubContractor        = "Sub-Contractor"
        static let Suppliers            = "Suppliers"
        static let Vendor               = "Vendor"
        static let Wholeseller          = "Wholeseller"
    }
    
    struct Theme {
        static let PartnerBG                = "PartnerBG"
        static let AddtoCategory            = "AddtoCategory"
        static let GiftSubscription         = "GiftSubscription"
        static let InviteTDAUX              = "InviteTDAUX"
        static let AddPartner               = "AddPartner"
        static let TableLine                = "TableLine"
        static let TextFieldFontColor       = "TextFieldFontColor"
        static let ListHeading              = "ListHeading"
        static let ListSmallHead            = "ListSmallHead"
        static let CalendarColor            = "CalendarColor"

    }
    
    
    // MARK:  NSUserDefaults Functions
    func saveToUserDefaults (_ value: AnyObject?, forKey key: NSString) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key as String)
        defaults.synchronize()
    }
    
    func getFromUserDefaults (_ key: NSString) -> AnyObject? {
        let defaults = UserDefaults.standard
        if(defaults.value(forKey: key as String) != nil){
            print(defaults.value(forKey: key as String)!)
        }else{
            return "" as AnyObject?
        }
        return defaults.value(forKey: key as String) as AnyObject?
    }
    
    func isKeyIsExist(dict:NSDictionary, strKey:NSString) -> Bool {
        if let _ = dict[strKey] {
            return true
        }
        print("key is not Exist")
        return false
    }
    
    // MARK:  Validation
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailText = NSPredicate(format:"SELF MATCHES [c]%@",emailRegex)
        return (emailText.evaluate(with: email))
    }
    
    func validatePhoneNumber(_ value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    func isValidatePhoneNumber(_ candidate: String) -> Bool {
        if candidate.characters.count <= 14 && candidate.characters.count >= 10
        {
            let phoneRegex: String = "[0-9]{8}([0-9]{1,3})?"
            let test: NSPredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return test.evaluate(with: candidate)
        }
        else{
            return false
        }
    }
    
    // MARK:  Remove Null Value
    func removeNull (_ str:String) -> String {
        if (str == "<null>" || str == "(null)" || str == "N/A" || str == "n/a" || str.isEmpty || str == "null") {
            return ""
        } else {
            return str
        }
    }
    
    // MARK:  Set Colors
    func setColorFromRGB (R rVal: CGFloat, G gVal: CGFloat, B bVal: CGFloat) -> UIColor {
        return UIColor(red: rVal/255.0, green: gVal/255.0, blue: bVal/255.0, alpha: 1.0)
    }
    
    // MARK:  Set Button Border
    func setbuttonBorder(button:UIButton, color: UIColor, border: CGFloat, radius: CGFloat){
        
        button.layer.cornerRadius = radius
        button.layer.borderWidth = border
        button.layer.borderColor = color.cgColor
        button.clipsToBounds = true
    }
    
    func setImageBorder(image:UIImageView, color: UIColor, border: CGFloat, radius: CGFloat){
        
        image.layer.cornerRadius = radius
        image.layer.borderWidth = border
        image.layer.borderColor = color.cgColor
        image.clipsToBounds = true
    }
    
    func setLabelBorder(label:UILabel, color: UIColor, border: CGFloat, radius: CGFloat){
        
        label.layer.cornerRadius = radius
        label.layer.borderWidth = border
        label.layer.borderColor = color.cgColor
        label.clipsToBounds = true
    }
    
    func setViewBorder(view:UIView, color: UIColor, border: CGFloat, radius: CGFloat){
        
        view.layer.cornerRadius = radius
        view.layer.borderWidth = border
        view.layer.borderColor = color.cgColor
        view.clipsToBounds = true
    }
    
    // MARK:  Device Information
    func getDeviceType(){
        
        if (Device.isPad()){
            print("It's an iPad")
            Global.deviceType = "iPad"
        }
        else if (Device.isPhone()){
            print("It's an iPhone")
            Global.deviceType = "iPhone"
        }
        else if (Device.isPod()){
            print("It's an iPod")
        }
        else if (Device.isSimulator()){
            print("It's a Simulated device")
            Global.deviceType = "iPhone"
        }
        
        self.getDevice()
    }
    
    func getDevice(){
        
        switch Device.version() {
            /*** iPhone ***/
        case .iPhone4:       Global.deviceName = "iPhone4"
        case .iPhone4S:      Global.deviceName = "iPhone4S"
        case .iPhone5:       Global.deviceName = "iPhone5"
        case .iPhone5C:      Global.deviceName = "iPhone5C"
        case .iPhone5S:      Global.deviceName = "iPhone5S"
        case .iPhone6:       Global.deviceName = "iPhone6"
        case .iPhone6S:      Global.deviceName = "iPhone6S"
        case .iPhone6Plus:   Global.deviceName = "iPhone6Plus"
        case .iPhone6SPlus:  Global.deviceName = "iPhone6SPlus"
            
            /*** iPad ***/
        case .iPad1:         Global.deviceName = "iPad1"
        case .iPad2:         Global.deviceName = "iPad2"
        case .iPad3:         Global.deviceName = "iPad3"
        case .iPad4:         Global.deviceName = "iPad4"
        case .iPadAir:       Global.deviceName = "iPadAir"
        case .iPadAir2:      Global.deviceName = "iPadAir2"
        case .iPadMini:      Global.deviceName = "iPadMini"
        case .iPadMini2:     Global.deviceName = "iPadMini2"
        case .iPadMini3:     Global.deviceName = "iPadMini3"
        case .iPadMini4:     Global.deviceName = "iPadMini4"
        case .iPadPro:       Global.deviceName = "iPadPro"
            
            /*** iPod ***/
        case .iPodTouch1Gen: print("It's a iPod touch generation 1")
        case .iPodTouch2Gen: print("It's a iPod touch generation 2")
        case .iPodTouch3Gen: print("It's a iPod touch generation 3")
        case .iPodTouch4Gen: print("It's a iPod touch generation 4")
        case .iPodTouch5Gen: print("It's a iPod touch generation 5")
        case .iPodTouch6Gen: print("It's a iPod touch generation 6")
            
            /*** Simulator ***/
        case .Simulator:    Global.deviceName = "iPhone"
            
            /*** Unknown ***/
        default:            print("It's an unknown device")
        }
    }
    
    // MARK:  Popup Animations
    func setPopupAnimation(view: UIView, isBounce: Bool){
        
        view.transform = CGAffineTransform.identity.scaledBy(x: 0.001, y: 0.001)
        UIView.animate(withDuration: 0.3/1.0, animations: {
            if isBounce
            {
                view.transform = CGAffineTransform.identity.scaledBy(x: 1.1, y: 1.1)
            }
            else
            {
                view.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1);
            }
        }, completion: {finished in
            if isBounce
            {
                UIView.animate(withDuration: 0.3/1.2, animations: {
                    view.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9);
                }, completion: {finished in
                    UIView.animate(withDuration: 0.3/1.5, animations: {
                        view.transform = CGAffineTransform.identity
                    })
                })
            }
        })
    }
    
    // MARK:  Document Directory Path
    struct directoryPath {
        static let Documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        static let Tmp = NSTemporaryDirectory()
    }
    
    //MARK:- Show Notification
    func showNotificationWithSuccess (title: String, message: String) {
        ISMessages.showCardAlert(withTitle: title, message: message, duration: 3.0, hideOnSwipe: true, hideOnTap: true, alertType: ISAlertType.success, alertPosition: ISAlertPosition.top, didHide: nil)
    }
    
    func showNotificationWithError (title: String, message: String) {
        ISMessages.showCardAlert(withTitle: title, message: message, duration: 3.0, hideOnSwipe: true, hideOnTap: true, alertType: ISAlertType.error, alertPosition: ISAlertPosition.top, didHide: nil)
    }
    
    func showNotificationWithMesage (title: String, message: String) {
        ISMessages.showCardAlert(withTitle: title, message: message, duration: 3.0, hideOnSwipe: true, hideOnTap: true, alertType: ISAlertType.success, alertPosition: ISAlertPosition.top, didHide: nil)
    }
    
    func textFieldBoarder(textField: UITextField, width: CGFloat){
        textField.layer.masksToBounds = false
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = width
    }
    
    static func randomColor() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
    
    func themeColor(color: String) -> UIColor
    {
        switch color {
        case Global.Theme.PartnerBG:            return UIColor(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1.0)
        case Global.Theme.AddtoCategory:        return UIColor(red: 50.0/255.0, green: 193.0/255.0, blue: 198.0/255.0, alpha: 1.0)
        case Global.Theme.GiftSubscription:     return UIColor(red: 224.0/255.0, green: 146.0/255.0, blue: 46.0/255.0, alpha: 1.0)
        case Global.Theme.InviteTDAUX:          return UIColor(red: 235.0/255.0, green: 184.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        case Global.Theme.AddPartner:           return UIColor(red: 70.0/255.0, green: 117.0/255.0, blue: 159.0/255.0, alpha: 1.0)
        case Global.Theme.TableLine:            return UIColor(red: 121.0/255.0, green: 192.0/255.0, blue: 198.0/255.0, alpha: 1.0)
        case Global.Theme.TextFieldFontColor:   return UIColor(red: 128.0/255.0, green: 129.0/255.0, blue: 131.0/255.0, alpha: 1.0)
        case Global.Theme.ListHeading:          return UIColor(red: 128.0/255.0, green: 129.0/255.0, blue: 131.0/255.0, alpha: 1.0)
        case Global.Theme.CalendarColor:        return UIColor(red: 24.0/255.0, green: 122.0/255.0, blue: 167.0/255.0, alpha: 1)
        default:                                return UIColor.clear
        }
    }
    
    func categoryColor(category: String) -> UIColor
    {
        switch category {
        case Global.Category.Agent:             return UIColor(red: 243.0/255.0, green: 112.0/255.0, blue: 33.0/255.0, alpha: 1.0)
        case Global.Category.Consultant:        return UIColor(red: 247.0/255.0, green: 148.0/255.0, blue: 29.0/255.0, alpha: 1.0)
        case Global.Category.Contractor:        return UIColor(red: 241.0/255.0, green: 181.0/255.0, blue: 28.0/255.0, alpha: 1.0)
        case Global.Category.Dealer:            return UIColor(red: 213.0/255.0, green: 205.0/255.0, blue: 39.0/255.0, alpha: 1.0)
        case Global.Category.Distributor:       return UIColor(red: 16.0/255.0, green: 196.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        case Global.Category.LogisticPartner:   return UIColor(red: 245.0/255.0, green: 130.0/255.0, blue: 33.0/255.0, alpha: 1.0)
        case Global.Category.OEMSuppilers:      return UIColor(red: 222.0/255.0, green: 172.0/255.0, blue: 33.0/255.0, alpha: 1.0)
        case Global.Category.OEMManufacturer:   return UIColor(red: 197.0/255.0, green: 147.0/255.0, blue: 41.0/255.0, alpha: 1.0)
        case Global.Category.Retailer:          return UIColor(red: 53.0/255.0, green: 181.0/255.0, blue: 185.0/255.0, alpha: 1.0)
        case Global.Category.Stockist:          return UIColor(red: 2.0/255.0, green: 119.0/255.0, blue: 189.0/255.0, alpha: 1.0)
        case Global.Category.ServiceProvider:   return UIColor(red: 7.0/255.0, green: 170.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        case Global.Category.SubContractor:     return UIColor(red: 0.0/255.0, green: 151.0/255.0, blue: 158.0/255.0, alpha: 1.0)
        case Global.Category.Suppliers:         return UIColor(red: 3.0/255.0, green: 155.0/255.0, blue: 229.0/255.0, alpha: 1.0)
        case Global.Category.Vendor:            return UIColor(red: 2.0/255.0, green: 136.0/255.0, blue: 209.0/255.0, alpha: 1.0)
        case Global.Category.Wholeseller:       return UIColor(red: 1.0/255.0, green: 87.0/255.0, blue: 155.0/255.0, alpha: 1.0)
        default:                                return UIColor.clear
        }
    }
    
    // MARK:  Date Formatter
    func dateFormatter() -> DateFormatter {
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter
    }
    
    func dateFormatterForDisplay() -> DateFormatter {
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        return dateFormatter
    }
    func dateFormatterForCall() -> DateFormatter {
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }
    func dateFormatterForYearOnly() -> DateFormatter {
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter
    }
    func dateFormatterForMonthINNumberOnly() -> DateFormatter {
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        return dateFormatter
    }
    func dateFormatterForDaysMonthsYears() -> DateFormatter {
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE, d LLL yyyy"
        return dateFormatter
    }
    
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

