class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :update, :destroy]


  # GET /searches
  def index
    @game_engines, @errors = Igdb::Game_engines.random(query)
    render json: @searches
  end

  # GET /searches/1
  def show
    @game_engines = Igdb::Game_engines.find(params[:id])
    render json: @search
  end

  # POST /searches
  def create
    @search = Search.new(search_params)

    if @search.save
      render json: @search, status: :created, location: @search
    else
      render json: @search.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /searches/1
  def update
    if @search.update(search_params)
      render json: @search
    else
      render json: @search.errors, status: :unprocessable_entity
    end
  end

  # DELETE /searches/1
  def destroy
    @search.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def query
      params.fetch(:query, {})
    end
    def clear_cache
  params[:clear_cache].present?
end

def refresh_params
  refresh = { clear_cache: true }
  refresh.merge!({ query: query }) if query.present?
  refresh
end

end
