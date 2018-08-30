require 'prawn'
require 'gruff'
#require 'prawn/layout'
#require 'prawn/core'
#require 'prawn/format'

module GeneratePdfInscritos
  PDF_OPTIONS = {
    # Escolhe o Page size como uma folha A4
    :page_size   => "A4",
    # Define o formato do layout como portrait (poderia ser landscape)
    :page_layout => :portrait,
    # Define a margem do documento
    :margin      => [40, 75]
  }
    

  def self.estagio estagios
    Prawn::Document.new(PDF_OPTIONS) do |pdf|
      pdf.text "<b>Administração</b>", :size => 10, :align => :center, :inline_format => true
      @a = 0
      estagios.each do |e|
	if e.area == "Administração" and e.pag == "Confirmada"
	  @a = @a + 1
	  pdf.text "#{@a} #{e.nomeformat}", :size => 10, :align => :justify, :inline_format => true
	  #pdf.text "Area: <b>#{e.area}</b>", :size => 10, :align => :justify, :inline_format => true
	end
      end
      pdf.text "<b>Contabilidade</b>", :size => 10, :align => :center, :inline_format => true
      @a = 0
      estagios.each do |e|
	if e.area == "Contabilidade" and e.pag == "Confirmada"
	  @a = @a + 1
	  pdf.text "#{@a} #{e.nomeformat}", :size => 10, :align => :justify, :inline_format => true
	  #pdf.text "Area: <b>#{e.area}</b>", :size => 10, :align => :justify, :inline_format => true
	end
      end
      pdf.text "<b>Direito</b>", :size => 10, :align => :center, :inline_format => true
      @a = 0
      estagios.each do |e|
	if e.area == "Direito" and e.pag == "Confirmada"
	  @a = @a + 1
	  pdf.text "#{@a} #{e.nomeformat}", :size => 10, :align => :justify, :inline_format => true
	  #pdf.text "Area: <b>#{e.area}</b>", :size => 10, :align => :justify, :inline_format => true
	end
      end
      pdf.text "<b>Informática</b>", :size => 10, :align => :center, :inline_format => true
      @a = 0
      estagios.each do |e|
	if e.area == "Informática" and e.pag == "Confirmada"
	  @a = @a + 1
	  pdf.text "#{@a} #{e.nomeformat}", :size => 10, :align => :justify, :inline_format => true
	  #pdf.text "Area: <b>#{e.area}</b>", :size => 10, :align => :justify, :inline_format => true
	end
      end
      pdf.render_file("public/lista_inscritos.pdf")
    end
  end

 
end

