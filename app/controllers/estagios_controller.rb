class EstagiosController < ApplicationController
  before_action :set_estagio, only: [:show, :edit, :update, :destroy, :export]
  before_action :authenticate_user!, only: [:show, :edit, :update, :export, :exportinscritos]
  #before_action :authorize_comprovante, only: [:export]
  
  require './lib/generate_pdf'
  require './lib/inscritos_pdf'
  # GET /estagios
  # GET /estagios.json
 #'/estagios?order=ASC'
  def index
    @estagios = policy_scope(Estagio).all
    @a = 0
    #busca
    if params[:search]
      @estagios = Estagio.search(params[:search]).order("nome ASC") #ordenando em ordem afabética
    else if params[:searchpag]
      @estagios = Estagio.searchpag(params[:searchpag]).order("nome ASC") #ordenando em ordem afabética
    else if params[:searcharea]
      @estagios = Estagio.searcharea(params[:searcharea]).order("nome ASC") #ordenando em ordem afabética
    else if params[:searchsexo]
      @estagios = Estagio.searchsexo(params[:searchsexo]).order("nome ASC") #ordenando em ordem afabética
    else if params[:searchnome]
      @estagios = Estagio.searchnome(params[:searchnome]).order("nome ASC") #ordenando em ordem afabética
    else if params[:searchins]
      @estagios = Estagio.searchins(params[:searchins]).order("nome ASC") #ordenando em ordem afabética
    else
      @estagios = policy_scope(Estagio).all.order("id ASC")
    end
    end
    end
    end
    end
    end
  end

  # GET /estagios/1
  # GET /estagios/1.json
  def show
  end

  # GET /estagios/new
  def new
    if user_signed_in?
      @estagios = policy_scope(Estagio).all
      @estagio = Estagio.new
    else
    @estagio = Estagio.new
    end
  end

  # GET /estagios/1/edit
  def edit
  end

  # POST /estagios
  # POST /estagios.json
  def create
    @estagio = Estagio.new(estagio_params)
    
    respond_to do |format|
      if @estagio.save
        format.html { redirect_to @estagio, notice: 'Inscrição realizada com sucesso.' }
        format.json { render :show, status: :created, location: @estagio }
      else
        format.html { render :new }
        format.json { render json: @estagio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estagios/1
  # PATCH/PUT /estagios/1.json
  def update
    respond_to do |format|
      if @estagio.update(estagio_params_update)
        format.html {  redirect_back(fallback_location: estagios_path, notice: 'Dados atualizados com sucesso.')  }
        format.json { render :show, status: :ok, location: @estagios }
      else
        format.html { render :edit }
        format.json { render json: @estagio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estagios/1
  # DELETE /estagios/1.json
  def destroy
    @estagio.destroy
    respond_to do |format|
      format.html { redirect_to estagios_url, notice: 'Inscrição removida com sucesso.' }
      format.json { head :no_content }
    end
  end
  
  def export
    GeneratePdf::estagio(@estagio.id, @estagio.nomeformat, @estagio.dtNascformat, @estagio.naturalidadeformat, @estagio.sexo, @estagio.rg, @estagio.dtEmissaoformat, @estagio.orgaoEmissaoformat, @estagio.cpfformat, @estagio.tel1format, @estagio.tel2format, @estagio.email, @estagio.cep, @estagio.logradouroformat, @estagio.num, @estagio.bairroformat, @estagio.cidade, @estagio.estado, @estagio.area, @estagio.instituicao, @estagio.curso, @estagio.sem, @estagio.durCurso, @estagio.necEsp, @estagio.desNecEspformat, @estagio.numero_inscricao)
    redirect_to "/fichainscricao_#{@estagio.id}.pdf"
    #@estagios = policy_scope(Estagio).all.order("nome ASC")
    #GeneratePdf::estagio(Estagio.all.order("nome ASC"))
    #GeneratePdf::estagio(Estagio.all.each {|e| [e.nomeformat, e.area, e.pag]})
    #redirect_to '/estagio.pdf'
    #redirect_to "/fichainscricao_#{id}.pdf"
  end
  
  def exportinscritos
    GeneratePdfInscritos::estagio(Estagio.all.order("nome ASC"))
    redirect_to "/lista_inscritos.pdf"
  end
  #def inscritospdf
  #  Inscritos::estagio(@estagios.id, @estagios.nome, @estagios.sexo, @estagios.rg, @estagios.cpf, @estagios.area, @estagios.curso, @estagios.necEsp, @estagios.desNecEsp, @estagios.numero_inscricao)
  #  #GeneratePdf::agreement(@agreement.client_name, @agreement.description, @agreement.price)
  #  redirect_to "/listainscritos.pdf"
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estagio
      @estagio = Estagio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estagio_params
      params.require(:estagio).permit(:nome, :dtNasc, :naturalidade, :sexo, :rg, :dtEmissao, :orgaoEmissao, :cpf, :tel1, :tel2, :email, :cep, :logradouro, :num, :bairro, :cidade, :estado, :area, :instituicao, :curso, :sem,:durCurso, :necEsp, :desNecEsp, :numInsc, :pag).merge(user_id: current_user.id)
    end
    
    def estagio_params_update
      params.require(:estagio).permit(:nome, :dtNasc, :naturalidade, :sexo, :rg, :dtEmissao, :orgaoEmissao, :cpf, :tel1, :tel2, :email, :cep, :logradouro, :num, :bairro, :cidade, :estado, :area, :instituicao, :curso, :sem,:durCurso, :necEsp, :desNecEsp, :numInsc, :pag)
    end
    
    #def authorize_comprovante
    #  authorize @estagio
    #end

end
