`cp -r template Projects/`
print 'Enter React project name: '
project_name = gets.chomp
`mv Projects/template Projects/#{project_name}`

text = File.read("Projects/#{project_name}/package.json")
new_contents = text.gsub('template', project_name.to_s)
File.open("Projects/#{project_name}/package.json", 'w') { |file| file.puts new_contents }

text = File.read("Projects/#{project_name}/package-lock.json")
new_contents = text.gsub('template', project_name.to_s)
File.open("Projects/#{project_name}/package-lock.json", 'w') { |file| file.puts new_contents }

`cd Projects/#{project_name} && npm start`
