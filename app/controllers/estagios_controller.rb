class EstagiosController < ApplicationController
  before_action :set_estagio, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /estagios
  # GET /estagios.json
  def index
    @estagios = Estagio.all
  end

  # GET /estagios/1
  # GET /estagios/1.json
  def show
  end

  # GET /estagios/new
  def new
    @estagio = Estagio.new
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
        format.html { redirect_to @estagio, notice: 'Estagio was successfully created.' }
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
      if @estagio.update(estagio_params)
        format.html { redirect_to @estagio, notice: 'Estagio was successfully updated.' }
        format.json { render :show, status: :ok, location: @estagio }
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
      format.html { redirect_to estagios_url, notice: 'Estagio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estagio
      @estagio = Estagio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estagio_params
      params.require(:estagio).permit(:nome, :naturalidade, :sexo, :rg, :orgaoEmissao, :cpf, :tel1, :tel2, :email, :cep, :logradouro, :num, :bairro, :cidade, :estado, :area, :instituicao, :curso, :necEsp, :desNecEsp, :pag, :durCurso, :sem, :dtNasc, :dtEmissao)
    end
end
