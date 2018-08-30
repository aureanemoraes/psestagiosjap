require 'prawn'
require 'gruff'
#require 'prawn/layout'
#require 'prawn/core'
#require 'prawn/format'

module GeneratePdf
  PDF_OPTIONS = {
    # Escolhe o Page size como uma folha A4
    :page_size   => "A4",
    # Define o formato do layout como portrait (poderia ser landscape)
    :page_layout => :portrait,
    # Define a margem do documento
    :margin      => [40, 75]
  }
    
=begin
  def self.estagio estagios
    Prawn::Document.new(PDF_OPTIONS) do |pdf|
    pdf.text "Administração", :size => 10, :align => :justify, :inline_format => true
    estagios.each do |e|
      if e.area == "Administração" and e.pag == "Confirmada"
	
	pdf.text "<b>#{e.nomeformat}</b>", :size => 10, :align => :justify, :inline_format => true
	#pdf.text "Area: <b>#{e.area}</b>", :size => 10, :align => :justify, :inline_format => true
      end
    end
    pdf.render_file("public/estagio.pdf")
    end
  end
=end

  def self.estagio id, nomeformat, dtNascformat, naturalidadeformat, sexo, rg, dtEmissaoformat, orgaoEmissaoformat, cpfformat, tel1format, tel2format, email, cep, logradouroformat, num, bairroformat, cidade, estado, area, instituicao, curso, sem, durCurso, necEsp, desNecEspformat, numero_inscricao
    # Apenas uma string aleatório para termos um corpo de texto pro contrato
    #lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec elementum nulla id dignissim iaculis. Vestibulum a egestas elit, vitae feugiat velit. Vestibulum consectetur non neque sit amet tristique. Maecenas sollicitudin enim elit, in auctor ligula facilisis sit amet. Fusce imperdiet risus sed bibendum hendrerit. Sed vitae ante sit amet sapien aliquam consequat. Duis sed magna dignissim, lobortis tortor nec, suscipit velit. Nulla sit amet fringilla nisl. Integer tempor mauris vitae augue lobortis posuere. Ut quis tellus purus. Nullam dolor mauris, egestas varius ligula non, cursus faucibus orci sectetur non neque sit amet tristique. Maecenas sollicitudin enim elit, in auctor ligula facilisis sit amet. Fusce imperdiet risus sed bibendum hendrerit. Sed vitae ante sit amet sapien aliquam consequat."
    Prawn::Document.new(PDF_OPTIONS) do |pdf|
      #pdf.image "/home/aureane/Downloads/trf1.jpg"
      #image("/home/aureane/Downloads/trf1.jpg")
      # Define a cor do traçado
      pdf.fill_color "666666"
      # Cria um texto com tamanho 30 PDF Points, bold alinha no centro
      pdf.text "Ficha de Inscrição", :size => 16, :style => :bold, :align => :center
      # Move 80 PDF points para baixo o cursor
      #pdf.move_down 10
      # Escreve o texto do contrato com o tamanho de 14 PDF points, com o alinhamento justify
      #pdf.text "#{lorem_ipsum}", :size => 12, :align => :justify, :inline_format => true
      # Move mais 30 PDF points para baixo o cursor
      #pdf.move_down 30
      # Escreve o texto com os detalhes que o usuário entrou
      #pdf.text "#{details}", :size => 12, :align => :justify, :inline_format => true
      # Move mais 30 PDF points para baixo o cursor
      #pdf.move_down 10
      # Adiciona o nome com 12 PDF points, justify e com o formato inline (Observe que o <b></b> funciona para deixar em negrito)
      pdf.text "N. Inscrição: <b>#{numero_inscricao}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Nome: <b>#{nomeformat}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Data de Nascimento: <b>#{dtNascformat}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Cidade de Nascimento: <b>#{naturalidadeformat}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Sexo: <b>#{sexo}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "RG: <b>#{rg}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Data de Emissão: <b>#{dtEmissaoformat}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Orgão de Emissão: <b>#{orgaoEmissaoformat}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "CPF: <b>#{cpfformat}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Telefone 1: <b>#{tel1format}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Telefone 2: <b>#{tel2format}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "E-mail: <b>#{email}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "CEP: <b>#{cep}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Logradouro: <b>#{logradouroformat}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Número: <b>#{num}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Bairro: <b>#{bairroformat}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Cidade: <b>#{cidade}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Estado: <b>#{estado}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Área: <b>#{area}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Instituição: <b>#{instituicao}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Curso: <b>#{curso}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Duração do curso: <b>#{durCurso}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Semestre Atual: <b>#{sem}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Portador de Necessidades Especiais: <b>#{necEsp}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Descrição da necessidade para realização da prova: <b>#{desNecEspformat}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.move_down 10
      pdf.text "Declaração", :size => 16, :style => :bold, :align => :center
      pdf.text "Declaro que li o edital de regulamentação da seleção de estágio da Justiça Federal e aceito as condições estabelecidas nele.", :size => 10, :align => :justify, :inline_format => true 
      pdf.text "Declaro, ainda, que possuo os requisitos necessários para efetivar minha inscrição e que estou ciente de que, para ingressar no estágio, no ato da convoção devo <b>estar regulamente matriculado(a) e com frequência efetiva no curso.", :size => 10, :align => :justify, :inline_format => true
      pdf.text "E, por fim, estou ciente de que é de minha inteira responsabilidade acompanhar a divulgação da data e do local de aplicação da prova que serão publicados no portal (portal.trf1.jus.br/sjap) e afixados na sede da Seção Judiciária do Amapá, situada na Rodovia Norte/Sul, BR 210, 2131, Infraero II, Macapá-AP.", :size => 10, :align => :justify, :inline_format => true
      pdf.move_down 30
      pdf.text "---------------------------------------------------------------------------------------------------------------------------------", :size => 10, :align => :center, :inline_format => true
      pdf.move_down 30
      pdf.text "Comprovante de Inscrição", :size => 16, :style => :bold, :align => :center
      pdf.text "N. Inscrição: <b>#{numero_inscricao}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Nome: <b>#{nomeformat}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Área: <b>#{area}</b>", :size => 10, :align => :justify, :inline_format => true
      pdf.text "Data: ______ / ______ / ______", :size => 10, :align => :justify, :inline_format => true
      pdf.move_down 50
      pdf.text "______________________________________________________________", :size => 10, :align => :center, :inline_format => true
      pdf.text "Seção Judiciária do Amapá", :size => 10, :align => :center, :inline_format => true
      # Muda de font para Helvetica
      pdf.font "Helvetica"
      # Inclui um texto com um link clicável (usando a tag link) no bottom da folha do lado esquerdo e coloca uma cor especifica nessa parte (usando a tag color)
      #pdf.text "Link Para o Manul do Prawn clicável", :size => 10, :inline_format => true, :valign => :bottom, :align => :left
      # Inclui em baixo da folha do lado direito a data e o némero da página usando a tag page
      pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Justiça Federal do Amapá", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
      # Gera no nosso PDF e coloca na pasta public com o nome agreement.pdf
      pdf.render_file("public/fichainscricao_#{id}.pdf")
    end
  end
    
end