//
//  Jsonparser.swift
//  SwiftyHttp
//
//  Created by Albin CR on 4/22/18.
//  Copyright © 2018 CR-creation.SwiftyHttp. All rights reserved.
//

import Foundation

func parserUserDetails<T:Codable>(data:Data,model:T.Type,Success:@escaping ( _ data:[T])->(),Error:@escaping ( _ error:Error?)->()){
    
    //1 create decoder
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    //2 parse data
    var model:[T] = []
    
    do {
        let count = decoder.userInfo.count
        if count > 1{
            model = try decoder.decode([T].self, from: data)
        }else{
            model = [try decoder.decode(T.self, from: data)]
        }
        Success(model)
        return
    }
    catch DecodingError.valueNotFound(let key, let details){
        let valueNotFoundError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "key: \(key),errorMessage: \(details.debugDescription),more details: \(String(describing: details.underlyingError))"]) as Error
        Error(valueNotFoundError)
        return
    }catch DecodingError.typeMismatch(let key, let details){
        let typeMismatchError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "key: \(key),errorMessage: \(details.debugDescription),more details: \(String(describing: details.underlyingError))"]) as Error
        Error(typeMismatchError)
        return
    }catch DecodingError.keyNotFound(let key, let details){
        let keyNotFoundError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "key: \(key),errorMessage: \(details.debugDescription),more details: \(String(describing: details.underlyingError))"]) as Error
        Error(keyNotFoundError)
        return
    }catch{
        let jsonConvertError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "unable to convert json to modal"]) as Error
        Error(jsonConvertError)
        return
    }
    
}
