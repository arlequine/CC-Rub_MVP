$baked_minutes = 0

class CookingTorta
		attr_reader :tiempo, :tortas
		def initialize
			@tiempo = 0
			@tortas = []
		end

		def tiempo!
			@tiempo +=1
			if @tiempo > 4
			end
				#5.times do 
					new_torta = Torta.new
					@tortas << new_torta 
				#end
			#end
		end
		def any_tortas?
			if @tortas.length > 0
				true 
			else
				false
			end
		end

		def pick_a_torta!
			raise NoTortasEror, "The tortero has not any tortas " unless self.any_tortas?
			return @tortas.pop
		end

		def time_out?
			if @tiempo >= 11
				true
			else
				false
			end

		end


		def increase_baked(min)
			$baked_minutes = $baked_minutes + min
		end

end

class Torta
		def initialize
		#	$baked_minutes = 0
		end

		def burned?
			if $baked_minutes > 10 
				 "Burned"
			elsif $baked_minutes >= 8 
				 "Listo"
			elsif $baked_minutes >= 5
				 "Casi listo"
			else
				 "Crudo"
			end
		end

end

tortero = CookingTorta.new

tortas_box = []

burned_torta = 0
almost_ready = 0
raw = 0

tortero.tiempo! until tortero.any_tortas?

puts "Is #{tortero.tiempo!} 0! Clock, and tortero begin to work."

puts ""

until tortero.time_out?

	minutes = rand(15)

	tortero.increase_baked(minutes)
	while tortero.any_tortas?
		torta = tortero.pick_a_torta!

		if torta.burned?  == "Burned"
			burned_torta =+1
		end
		if torta.burned? == "Listo"
			tortas_box << torta
		elsif torta.burned? == "Casi listo"
			 almost_ready += 1
		else
			 raw += 1
		end
	end

	puts "minutes #{tortero.tiempo} Report"
  	puts "We took #{minutes} hour(s) to pick the eggs"
  	puts "Eggs in the tortas_box: #{tortas_box.size}"
  	puts "burned tortas: #{burned_torta}"
  	puts "Almost ready tortas: #{almost_ready}"
  	puts "Raw Tortas: #{raw}"
  	puts ""

	tortero.tiempo!
end

puts "the tortero is tired he can't cook more tortas!"
puts "the tortero cook #{tortas_box.size + burned_torta + almost_ready + raw} tortas"

if burned_torta == 0
	puts "CONGRATULATION NO BURNED TORTAS"
else
	puts "we pick to late #{burned_torta} tortas so they become burned"
end