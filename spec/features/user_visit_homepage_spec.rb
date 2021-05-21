require 'rails_helper'

RSpec.describe "User visit" do
  context "Homepage" do
    it 'successfully ' do
      visit root_path

      expect(page).to have_content('Show - Classificados')  
    end
  end
end

