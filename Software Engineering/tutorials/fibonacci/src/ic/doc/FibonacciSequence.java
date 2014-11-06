package ic.doc;

public class FibonacciSequence implements TermGenerator{

	private int firstTerms = 2;
	
	public int term(int i) {
        if (i < 0) {
            throw new IllegalArgumentException("Not defined for negative terms");
        }
        if (i < firstTerms) {
            return 1;
        }
        return term(i-1) + term(i-2);
    }  
}
