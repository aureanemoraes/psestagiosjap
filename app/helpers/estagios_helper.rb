module EstagiosHelper
  def telformat(tel)
    telformat = "("
    telformat << tel[0..1]
    telformat << ") "
    telformat << tel[2..6]
    telformat << "-"
    telformat << tel[7..10]
    telformat
  end
  
  def cpfformat(cpf)
    cpfformat = cpf[0..2] << "." << cpf[3..5] << "." << cpf[6..8] << "-" << cpf[9..10]
    cpfformat
  end
  
  def dataformat(data)
    dataformat = data[0..1] << "/" << data[2..3] << "/" << data[4..7]
  end
end
