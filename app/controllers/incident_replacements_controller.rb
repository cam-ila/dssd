class IncidentReplacementsController < ApplicationController
  before_action :set_incident_replacement, only: [:show, :edit, :update, :destroy]

  # GET /incident_replacements
  # GET /incident_replacements.json
  def index
    @incident_replacements = IncidentReplacement.all
  end

  # GET /incident_replacements/1
  # GET /incident_replacements/1.json
  def show
  end

  # GET /incident_replacements/new
  def new
    @incident_replacement = IncidentReplacement.new
  end

  # GET /incident_replacements/1/edit
  def edit
  end

  # POST /incident_replacements
  # POST /incident_replacements.json
  def create
    @incident_replacement = IncidentReplacement.new(incident_replacement_params)

    respond_to do |format|
      if @incident_replacement.save
        format.html { redirect_to @incident_replacement, notice: 'Incident replacement was successfully created.' }
        format.json { render :show, status: :created, location: @incident_replacement }
      else
        format.html { render :new }
        format.json { render json: @incident_replacement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incident_replacements/1
  # PATCH/PUT /incident_replacements/1.json
  def update
    respond_to do |format|
      if @incident_replacement.update(incident_replacement_params)
        format.html { redirect_to @incident_replacement, notice: 'Incident replacement was successfully updated.' }
        format.json { render :show, status: :ok, location: @incident_replacement }
      else
        format.html { render :edit }
        format.json { render json: @incident_replacement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incident_replacements/1
  # DELETE /incident_replacements/1.json
  def destroy
    @incident_replacement.destroy
    respond_to do |format|
      format.html { redirect_to incident_replacements_url, notice: 'Incident replacement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident_replacement
      @incident_replacement = IncidentReplacement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_replacement_params
      params.require(:incident_replacement).permit(:description, :amount)
    end
end
