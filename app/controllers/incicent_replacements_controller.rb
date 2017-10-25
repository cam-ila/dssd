class IncicentReplacementsController < ApplicationController
  before_action :set_incicent_replacement, only: [:show, :edit, :update, :destroy]

  # GET /incicent_replacements
  # GET /incicent_replacements.json
  def index
    @incicent_replacements = IncicentReplacement.all
  end

  # GET /incicent_replacements/1
  # GET /incicent_replacements/1.json
  def show
  end

  # GET /incicent_replacements/new
  def new
    @incicent_replacement = IncicentReplacement.new
  end

  # GET /incicent_replacements/1/edit
  def edit
  end

  # POST /incicent_replacements
  # POST /incicent_replacements.json
  def create
    @incicent_replacement = IncicentReplacement.new(incicent_replacement_params)

    respond_to do |format|
      if @incicent_replacement.save
        format.html { redirect_to @incicent_replacement, notice: 'Incicent replacement was successfully created.' }
        format.json { render :show, status: :created, location: @incicent_replacement }
      else
        format.html { render :new }
        format.json { render json: @incicent_replacement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incicent_replacements/1
  # PATCH/PUT /incicent_replacements/1.json
  def update
    respond_to do |format|
      if @incicent_replacement.update(incicent_replacement_params)
        format.html { redirect_to @incicent_replacement, notice: 'Incicent replacement was successfully updated.' }
        format.json { render :show, status: :ok, location: @incicent_replacement }
      else
        format.html { render :edit }
        format.json { render json: @incicent_replacement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incicent_replacements/1
  # DELETE /incicent_replacements/1.json
  def destroy
    @incicent_replacement.destroy
    respond_to do |format|
      format.html { redirect_to incicent_replacements_url, notice: 'Incicent replacement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incicent_replacement
      @incicent_replacement = IncicentReplacement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incicent_replacement_params
      params.require(:incicent_replacement).permit(:description, :amount)
    end
end
