class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :meals, dependent: :destroy
  has_many :movements, dependent: :destroy
  has_one_attached :photo


  def self.hint
    hints = ["Water and fiber: These are two major components of poop that are part of your diet. Making efforts to drink more water daily can help make your bowel movements easier to pass.", "In addition, it’s important to eat foods with plenty of fiber. This adds bulk to your stool, which stimulates the bowels to move and propel your stool forward.", "Don’t incorporate too much fiber into your diet at a time — it can have an opposite, constipating effect. Instead, try to add a serving every five days to allow your digestive tract time to acclimate itself to the increased fiber.", "In addition to constipation that makes stools harder to pass, some people struggle with stool that is too loose. When this is the case, cutting out foods that can irritate the stomach can help.", "Your intestines have a natural motion that moves stool forward. If your body isn’t moving stool through fast enough, then you can help it out with increased exercise. Physical activity, such as walking, running, or swimming, can all promote motion that helps you poop better. Even short amounts of activity — 10 to 15 minutes — can help.", "Changing the angle of your legs changes the angle of your colon. Toilet footstools are one accessory that you can use in the bathroom to do this. Some people find that it helps them have a more comfortable and effective bowel movement.", "Use a Squatty Potty! Even if you don’t have a Squatty Potty or other footstool to raise your feet above the ground you can still try adjusting your posture. While you’re sitting on the toilet try planting your feet on the ground so that your knees are higher than your seat or higher than usual.", "Try to poop at the same time every day (such as in the morning at home after you eat breakfast). This can help to train your body to go at the same time in a place where you’re more comfortable.", "Go to the bathroom when you feel the need. Try to not hold it in or put off a bowel movement. If you feel the need to go, take advantage of your body’s readiness.", "Stress and pooping are highly connected. Try to create a calming environment in your bathroom where you have privacy. Avoid rushing yourself — give yourself at least 10 minutes to go to the bathroom.", "While the appearance and consistency of a person’s poop can vary from person to person, most people’s poop is formed, brown, and soft. If yours is rarely like this (such as hard or always liquid), you may want to talk to your doctor.", "Pooping shouldn’t be painful. If you frequently have bowel movements that are painful to pass or result in lots of cramping after you make them, it’s time to talk to a doctor. You could have a condition like inflammatory bowel syndrome (IBS), Crohn’s disease, or ulcerative colitis."]
    hints.sample
  end

end
