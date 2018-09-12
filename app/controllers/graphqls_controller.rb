class Graphqls_Controller < ApplicationController
  before_action :authenticate_by_api_token

  def create
    query_string = params[:query]
    query_variable = JSON.load(params[:variable])
    context = { current_user: current_user }
    result = Schema.execute(query_string, variable: query_variable, context: context)
    render json: result
  end
end