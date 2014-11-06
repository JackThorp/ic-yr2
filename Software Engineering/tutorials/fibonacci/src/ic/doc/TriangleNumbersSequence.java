package ic.doc;

public class TriangleNumbersSequence implements TermGenerator{


	private int firstTerms = 1;
	
	public int term(int i) {
        if (i < 0) {
            throw new IllegalArgumentException("Not defined for negative terms");
        }
        if (i < firstTerms) {
            return 1;
        }
        return ((i+1)*(i+2))/2;
    } 

}
