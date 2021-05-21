require "application_system_test_case"

class SignupsTest < ApplicationSystemTestCase
  test "user signup with valid data" do
    visit '/'
  
    click_on  'Cadastre-se'
    fill_in "Nome", with: 'Xita_tester'
    fill_in "Email", with: 'tester@tester.com'
    fill_in "Senha", with: '123456'
    fill_in "Confirme Senha", with: '123456'

    click_on 'Cadastrar'

    assert_text "Cadastro realizado com sucesso"
  end
end
