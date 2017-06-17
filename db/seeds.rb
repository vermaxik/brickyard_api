
states = %w(assembled painted tested designed)
states.each_with_index do |state, index|
  Main.create!(state: state, position: index)
end
