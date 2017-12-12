class StiffenersController < ApplicationController
  before_action :set_stiffener, only: [:show, :edit, :update, :destroy]

  # GET /stiffeners
  # GET /stiffeners.json
  def index
    @stiffeners = Stiffener.all
  end

  # GET /stiffeners/1
  # GET /stiffeners/1.json
  def show
  end

  # GET /stiffeners/new
  def new
    @stiffener = Stiffener.new
    @stiffener.ibeams.build
  end

  # GET /stiffeners/1/edit
  def edit
  end

  # POST /stiffeners
  # POST /stiffeners.json
  def create
    @stiffener = Stiffener.new(stiffener_only_params)
    puts stiffener_params[:ibeams_attributes]["0"][:Type]
    Ibeam.any_in(:_id => stiffener_params[:ibeams_attributes]["0"][:Type]).update_all(:Assigned => true, :stiffener_id => @stiffener._id)
  
    respond_to do |format|
      if @stiffener.save
        format.html { redirect_to stiffeners_url, notice: 'Stiffener was successfully created.' }
        format.json { render :show, status: :created, location: @stiffener }
      else
        format.html { render :new }
        format.json { render json: @stiffener.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stiffeners/1
  # PATCH/PUT /stiffeners/1.json
  def update
    respond_to do |format|
      if @stiffener.update(stiffener_params)
        format.html { redirect_to @stiffener, notice: 'Stiffener was successfully updated.' }
        format.json { render :show, status: :ok, location: @stiffener }
      else
        format.html { render :edit }
        format.json { render json: @stiffener.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stiffeners/1
  # DELETE /stiffeners/1.json
  def destroy
    puts 'run'
    Ibeam.any_in(:stiffener_id => @stiffener._id).update_all(:Assigned => false, :stiffener_id => nil)
    @stiffener.destroy
    respond_to do |format|
      format.html { redirect_to stiffeners_url, notice: 'Stiffener was successfully destroyed.' }
      format.json { head :no_content }
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stiffener
      @stiffener = Stiffener.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stiffener_params
      params.require(:stiffener).permit(:id, :Pos, :Height, :Width, :Chamfer, :ibeams_attributes => [:_id, {:Type => []}, :_destroy])
    end
    def stiffener_only_params
      params.require(:stiffener).permit(:Pos, :Height, :Width, :Chamfer)
    end
end
