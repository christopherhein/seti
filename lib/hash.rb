# == Hash Helper
# 
# Adding the abality to do recursive symbolize on 
# multi deminsional hashes

class Hash
    
  def recursive_symbolize_keys!
    symbolize_keys!
    values.each{|h| h.recursive_symbolize_keys! if h.is_a?(Hash) }
    values.select{|v| v.is_a?(Array) }.flatten.each{|h| h.recursive_symbolize_keys! if h.is_a?(Hash) }
    self
  end

end