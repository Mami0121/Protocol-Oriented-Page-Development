//
//  RickyMortyViewModel.swift
//  Protocol Oriented Sayfa Geliştirme
//
//  Created by Muhammet on 14.08.2022.
//

import Foundation

protocol IRickyMortyViewModel {
    func fetchItems()
    func changeLoading()
    func setDelegate (output: RickyMortyOutPut)
    
    var rickyMortyCharacters: [Result] { get set }
    var rickyMortyService: IRickyMortyeService { get }
    var rickyMortyOutPut: RickyMortyOutPut? { get }
}

final class RickyMortyViewModel: IRickyMortyViewModel {
    var rickyMortyOutPut: RickyMortyOutPut?
    var rickyMortyCharacters: [Result] = []
    private var isLoading = false;
    let rickyMortyService: IRickyMortyeService
    
    init() {
       rickyMortyService = RickyMortyService()
    }
    
    func setDelegate (output: RickyMortyOutPut) {
        rickyMortyOutPut = output
    }
    
    func fetchItems() {
        changeLoading()
        rickyMortyService.fetchAllDatas { [weak self] (response) in
            guard let content = response else { return }
            self?.changeLoading()
            self?.rickyMortyCharacters = content
            self?.rickyMortyOutPut?.saveDatas(values: self?.rickyMortyCharacters ?? [])
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        rickyMortyOutPut?.changeLoading(isLoad: isLoading)
    }
}
