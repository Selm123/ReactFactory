`cp -r template Projects/`
print 'Enter React project name: '
app_name = gets.chomp
`mv Projects/template Projects/#{app_name}`

text = File.read("Projects/#{app_name}/package.json")
new_contents = text.gsub('template', app_name.to_s)
File.open("Projects/#{app_name}/package.json", 'w') { |file| file.puts new_contents }

text = File.read("Projects/#{app_name}/package-lock.json")
new_contents = text.gsub('template', app_name.to_s)
File.open("Projects/#{app_name}/package-lock.json", 'w') { |file| file.puts new_contents }

`mkdir Projects/#{app_name}/src/components`
`mv Projects/#{app_name}/src/App.js Projects/#{app_name}/src/components`

text = File.read("Projects/#{app_name}/src/index.js")
new_contents = text.gsub('./App', './components/App')
File.open("Projects/#{app_name}/src/index.js", 'w') { |file| file.puts new_contents }

new_contents = "
function App() {
  return (
    <div className='App'>
     <h1>#{app_name} Coming soon</h1>
    </div>
  );
}

export default App;
"
File.open("Projects/#{app_name}/src/components/App.js", 'w') { |file| file.puts new_contents }

`cd Projects/#{app_name} && npm start`
