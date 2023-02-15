FactoryBot.define do
  factory :user do
    email { "riku.itto.0114@gmail.com" }
    password { 'Itto0114' }
    password_confirmation { 'Itto0114' }
    name { "りく" }
    is_deleted { false }
  end
end