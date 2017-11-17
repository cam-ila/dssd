class IncidentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_incident, only: [:show, :edit, :update, :destroy]

  # HOST_NAME = 'xps.local'
  # PORT = '37130'

  HOST_NAME = 'localhost'
  PORT = '8080'

  # GET /incidents
  # GET /incidents.json
  def index
    @incidents = current_user.incidents
  end

  # GET /incidents/1
  # GET /incidents/1.json
  def show
  end

  # GET /incidents/new
  def new
    @incident = Incident.new
    # @incident.replacements.build
  end

  # GET /incidents/1/edit
  def edit
  end

  # POST /incidents
  # POST /incidents.json
  def create
    @incident = Incident.create(incident_params)
    @incident.update(user: current_user)

    respond_to do |format|
      if @incident.save
        format.html { 
          client = Bonita::Client.new(username: "starter", password: "1234", url: "http://#{HOST_NAME}:#{PORT}")
          client.login

          # get process id
          response = client.connection.get "http://#{HOST_NAME}:#{PORT}/bonita/API/bpm/process?c=10&p=0"
          if response.status == 200
            parsed_response = JSON.parse(response.body)
            puts "Respuesta de procesos: #{parsed_response}"
            process_id = parsed_response.first["id"]
            puts "Id de proceso a iniciar: #{process_id}"
            puts "Id de incidente a iniciar: #{@incident.id}"

            init_response = client.connection.post "http://#{HOST_NAME}:#{PORT}/bonita/API/bpm/case" do |req|
              req.headers['Content-Type'] = 'application/json'
              hash_body =  {
                "processDefinitionId":"#{process_id}",
                "variables": [
                  { 
                    "name":"incidentId", 
                    "value":"#{@incident.id}" 
                  }
                ]
              }
              req.body = hash_body.to_json 
            end
            puts "Inicio de proceso: estado de respuesta: #{init_response.status}"
          end
          client.logout

          redirect_to @incident, notice: 'Incident was successfully created.'
        }
      else
        format.html { render :index }
      end
    end

  rescue Faraday::ConnectionFailed => e
          redirect_to @incident, notice: 'Fallo la comunicacion con Bonita BPM'
  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  def update
    respond_to do |format|
      if @incident.update(incident_params)
        format.html { redirect_to @incident, notice: 'Incident was successfully updated.' }
        format.json { render :show, status: :ok, location: @incident }
      else
        format.html { render :edit }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidents/1
  # DELETE /incidents/1.json
  def destroy
    @incident.destroy
    respond_to do |format|
      format.html { redirect_to incidents_url, notice: 'Incident was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      @incident = Incident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_params
      params.require(:incident).permit! # (:client_number, :incident_type, :description, :state)
    end
end
