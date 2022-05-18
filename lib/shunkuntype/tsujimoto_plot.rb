require "date"
require 'rbplotly'

#require 'launchy'
x,y = [],[]
sum = 0
today=Date.today
lines=File.readlines File.join(ENV['HOME'],".shunkuntype/training_data.txt")
lines.each do | line |
    p data=line.chomp.split(',')
p   data2 = [(Date.parse(data[0])-today).to_i,data[-1].to_i]
x << data2[0]
y << sum += data2[1] / 60
end
x
y

#x = [0, 1, 2, 3, 4]
#y = [0, 2, 1, 4, 3]
trace0 = { x: x, y: y, type: :scatter, mode: :lines }
data = [trace0] # data must be an array

layout = { width: 500, height: 500 }
layout2 = { :width => 800, :height => 500 }

plot = Plotly::Plot.new(data: data) #, layout: layout2)

plot.generate_html(path: './line_chart.html', open: false)

#Launchy::Browser.run("./line_chart.html")
system("explore.exe .")


