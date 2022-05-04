//
//  translateJson.swift
//  Bbetter_app
//
//  Created by 강재혁 on 2022/04/20.
//

import Foundation


// {"message":
//    {"result":{"srcLangType":"ko",
//                "tarLangType":"en",
//                "translatedText":"Hello",
//                "engineType":"N2MT",
//                "pivot":null,
//                "dict":null,
//                "tarDict":null,
//                "modelVer":"1.2.13.2|enko.2022.0319.01|koen.2022.0320.02"
//                },
//        "@type":"response",
//        "@service":"naverservice.nmt.proxy",
//        "@version":"1.0.0"}}

struct Message: Codable {
    struct Result{
        let srcLangType: String
        let tarLangType: String
        let translatedText: String
    }
    
}

