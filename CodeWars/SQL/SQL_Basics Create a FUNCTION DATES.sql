results = run_sql

describe "tests" do
  describe "should contain keywords" do
    it "should contain CREATE" do
      expect($sql.upcase).to include("CREATE")
    end
    
    it "should contain FUNCTION" do
      expect($sql.upcase).to include("FUNCTION")
    end
    
    it "should contain AGECALCULATOR" do
      expect($sql.upcase).to include("AGECALCULATOR")
    end
    
    it "should not query people table" do
      expect($sql.upcase).not_to include("PEOPLE")
    end
  end


CREATE FUNCTION agecalculator(age DATE)
RETURNS INTEGER AS $$
BEGIN
     
     RETURN date_part('year', AGE(age));
     
END $$

LANGUAGE plpgsql;