compare_with expected do
  spec do
    it "should contain IN" do
      expect($sql.upcase).to include("IN")
    end
    
    it "should contain WHERE" do
      expect($sql.upcase).to include("WHERE")
    end
    
    it "should contain WITH" do
      expect($sql.upcase).to include("WITH")
    end
    
    it "should contain SPECIAL_SALES" do
      expect($sql.upcase).to include("SPECIAL_SALES")
    end
        
    it "should not contain EXISTS" do
      expect($sql.upcase).not_to include("EXISTS")
    end
  end
end

WITH special_sales AS (
     SELECT *
     FROM sales
     WHERE price > 90.00
)

SELECT D.id, D.name
FROM departments D
WHERE D.id IN (
      SELECT S.department_id
      FROM special_sales S
);