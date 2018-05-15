require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  login_user

  before do
    @todo_1   = create(:todo, user_id: controller.current_user.id)
    @todo_2   = create(:todo, :tuesday, user_id: controller.current_user.id)
    @log_size = ActivityLog.all.size
  end

  it "#index" do
    get :index

    expect(response).to have_http_status(200)
    expect(ActivityLog.all.size).to eq(@log_size+=1)
  end

  it '#create' do
    todo_params = {todo: {title: "Wednesday", body: "Hump day fitness."}}

    post :create, params: todo_params

    expect(response).to have_http_status(302)
    expect(Todo.count).to eq(3)
    expect(ActivityLog.all.size).to eq(@log_size+=1)
  end

  it '#update' do
    todo_params = {id: Todo.last.id, todo: {body: "Taco Tuesday is a trap!"}}

    patch :update, params: todo_params

    expect(response).to have_http_status(302)
    expect(Todo.last.body).to eq("Taco Tuesday is a trap!")
    expect(ActivityLog.all.size).to eq(@log_size+=1)
  end

  it '#destroy' do
    delete :destroy, params: {id: Todo.last.id}

    expect(response).to have_http_status(302)
    expect(Todo.count).to eq(1)
    expect(ActivityLog.all.size).to eq(@log_size+=1)
  end
end
