
import UIKit

class NetworkConstant {

    static let shared: NetworkConstant = NetworkConstant()

        private init() {}

       private var apiKey: String {
            return "1d936101b2126ea67c8cb29b8fa35020"
        }

    private var ts: String {
            return "1701862642.583174"
        }
    
    private var hash: String {
        return "2fb1a67eb4b5011bf58e927af8db66b1"
    }
    
    private var serverAddress: String {
        get {
            return "https://gateway.marvel.com/v1"
            
            
          ////  "https://gateway.marvel.com/v1/public/series?apikey=1d936101b2126ea67c8cb29b8fa35020&ts=1701862642.583174&hash=2fb1a67eb4b5011bf58e927af8db66b1&limit=20&offset=0"
        }
    }
    
    func getSeriesURL(limit: Int, offset: Int) -> String {

            return "\(serverAddress)/public/series?apikey=\(apiKey)&ts=\(ts)&hash=\(hash)&limit=\(limit)&offset=\(offset)"
        }
    

}
