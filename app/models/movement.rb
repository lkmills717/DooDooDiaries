class Movement < ApplicationRecord
    belongs_to :user
    belongs_to :bathroom, optional: true
    validates :feeling, presence: true
    validates :effort, presence: true
    validates :duration, presence: true
    validates :color, presence: true
    validates :smell, presence: true
    validates :shape, presence: true

    include PgSearch::Model
    pg_search_scope :search_by_feeling_effort_duration_color_smell_and_shape,
      against: [ :feeling, :effort, :duration, :color, :smell, :shape, :created_at ],
      using: {
          tsearch: { prefix: true}
      }


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

    def hints

        hints = ["Water and fiber: These are two major components of poop that are part of your diet. Making efforts to drink more water daily can help make your bowel movements easier to pass.", "In addition, it’s important to eat foods with plenty of fiber. This adds bulk to your stool, which stimulates the bowels to move and propel your stool forward.", "Don’t incorporate too much fiber into your diet at a time — it can have an opposite, constipating effect. Instead, try to add a serving every five days to allow your digestive tract time to acclimate itself to the increased fiber.", "In addition to constipation that makes stools harder to pass, some people struggle with stool that is too loose. When this is the case, cutting out foods that can irritate the stomach can help.", "Your intestines have a natural motion that moves stool forward. If your body isn’t moving stool through fast enough, then you can help it out with increased exercise. Physical activity, such as walking, running, or swimming, can all promote motion that helps you poop better. Even short amounts of activity — 10 to 15 minutes — can help.", "Changing the angle of your legs changes the angle of your colon. Toilet footstools are one accessory that you can use in the bathroom to do this. Some people find that it helps them have a more comfortable and effective bowel movement.", "Use a Squatty Potty! Even if you don’t have a Squatty Potty or other footstool to raise your feet above the ground you can still try adjusting your posture. While you’re sitting on the toilet try planting your feet on the ground so that your knees are higher than your seat or higher than usual.", "Try to poop at the same time every day (such as in the morning at home after you eat breakfast). This can help to train your body to go at the same time in a place where you’re more comfortable.", "Go to the bathroom when you feel the need. Try to not hold it in or put off a bowel movement. If you feel the need to go, take advantage of your body’s readiness.", "Stress and pooping are highly connected. Try to create a calming environment in your bathroom where you have privacy. Avoid rushing yourself — give yourself at least 10 minutes to go to the bathroom.", "While the appearance and consistency of a person’s poop can vary from person to person, most people’s poop is formed, brown, and soft. If yours is rarely like this (such as hard or always liquid), you may want to talk to your doctor.", "Pooping shouldn’t be painful. If you frequently have bowel movements that are painful to pass or result in lots of cramping after you make them, it’s time to talk to a doctor. You could have a condition like inflammatory bowel syndrome (IBS), Crohn’s disease, or ulcerative colitis."]

        constipations_hints = ["Try to get at least 25 to 31 grams of fiber per day", "Increase your physical activity level.", "Always use the bathroom when you get the urge to go — don’t try and hold it.", "If constipation or diarrhea becomes your consistent stool pattern, talk to your primary care doctor. Your doctor may recommend treatments or refer you to a specialist (called a gastroenterologist) who can perform further testing."]

        healthy_hints = ["You are doing fine, keep it going!", "#fiberrules", "I don't always compliment poop, but when I do, it is about this one."]

        diarrhea_hints = ["Avoid the foods listed above that are known to irritate the stomach and cause loose stools (especially caffeine, dairy, and alcohol).", "Drink plenty of water or electrolyte-containing beverages to stay hydrated.", "Increase your fiber intake to add bulk to your stool."]

        case self.shape.to_i
        when 1
            constipations_hints.sample
        when 2
            constipations_hints.sample
        when 3
            healthy_hints.sample
        when 4
            healthy_hints.sample
        when 5
            diarrhea_hints.sample
        when 6
            diarrhea_hints.sample
        when 7
            diarrhea_hints.sample
        end
    end

end
