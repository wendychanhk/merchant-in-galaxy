module UnitValue

  def unit_to_roman(units)
    #create a hash for mapping galaxy unit to corresponding roman numerals
    units_map = {}
    units.each do |e|
      units_map.merge!(e.split(' is ').first => e.split(' is ').last)
    end
    units_map
    #units_map = {"glob"=>"I", "prok"=>"V", "pish"=>"X", "tegj"=>"L"}
  end

end
