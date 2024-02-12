compare_with expected do
  spec do
    it "should contain TO_TSVECTOR" do
      expect($sql.upcase).to include("TO_TSVECTOR")
    end
    
    it "should contain TO_TSQUERY" do
      expect($sql.upcase).to include("TO_TSQUERY")
    end
    
    it "should not contain LIKE" do
      expect($sql.upcase).not_to include("LIKE")
    end
  end
end

SELECT *
FROM product
WHERE to_tsvector('english', name) 
   @@ to_tsquery('english', 'Awesome');