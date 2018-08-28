class CreateEstagios < ActiveRecord::Migration[5.2]
  def change
    create_table :estagios do |t|
      t.string :nome
      t.string :naturalidade
      t.string :sexo
      t.string :rg
      t.string :orgaoEmissao
      t.string :cpf
      t.string :tel1
      t.string :tel2
      t.string :email
      t.string :cep
      t.string :logradouro
      t.string :num
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :area
      t.string :instituicao
      t.string :curso
      t.string :necEsp
      t.string :desNecEsp
      t.string :pag
      t.string :durCurso
      t.string :sem
      t.string :dtNasc
      t.string :dtEmissao

      t.timestamps
    end
  end
end
