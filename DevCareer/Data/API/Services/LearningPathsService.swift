//
//  LearningPathsService.swift
//  DevCareer
//
//  Created by Orisajobi Akinbola on 2/8/26.
//

import Foundation

protocol LearningPathsServiceProtocol {
    func fetchLearningPaths() async throws -> [LearningPath]
}


class LearningPathsService: LearningPathsServiceProtocol {
    
    private func loadLearningPathsFromJSON(
        fileName: String,
        bundle: Bundle = .main
    ) throws -> [LearningPath] {

        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            fatalError()
            //throw JSONLoaderError.fileNotFound
        }

        let data = try Data(contentsOf: url)

        do {
            let learningPaths = try JSONDecoder().decode(
                [LearningPath].self,
                from: data
            )
            
            return learningPaths

         //   return apiResponse.learningPaths.map(LearningPath.init)

        } catch {
            throw error //JSONLoaderError.decodingFailed(error)
        }
    }

    func fetchLearningPaths() async throws -> [LearningPath] {
        let paths = try loadLearningPathsFromJSON(fileName: "learningPaths")
       
        return paths
    }
}
