
states = %w(assembled painted tested designed)
states.each_with_index do |state, index|
  Main.create!(state: state, position: index)
end


User.create!(login: 'user', password: 'user', password_confirmation: 'user')
User.create!(login: 'admin', password: 'admin', password_confirmation: 'admin', role: 'admin')
