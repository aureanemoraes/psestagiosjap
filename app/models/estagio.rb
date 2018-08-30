class Estagio < ApplicationRecord
  validate :valida_nome
  validate :valida_dtNasc
  validate :valida_naturalidade
  validate :valida_sexo
  validate :valida_rg
  validate :valida_dtEmissao
  validates_presence_of :orgaoEmissao, message: ' - Este campo deve ser preenchido.'
  validate :valida_cpf
  validates :cpf, uniqueness: {message: ' - já cadastrado'}
  validate :valida_tel1
  validate :valida_tel2
  validate :valida_email
  validate :valida_cep
  validate :valida_bairro
  validate :valida_logradouro
  validate :valida_num
  validate :valida_cidade
  validate :valida_estado
  validate :valida_area
  validate :valida_instituicao
  validate :valida_curso
  validate :valida_sem
  validate :valida_durCurso
  validate :valida_necEsp
  #validate :valida_descricaoEsp
  
  #Formataçõesi
  def numero_inscricao
    return nil unless self.persisted?

    id_com_zeros = "%04d" % self.id
    "#{id_com_zeros}#{self.created_at.year}"
  end
  
  def tel1format
    return nil unless self.persisted?
    tel1format = "(" << self.tel1[0..1] << ") " << self.tel1[2..6] << "-" << self.tel1[7..10]
    tel1format
  end
  
  def tel2format
    return nil unless self.persisted?
    tel2format = "(" << self.tel2[0..1] << ") " << self.tel2[2..6] << "-" << self.tel2[7..10]
    tel2format
  end
  
  def cpfformat
    return nil unless self.persisted?
    cpfformat = self.cpf[0..2] << "." << self.cpf[3..5] << "." << self.cpf[6..8] << "-" << self.cpf[9..10]
    cpfformat
  end
  
  def dtNascformat
    dataNascformat = self.dtNasc[0..1] << "/" << self.dtNasc[2..3] << "/" << self.dtNasc[4..7]
    dataNascformat
  end
  
  def dtEmissaoformat
    dataEmissaoformat = self.dtEmissao[0..1] << "/" << self.dtEmissao[2..3] << "/" << self.dtEmissao[4..7]
    dataEmissaoformat
  end
  
  def desNecEspformat
    if self.desNecEsp.blank?
      desNecEspformat = "Não possui"
    else
      self.desNecEsp
    end
  end
  
  def nomeformat
    nomeformat = self.nome.titleize
    nomeformat
  end
  
  def naturalidadeformat
    naturalidadeformat = self.naturalidade.titleize
    naturalidadeformat
  end
  
  def logradouroformat
    logradouroformat = self.logradouro.titleize
    logradouroformat
  end
  
  def orgaoEmissaoformat
    orgaoEmissaoformat = self.orgaoEmissao.upcase
    orgaoEmissaoformat
  end
  
  def bairroformat
    bairroformat = self.bairro.titleize
    bairroformat
  end
  
  #Formataçõesf
  
  #Validação CPFi
  def check_cpf
    return false if self.cpf.nil?

    winvalidos = %w{12345678909 11111111111 22222222222 33333333333 44444444444 55555555555 66666666666 77777777777 88888888888 99999999999 00000000000}
    wvalor = cpf.scan /[0-9]/
    if wvalor.length == 11
      unless winvalidos.member?(wvalor.join)
	wvalor = wvalor.collect{|x| x.to_i}
	wsoma = 10*wvalor[0]+9*wvalor[1]+8*wvalor[2]+7*wvalor[3]+6*wvalor[4]+5*wvalor[5]+4*wvalor[6]+3*wvalor[7]+2*wvalor[8]
	wsoma = wsoma - (11 * (wsoma/11))
	wresult1 = (wsoma == 0 or wsoma == 1) ? 0 : 11 - wsoma
	if wresult1 == wvalor[9]
	  wsoma = wvalor[0]*11+wvalor[1]*10+wvalor[2]*9+wvalor[3]*8+wvalor[4]*7+wvalor[5]*6+wvalor[6]*5+wvalor[7]*4+wvalor[8]*3+wvalor[9]*2
	  wsoma = wsoma - (11 * (wsoma/11))
	  wresult2 = (wsoma == 0 or wsoma == 1) ? 0 : 11 - wsoma
	  return true if wresult2 == wvalor[10] # CPF validado
	end
      end
    end
    return false # CPF invalidado
  end
  #Validação CPFf
  
  #Buscai
  def self.search(search)
    where("cpf LIKE ?", "%#{search}%")
  end
  
  def self.searchpag(search)
    where("pag LIKE ?", "%#{search}%") 
  end
  
  def self.searcharea(search)
    where("area LIKE ?", "%#{search}%") 
  end
  
  def self.searchsexo(search)
    where("sexo LIKE ?", "%#{search}%") 
  end
  
  def self.searchnome(search)
    where("nome LIKE ?", "%#{search}%") 
  end
  
  def self.searchins(search)
    where("id LIKE ?", "%#{search}%") 
  end
  #Buscaf
  
  private  
  def valida_nome
    if nome.blank?
      validates_presence_of :nome, message: ' deve ser preenchido.'
    else
      validates_length_of :nome, within: 5..100, too_long: ' deve possuir no máximo 100 caracteres.', too_short: 'deve possuir no mínimo 5 caracteres.'
      errors.add(:nome, " deve ter somente letras.") unless nome =~ /^[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$/
    end
  end
  
  def valida_dtNasc
    if dtNasc.blank?
      validates_presence_of :dtNasc, message: ' deve ser preenchido.'
    else
      errors.add(:dtNasc, " deve estar no formato ddMMaaaa") unless dtNasc =~ /[0-9]+$/ and dtNasc.size == 8
    end
  end
  
  def valida_naturalidade
    if naturalidade.blank?
      validates_presence_of :naturalidade, message: ' deve ser preenchido.'
    else
      validates_length_of :naturalidade, within: 3..50, too_long: ' deve possuir no máximo 50 caracteres.', too_short: ' deve possuir no mínimo 3 caracteres.'
      errors.add(:naturalidade, " deve ter somente letras.") unless naturalidade =~ /^[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$/
    end
  end
  
  def valida_sexo
    if sexo.blank?
      validates_presence_of :sexo, message: ' deve ser preenchido.'
    else
      errors.add("sexo", " - Este campo aceita somente 'Feminino' ou 'Masculino'.") unless sexo == "Feminino" or sexo == "Masculino"
    end
  end
  
  def valida_rg
    if rg.blank?
      validates_presence_of :rg, message: ' - Este campo deve ser preenchido.'
    else
      #errors.add("rg", " - Este campo deve ter somente números.") unless rg  =~ /^[\d]+$/ 
      errors.add("rg", " deve ter no máximo 20 dígitos.") unless rg.size <= 20
    end
  end
  
  def valida_dtEmissao
    if dtEmissao.blank?
      validates_presence_of :dtEmissao, message: ' - Este campo deve ser preenchido.'
    else
      errors.add("dtEmissao", " - Este campo deve estar no formato: ddMMaaaa.") unless dtEmissao.size == 8
      #errors.add("dtEmissao", " - não pode ser menor que a Data de Nascimento") unless dtEmissao < dtNasc
      #validar se a data de emissão do rg é maior que o ano de nascimento
    end
  end
  
  def valida_cpf
    if cpf.blank?
      validates_presence_of :cpf, message: ' - Este campo deve ser preenchido.'
    else
      errors.add("cpf", " - inválido") unless check_cpf == true
    end
  end
  
  def valida_tel1
    if tel1.blank?
      validates_presence_of :tel1, message: ' - Este campo deve ser preenchido.'
    else
      errors.add("tel1", " - Este campo deve estar no formato: 96900001111") unless tel1  =~ /[0-9]+$/ and tel1.size == 11
    end
  end
  
  def valida_tel2
    if tel2.blank?
      validates_presence_of :tel2, message: ' - Este campo deve ser preenchido.'
    else
      errors.add("tel2", " - Este campo deve estar no formato: 96900001111") unless tel2  =~ /[0-9]+$/  and tel2.size == 11
      #/[0-9]{2}[0-9]{4,6}[0-9]{3,4}$/
    end
  end
         
  def valida_email
    if email.blank?
      validates_presence_of :email, message: ' - Este campo deve ser preenchido.'
    else
      errors.add("email", " - Este campo deve estar no formato: e-mail@email.com") unless email =~ /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/
    end
  end
  
  def valida_cep
    if cep.blank?
      validates_presence_of :cep, message: ' - Este campo deve ser preenchido.'
    else
      errors.add("cep", " - Este campo deve estar no formato: 00111333") unless cep =~ /[0-9]{5}[0-9]{3}/ and cep.size <= 9
    end
  end
  
  def valida_bairro
    if bairro.blank?
      validates_presence_of :bairro, message: ' - Este campo deve ser preenchido.'
    else
      validates_length_of :bairro, maximum: 30, too_long: ' - Este campo deve ter no máximo 30 caracteres.'
    end
  end
  
  def valida_logradouro
    if logradouro.blank?
      validates_presence_of :logradouro, message: ' - Este campo deve ser preenchido.'
    else
      validates_length_of :logradouro, maximum: 60, too_long: ' - Este campo deve ter no máximo 60 caracteres.'
    end
  end
  
  def valida_num
    if num.blank?
      validates_presence_of :num, message: ' - Este campo deve ser preenchido.'
    else
      errors.add("num", " - Este campo deve ser preenchido com números.") unless num =~/^[\d]+$/
      validates_length_of :num, maximum: 10, too_long: ' - Este campo deve ter no máximo 10 dígitos.'
    end
  end
  
  def valida_cidade
    if cidade.blank?
      validates_presence_of :cidade, message: ' - Este campo deve ser preenchido.'
    else
      errors.add("cidade", " - Cidade inválida.") unless cidade == "Amapá" or cidade == "Calçoene" or cidade == "Cutias" or cidade == "Ferreira Gomes" or cidade == "Itaubal" or cidade == "Laranjal do Jari" or cidade == "Macapá" or cidade == "Mazagão" or cidade == "Oiapoque" or cidade == "Pedra Branca do Amapari" or cidade == "Porto Grande" or cidade == "Pracuúba" or cidade == "Santana" or cidade == "Serra do Navio" or cidade == "Tartarugalzinho" or cidade == "Vitória do Jari"
    end
  end
  
  def valida_estado
    if estado.blank?
      validates_presence_of :estado, message: ' - Este campo deve ser preenchido.'
    else
      errors.add("estado", " - Estado inválido.") unless estado == "Amapá"
    end
  end
  
  def valida_area
    if area.blank?
      validates_presence_of :area, message: ' - Este campo deve ser preenchido.'
    else
      errors.add("area", " - Área inválida.") unless area == "Administração" or area == "Contabilidade" or area == "Direito" or area == "Informática"
    end
  end
  
  def valida_instituicao
    if instituicao.blank?
      validates_presence_of :instituicao, message: ' - Este campo deve ser preenchido.'
    else
      errors.add("instituicao", " - Instituição inválida.") unless instituicao == "Ceap" or instituicao == "Fabran" or instituicao == "Fama" or instituicao == "Famap" or instituicao == "Ifap" or instituicao == "Seama" or instituicao == "Unifap"
    end
  end
  
  def valida_curso
    if curso.blank?
      validates_presence_of :curso, message: ' - Este campo deve ser preenchido.'
    else
      errors.add("curso", " - Curso inválido.") unless curso == "Administração" or curso == "Ciência da Computação" or curso == "Ciências Contábeis" or curso == "CST em Redes de Computadores" or curso == "Direito" or curso == "Gestão da Tecnologia da Informação" or curso == "Licenciatura em Informática" or curso == "Sistemas de Informação"
    end
  end
  
  def valida_sem
    if sem.blank?
      validates_presence_of :sem, message: ' - Este campo deve ser preenchido.'
    else
      errors.add("sem", " - inválido.") unless sem == "1" or sem == "2" or sem == "3" or sem == "4" or sem == "5" or sem == "6" or sem == "7" or sem == "8" or sem == "9" or sem == "10"
      #errors.add("sem", " - deve ser igual ou menor que a Duração do Curso.") unless sem <= durCurso
    end
  end
  
  def valida_durCurso
    if durCurso.blank?
      validates_presence_of :durCurso, message: ' - Este campo deve ser preenchido.'
    else
      errors.add("durCurso", " - inválida.") unless durCurso == "4" or durCurso == "5" or durCurso == "6" or durCurso == "7" or durCurso == "8" or durCurso == "9" or durCurso == "10"
      errors.add("durCurso", " - deve ser maior ou igual ao Semestre Atual") unless Integer(durCurso) >= Integer(sem)
    end
  end
  
  def valida_necEsp
    if necEsp.blank?
      validates_presence_of :necEsp, message: ' - Este campo deve ser preenchido.'
    else
      errors.add("necEsp", " - Entrada inválida.") unless necEsp == "Sim" or necEsp == "Não"
    end
  end

  #def valida_descricaoEsp
  #  errors.add("desNecEsp", " - Por favor, especifique sua necessidade para realização da prova!") unless necEsp == "Sim"
  #end
end
