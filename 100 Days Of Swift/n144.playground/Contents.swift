import UIKit

func hi() -> [Int] {
    var n = 1
    var sol = 0
    while true {
        n += 1
        sol = n * 144
        if String(sol).suffix(3) == "144" {
            return [n, n * 144]
        }
    }
}

print(hi())
