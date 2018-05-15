require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe 'check model relations' do
    it { should belong_to(:user)}
  end

  before do
    user  = create(:user) 
    @todo = create(:todo, user_id: user.id)
  end

  it 'optimistic locking did not pass.' do
    last_params = {body: @todo.body, last_updated_at: @todo.last_updated_at}

    @todo.update(body: "Laundry is boring night.")
    expect(@todo.update(last_params)).to eq(false)
  end
end
