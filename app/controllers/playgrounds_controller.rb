class PlaygroundsController < ApplicationController
  
  before_action :set_playground, only: [:show, :edit, :update, :destroy]
  
  respond_to :html
  
  # 404
  rescue_from ActiveRecord::RecordNotFound do |exception| 
    rescue_record_not_found(exception)
  end

  # GET /playgrounds
  # GET /playgrounds.json
  def index
    @playgrounds = Playground.all
    @json = @playgrounds.to_gmaps4rails do |playground, marker|
      @playground = playground
      marker.infowindow render_to_string(:action => 'show', :layout => false)    
      marker.json({ :id => @playground.id })
    end
  end

  # GET /playgrounds/1
  # GET /playgrounds/1.json
  def show
    respond_with(@playground, :layout =>  !request.xhr?)
  end

  # GET /playgrounds/new
  def new
    @playground = Playground.new(params[:playground].present? ? playground_params : nil)
    respond_with(@playground, :layout => !request.xhr?)
  end

  # GET /playgrounds/1/edit
  def edit
    respond_to do |format|
      format.js {}
      format.html {}
    end
  end

  # POST /playgrounds
  # POST /playgrounds.json
  def create
    @playground = Playground.new(playground_params)
    respond_to do |format|
      if @playground.save
        format.html { redirect_to @playground, notice: 'Playground was successfully created.' }
        format.js {}
      else
        format.html { render action: 'new' }
        format.js {}      
      end
    end
  end

  # PATCH/PUT /playgrounds/1
  # PATCH/PUT /playgrounds/1.json
  def update
    respond_to do |format|
      if @playground.update(playground_params)
        format.html { redirect_to @playground, notice: 'Playground was successfully updated.' }
        format.js {}  
      else
        format.html { render action: 'edit' }
        format.js {}  
      end
    end
  end

  # DELETE /playgrounds/1
  # DELETE /playgrounds/1.json
  def destroy
    @playground.destroy
    respond_to do |format|
      format.html { redirect_to playgrounds_url }
      format.js {}  
    end
  end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_playground
    @playground = Playground.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def playground_params
    params.require(:playground).permit(:name, :sport, :latitude, :longitude, :street_number, :route, :city, :country, :postal_code)
  end
  
  # Generic not found action
  def rescue_record_not_found(exception)
    respond_to do |format|
      format.html
      format.js { render :template => "playgrounds/404.js.erb", :locals => {:exception => exception} }
    end
  end
end
