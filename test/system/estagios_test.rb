require "application_system_test_case"

class EstagiosTest < ApplicationSystemTestCase
  setup do
    @estagio = estagios(:one)
  end

  test "visiting the index" do
    visit estagios_url
    assert_selector "h1", text: "Estagios"
  end

  test "creating a Estagio" do
    visit estagios_url
    click_on "New Estagio"

    fill_in "Area", with: @estagio.area
    fill_in "Bairro", with: @estagio.bairro
    fill_in "Cep", with: @estagio.cep
    fill_in "Cidade", with: @estagio.cidade
    fill_in "Cpf", with: @estagio.cpf
    fill_in "Curso", with: @estagio.curso
    fill_in "Desnecesp", with: @estagio.desNecEsp
    fill_in "Dtemissao", with: @estagio.dtEmissao
    fill_in "Dtnasc", with: @estagio.dtNasc
    fill_in "Durcurso", with: @estagio.durCurso
    fill_in "Email", with: @estagio.email
    fill_in "Estado", with: @estagio.estado
    fill_in "Instituicao", with: @estagio.instituicao
    fill_in "Logradouro", with: @estagio.logradouro
    fill_in "Naturalidade", with: @estagio.naturalidade
    fill_in "Necesp", with: @estagio.necEsp
    fill_in "Nome", with: @estagio.nome
    fill_in "Num", with: @estagio.num
    fill_in "Orgaoemissao", with: @estagio.orgaoEmissao
    fill_in "Pag", with: @estagio.pag
    fill_in "Rg", with: @estagio.rg
    fill_in "Sem", with: @estagio.sem
    fill_in "Sexo", with: @estagio.sexo
    fill_in "Tel1", with: @estagio.tel1
    fill_in "Tel2", with: @estagio.tel2
    click_on "Create Estagio"

    assert_text "Estagio was successfully created"
    click_on "Back"
  end

  test "updating a Estagio" do
    visit estagios_url
    click_on "Edit", match: :first

    fill_in "Area", with: @estagio.area
    fill_in "Bairro", with: @estagio.bairro
    fill_in "Cep", with: @estagio.cep
    fill_in "Cidade", with: @estagio.cidade
    fill_in "Cpf", with: @estagio.cpf
    fill_in "Curso", with: @estagio.curso
    fill_in "Desnecesp", with: @estagio.desNecEsp
    fill_in "Dtemissao", with: @estagio.dtEmissao
    fill_in "Dtnasc", with: @estagio.dtNasc
    fill_in "Durcurso", with: @estagio.durCurso
    fill_in "Email", with: @estagio.email
    fill_in "Estado", with: @estagio.estado
    fill_in "Instituicao", with: @estagio.instituicao
    fill_in "Logradouro", with: @estagio.logradouro
    fill_in "Naturalidade", with: @estagio.naturalidade
    fill_in "Necesp", with: @estagio.necEsp
    fill_in "Nome", with: @estagio.nome
    fill_in "Num", with: @estagio.num
    fill_in "Orgaoemissao", with: @estagio.orgaoEmissao
    fill_in "Pag", with: @estagio.pag
    fill_in "Rg", with: @estagio.rg
    fill_in "Sem", with: @estagio.sem
    fill_in "Sexo", with: @estagio.sexo
    fill_in "Tel1", with: @estagio.tel1
    fill_in "Tel2", with: @estagio.tel2
    click_on "Update Estagio"

    assert_text "Estagio was successfully updated"
    click_on "Back"
  end

  test "destroying a Estagio" do
    visit estagios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Estagio was successfully destroyed"
  end
end
