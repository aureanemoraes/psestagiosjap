class EstagioPolicy < ApplicationPolicy
  def index?
    user.admin?
  end
  
  #def permitted_attributes
  #  if user.admin?
  #    [:nome, :dtNasc, :naturalidade, :sexo, :rg, :dtEmissao, :orgaoEmissao, :cpf, :tel1, :tel2, :email, :cep, :logradouro, :num, :bairro, :cidade, :estado, :area, :instituicao, :curso, :sem,:durCurso, :necEsp, :desNecEsp, :numInsc, :pag]
  #  else
  #    [:nome, :dtNasc, :naturalidade, :sexo, :rg, :dtEmissao, :orgaoEmissao, :cpf, :tel1, :tel2, :email, :cep, :logradouro, :num, :bairro, :cidade, :estado, :area, :instituicao, :curso, :sem,:durCurso, :necEsp, :desNecEsp, :numInsc]
  #  end
  #end
  class Scope < Scope
    def resolve
      if user.try(:admin?) or user.try(:admin2?)
	      scope.all
      else
	      scope.where(user_id: user)
      end
    end
  end
end
