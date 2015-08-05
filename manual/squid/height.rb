# By default, <code>chart</code> generates charts with a height of 200.
#
# You can use the <code>:height</code> option to manually set the height.
#
filename = File.basename(__FILE__).gsub('.rb', '.pdf')
Prawn::ManualBuilder::Example.generate(filename) do
  data = {views: {2013 => 182, 2014 => 46, 2015 => 102}}
  chart data, height: 300
end