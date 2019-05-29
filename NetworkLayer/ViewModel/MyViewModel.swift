//
//  myViewModel.swift
//  NetworkLayer
//
//  Created by JETS Mobile Lab-12 on 5/29/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import Foundation
import RxSwift

class MyViewModel{
    
    let network = NetworkConnection()
    var subject = PublishSubject<[Rate]>()
    var rateObservable : Observable<[Rate]>?
    var apiUrl = "https://api.exchangeratesapi.io/latest"
    
    init() {
        rateObservable = subject.asObservable()
        fetchCodable()
    }
    
    func fetchCodable() {
        
        network.executeAPICallByCodable(urlString: apiUrl, httpMethod: HTTPMethodType.get.rawValue, parameters: nil, header: nil, successHandler:
            { [weak self] (currency : Currency) in
            let currencyList = self?.convertToRateList(currency: currency)
            }, failureHandler: { [weak self] (error) in
                print(error.localizedDescription)
        })
    }
    
    func convertToRateList(currency: Currency){
        var ratesList = [Rate]()
        for rate in currency.rates{
            var currencyRate = Rate(currency: rate.key, currencyRate: rate.value)
            ratesList.append(currencyRate)
        }
        subject.onNext(ratesList)
    }
}
