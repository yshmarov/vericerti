class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy import_certs]

  def index
    @events = current_user.events
  end

  def show; end

  def new
    @event = current_user.events.new
  end

  def import_certs
    redirect_to(event_path(@event)) and return if params[:file].nil?

    @event.certificates.destroy_all
    CsvImportService.new.import(@event, params[:file])

    redirect_to event_path(@event), notice: 'Import done!'
  end

  def edit; end

  def create
    @event = current_user.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: 'Template created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: 'Template updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Template destroyed.' }
    end
  end

  private

  def set_event
    @event = current_user.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:certificate_template, :name, :description)
  end
end
