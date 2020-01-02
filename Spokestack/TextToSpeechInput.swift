//
//  TextToSpeechInput.swift
//  Spokestack
//
//  Created by Noel Weichbrodt on 11/19/19.
//  Copyright © 2019 Pylon AI, Inc. All rights reserved.
//

import Foundation

/// Designate the format the input is provided in.
@objc public enum TTSInputFormat: Int {
    @available(*, unavailable, message: "Text-only input is not currently supported. Encase your text with <speak>text</speak> for SSML compatibility.")
    /// Plain text
    case text
    /// Speech Synthesis Markup Language
    /// see https://spokestack.io/docs/Concepts/tts for the supported SSML subset.
    case ssml
}

@objc public enum TTSInputVoice: Int {
    case demoMale
}

/// Input parameters for speech synthesis. Parameters are considered transient and may change each time `synthesize` is called.
/// - SeeAlso: `TextToSpeech.synthesize`
@objc public class TextToSpeechInput: NSObject {
    
    /// Initializer for a new TextToSpeechInput instance.
    /// - Parameter input: The text input to the speech synthesizer.
    /// - Parameter voice: The synthetic voice used to generate speech.
    /// - Parameter inputFormat: The formatting of the input.
    /// - Parameter id: A unique identifier for this input request.
    @objc public init(_ input:String = "<speak>Here I am, a brain the size of a planet.</speak>",
                      voice: TTSInputVoice = .demoMale,
                      inputFormat: TTSInputFormat = .ssml,
                      id: String = UUID().description) {
        self.input = input
        self.voice = voice
        self.inputFormat = inputFormat
        self.id = id
        super.init()
    }
    
    /// The synthetic voice used to generate speech.
    @objc public var voice: TTSInputVoice = .demoMale
    /// The input to the synthetic voice.
    /// - Note: SSML should be unescaped.
    @objc public var input: String = "<speak>Here I am, a brain the size of a planet.</speak>"
    /// The formatting of the input.
    @objc public var inputFormat: TTSInputFormat = .ssml
    /// A unique identifier for this input request.
    @objc public var id: String = UUID().description
}
