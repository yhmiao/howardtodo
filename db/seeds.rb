ActiveRecord::Base.transaction do
  User.create!(email: "testuser@email.com", password: "testuser", password_confirmation: "testuser", is_admin: true)

  (1..5).to_a.each do |i|
    user = User.create!(email: "testuser#{i}@email.com", password: "testuser#{i}", password_confirmation: "testuser#{i}")
    i_string = "0#{i}"[-1..1]

    (1..5).to_a.each do |j|
      j_string = "0#{j}"[-1..1]

      user.todos.create!(title: "Title#{j_string} by user#{i_string}.", body: "Body#{j_string} by user#{i_string}.")
    end
  end
end
