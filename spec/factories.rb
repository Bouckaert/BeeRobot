FactoryGirl.define do
  factory :user do
    nome     "Machado de Assis"
    email    "mchadoassis@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end

