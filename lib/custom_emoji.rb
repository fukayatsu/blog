%w(esa esa2 pplog).each do |name|
  Emoji.create(name) { |char| char.add_alias name }
end
