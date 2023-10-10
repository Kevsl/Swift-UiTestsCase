import Foundation

func findCharacter1(in input: String, target: Character) -> Bool {
    for char in input {
        if char == target {
            return true
        }
    }
    return false
}
func findCharacter2(in input: String, target: Character) -> Bool {
    return input.contains(target)
}

func findCharacter3(in input: String, target: Character) -> Bool {
    return input.firstIndex(of: target) != nil
}

