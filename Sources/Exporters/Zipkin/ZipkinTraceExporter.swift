/*
 * Copyright The OpenTelemetry Authors
 * SPDX-License-Identifier: Apache-2.0
 */

import Foundation
import OpenTelemetrySdk

public class ZipkinTraceExporter: SpanExporter {
    public var options: ZipkinTraceExporterOptions
    var localEndPoint: ZipkinEndpoint
   
    public init(options: ZipkinTraceExporterOptions) {
        self.options = options
        localEndPoint = ZipkinTraceExporter.getLocalZipkinEndpoint(name: options.serviceName)
       
    }

    public func export(spans: [SpanData]) -> SpanExporterResultCode {
        guard let url = URL(string: self.options.endpoint) else { return .failure }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        options.additionalHeaders.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }

        let spans = encodeSpans(spans: spans)
        do {
            request.httpBody = try JSONEncoder().encode(spans)
        } catch {
            return .failure
        }

        var status: SpanExporterResultCode = .failure

        let sem = DispatchSemaphore(value: 0)

        let task = URLSession.shared.dataTask(with: request) { _, _, error in
            if error != nil {
                status = .failure
            } else {
                status = .success
                let timestamp = self.generateCurrentTimeStamp
                let fileName4 = "successfully_sent_spans \(timestamp)"
                self.save(text:("\(spans)"), toDirectory: self.documentDirectory(), withFileName: fileName4)
            }
            sem.signal()
        }
        task.resume()
        sem.wait()

        return status
    }

    public func flush() -> SpanExporterResultCode {
        return .success
    }

    public func shutdown() {
    }

    func encodeSpans(spans: [SpanData]) -> [ZipkinSpan] {
        return spans.map { ZipkinConversionExtension.toZipkinSpan(otelSpan: $0, defaultLocalEndpoint: localEndPoint) }
    }

    static func getLocalZipkinEndpoint(name: String? = nil) -> ZipkinEndpoint {
        let hostname = name ?? ProcessInfo.processInfo.hostName
        #if os(OSX)
        let ipv4 = Host.current().addresses.filter{ NetworkUtils.isValidIpv4Address($0) }.sorted().first
            let ipv6 = Host.current().addresses.filter { NetworkUtils.isValidIpv6Address($0) }.sorted().first
            return ZipkinEndpoint(serviceName: hostname, ipv4: ipv4, ipv6: ipv6, port: nil)
        #else
            return ZipkinEndpoint(serviceName: hostname)
        #endif
    }
    
    func generateCurrentTimeStamp () -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy_MM_dd_hh_mm_ss"
        return (formatter.string(from: Date()) as NSString) as String
    }
    
    public func documentDirectory() -> String {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                                    .userDomainMask,
                                                                    true)
        return documentDirectory[0]
    }
    public func append(toPath path: String,
                        withPathComponent pathComponent: String) -> String? {
        if var pathURL = URL(string: path) {
            pathURL.appendPathComponent(pathComponent)
            
            return pathURL.absoluteString
        }
        
        return nil
    }
    public func read(fromDocumentsWithFileName fileName: String) {
        guard let filePath = append(toPath: documentDirectory(),
                                         withPathComponent: fileName) else {
                                            return
        }
        
        do {
            let savedString = try String(contentsOfFile: filePath)
            
            print(savedString)
            
        } catch {
            print("Error reading saved file")
        }
    }
    public func save(text: String,
                      toDirectory directory: String,
                      withFileName fileName: String) {
        guard let filePath = append(toPath: directory,
                                         withPathComponent: fileName) else {
            return
        }
        print("Document directory path is \(filePath)")
        do {
            try text.write(toFile: filePath,
                           atomically: true,
                           encoding: .utf8)
        } catch {
            print("Error", error)
            return
        }
        
        print("Save successful")
    }
}
