require 'skymorph'

key  = '|001204124410|51882.530787037|129.062741402712|4.64001695570385|128.337645|4.0726|20.70|-4.28|-11.08|n.a.|n.a.|n.a.|71.9154214757038|547.287989060186|y|'
ir   = SkyMorph::ImageRequest.new key

puts "\n===> Fetching url: #{ir.url}\n\n"
body = ir.fetch
puts body

puts "\n\n===> Parse result:"
puts SkyMorph::ImageParser.new.parse_html body