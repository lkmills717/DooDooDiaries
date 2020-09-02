class Movement < ApplicationRecord
    belongs_to :user

    def img_url
        case self.shape.to_i
        when 1 
            "https://i.imgur.com/kliYgem.png" 
        when 2
            "https://i.imgur.com/XDzw3uN.png"
        when 3
            "https://i.imgur.com/uQRhzrV.png"
        when 4
            "https://i.imgur.com/CPQNjaP.png"
        when 5
            "https://i.imgur.com/9uVW0r5.png" 
        when 6
            "https://i.imgur.com/yiZLVyf.png" 
        when 7
            "https://i.imgur.com/mGfzmyJ.png"
        end
    end

end
