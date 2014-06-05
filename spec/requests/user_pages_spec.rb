require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.nome) }
    it { should have_title("Robobier App") }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end
  
  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Cadastrar" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
  

  describe "with valid information" do
    before { visit signup_path }

      before do
        fill_in "Email",	with: "user@example.com"
        fill_in "Password",	with: "foobar"
        fill_in "Confirmation",	with: "foobar"
        fill_in "Nome",		with: "Carlos Eduardo Nunes Alves"
        fill_in "CPF",		with: "242.642.884-87"
        fill_in "Carteira",	with: "0032"
        fill_in "Telefone",	with: "3373-9249"
        fill_in "Endereco",	with: "R. joaquim nabuco 890"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
  end
  end
end
