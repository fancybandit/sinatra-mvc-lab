
class PigLatinizer

    BLENDS = ["bl", "br", "ch", "ck", "cl", "cr", "dr", "fl", "fr", "gh", "gl", "gr", "ng", "ph", "pl", "pr", "qu", "sc", "sh", "sk", "sl", "sm", "sn", "sp", "st", "sw", "th", "tr", "tw", "wh", "wr", "nth", "sch", "scr", "shr", "spl", "spr", "squ", "str", "thr"]

    def blend?(word)
        BLENDS.select do |blend|
            word.downcase.start_with?(blend)
        end.last
    end

    def piglatinize(text)
        words = text.split(" ")

        words.map.with_index do |word, i|
           if blend?(word)
            switched_word = word.chars.rotate(blend?(word).length).join
            word = "#{switched_word}ay"
           elsif word.start_with?(/[aeiouAEIOU]/)
            word = "#{word}way"
           else
                switched_word = word.chars.rotate.join
                word = "#{switched_word}ay"
           end
        end.join(" ")
    end
    
end

