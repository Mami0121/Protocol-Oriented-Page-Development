//
//  RickyMortyService.swift
//  Protocol Oriented Sayfa Geliştirme
//
//  Created by Muhammet on 14.08.2022.
//

import Alamofire


enum RickyMortyServiceEndPoint: String {
case BASE_URL = "https://rickandmortyapi.com/api"
case PATH = "/character"
    
    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

protocol IRickyMortyeService {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void )
}

struct RickyMortyService: IRickyMortyeService{
    
    func fetchAllDatas(response: @escaping ([Result]?) -> Void ) {
        AF.request(RickyMortyServiceEndPoint.characterPath()).responseDecodable(of: PostModel.self) { (model)
             in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.results)
        }
    }
}

