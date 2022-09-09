//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Pablo Ezequiel Romero Giovannoni on 30/08/2022.
//

import Foundation
import SwiftUI


class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []

    private static func fileURL() throws -> URL {
        try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        )
        .appendingPathComponent("scrums.data")
    }

    static func load() async throws -> [DailyScrum] {
        try await withCheckedThrowingContinuation { continuation in
            load { result in
                continuation.resume(with: result)
            }
        }
    }

    static func load(completion: ((Result<[DailyScrum], Error>) -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try Self.fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion?(.success([]))
                    }
                    return
                }
                let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: file.availableData)
                    DispatchQueue.main.async {
                        completion?(.success(dailyScrums))
                    }
            } catch {
                DispatchQueue.main.async {
                    completion?(.failure(error))
                }
            }
        }
    }

    static func save(scrums: [DailyScrum]) async throws {
        try await withCheckedThrowingContinuation { continuation in
            save(scrums: scrums) { result in
                continuation.resume(with: result)
            }
        }
    }

    static func save(scrums: [DailyScrum], completion: @escaping (Result<Void, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(scrums)
                let outfile = try Self.fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(()))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }

}
