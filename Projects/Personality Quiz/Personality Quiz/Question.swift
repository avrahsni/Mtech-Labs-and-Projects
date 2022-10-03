//
//  Question.swift
//  Personality Quiz
//
//  Created by Snir Avrahami on 9/30/22.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var person: BibleCharacter
}

enum BibleCharacter {
    case David, Moses, Samson, Elijah
    
    var definition: String {
        switch self {
        case .David:
            return "The second king of the kingdom of Israel. You have the potential to go from rags to riches and have spent large portions of your life either being ignored or being on the run from people who refuse to ignore you.  Although you suffer injustices, you do not seek to exact unjust revenge.  You may have infidelity issues though."
        case .Moses:
            return "The greatest Israelite prophet, led the Jews out of Egypt. You are very humble, some might say the most humble.  You know how to confront your opponents, but you may sometimes doubt your importance in God's plan and seek to hide from your destiny."
        case .Samson:
            return "You are strong-willed and somewhat crass, charging into conflict head first.  You have the gall to (metaphorically) take on an army armed with only the jawbone of an ass.  You are powerful, but vulnerable in an unexpected way."
        case .Elijah:
            return "One of the great Israelite prophets, went up to heaven in a fiery charriot. To the extent that it is possible, you try to sieze the day and create your own destiny, seeing the evils of the world and attempting to right them. There might be some people in power who would try to kill you and all of your friends if you are too successful, however"
            
        }
    }
}

