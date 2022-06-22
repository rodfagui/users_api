class ClientsController < ApplicationController
  before_action :authorize_request
  before_action :find_client, except: %i[create index]

  # GET /users
  def index
    authorize Client
    clients = Client.all
    render json: clients, status: :ok
  end

  # GET /users/:id
  def show
    authorize Client
    render json: @client, status: :ok
  end

  # POST /users
  def create
    authorize Client
    @client = Client.new(client_params)
    if @client.save
      render json: @client, status: :created
    else
      render json: { errors: @client.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/:id
  def update
    authorize Client
    if @client.update(client_params)
      render json: @client, status: :ok
    else
      render json: { errors: @client.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    authorize Client
    @client.destroy
  end

  private

  def find_client
    @client = Client.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Client not found' }, status: :not_found
  end

  def client_params
    params.permit(
      :name, :phone_number
    )
  end
end
