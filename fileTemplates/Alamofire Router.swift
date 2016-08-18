import Foundation
import ReactiveCocoa
import Alamofire


enum ${NAME}Router:String, ServiceRouter {
    static var service = ${NAME}.instance

//  case StatusesHomeTimeline
//  case StatusesUserTimeline
//    case PhotoInfo(Int, ImageSize)
//    case Comments(Int, Int)

    var REST: (Alamofire.Method, String, [String:AnyObject]) {
        switch self {
//      case .StatusesHomeTimeline:
//          return (.GET, "statuses/home_timeline.json", [:])
        }
    }
}