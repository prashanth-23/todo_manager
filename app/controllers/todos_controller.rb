class TodosController < ApplicationController
  def index
    render plain: "Hello this is todos #{DateTime.now.to_s(:long)}"
  end
end
