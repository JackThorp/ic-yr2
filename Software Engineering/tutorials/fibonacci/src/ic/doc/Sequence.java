package ic.doc;

import java.util.Iterator;

public class Sequence implements Iterable<Integer>{
	
	
	TermGenerator termGenerator;
	
	Sequence(TermGenerator term_generator){
		termGenerator = term_generator;
	}
	
	public int term(int i) {
		return termGenerator.term(i);
	}

    public Iterator<Integer> iterator() {
        return new Iterator<Integer>() {

            private int index;

            @Override
            public boolean hasNext() {
                return true;
            }

            @Override
            public Integer next() {
                int result = term(index);
                index++;
                return result;
            }

            @Override
            public void remove() {
                throw new UnsupportedOperationException();
            }
        };
    }    

}
